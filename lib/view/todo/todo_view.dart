import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/db/todo_db.dart';
import '../../model/freezed/todo_model.dart';
import '../../util/notify/notify.dart';
import '../../view_model/todo/todo_provider.dart';

class Todo extends HookConsumerWidget {
  const Todo({Key? key}) : super(key: key);

  List<Widget> _buildTodoList(
      List<TodoItemData> todoItemList, TodoDatabaseNotifier db) {
    List<Widget> list = [];
    for (TodoItemData item in todoItemList) {
      Widget tile = Slidable(
        child: ListTile(
          title: Text(item.title),
          subtitle:
          Text(item.limitDate == null ? "" : item.limitDate.toString()),
        ),
        endActionPane: ActionPane(
          //スライドしたときに表示されるボタン
          motion: DrawerMotion(),
          //スライドしたときのアニメーション
          children: [
            SlidableAction(
              flex: 1,
              //長さ
              onPressed: (_) {
                //押された時の処理
                db.deleteData(item);
              },
              icon: Icons.delete,
              //アイコン
            ),
            SlidableAction(
              flex: 1,
              onPressed: (_) {
                TodoItemData data = TodoItemData(
                  id: item.id,
                  title: item.title,
                  description: item.description,
                  limitDate: item.limitDate,
                  isNotify: !item.isNotify,
                );
                db.updateData(data);
              },
              icon: item.isNotify
                  ? Icons.notifications_off
                  : Icons.notifications_active,
            ),
          ],
        ),
      );
      list.add(tile);
      //listにtileを追加
    }
    return list;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoState = ref.watch(todoDatabaseProvider);
    //Providerの状態が変化したさいに再ビルドします
    final todoProvider = ref.watch(todoDatabaseProvider.notifier);
    //Providerのメソッドや値を取得します
    //bottomsheetが閉じた際に再ビルドするために使用します。
    List<TodoItemData> todoItems = todoProvider.state.todoItems;
    //Providerが保持しているtodoItemsを取得します。
    TempTodoItemData temp = TempTodoItemData();

    useEffect(() {
      make_notify_all();
    }, [todoItems]);//追加

    List<Widget> tiles = _buildTodoList(todoItems, todoProvider);
    return Scaffold(
      body: ListView(children: tiles),
      //ListViewでtilesを表示します。
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await showModalBottomSheet<void>(
            context: context,
            useRootNavigator: true,
            isScrollControlled: true,
            builder: (context2) {
              return HookConsumer(
                builder: (context3, ref, _) {
                  final limit = useState<DateTime?>(null);
                  //DatePickerが閉じた際に再ビルドするために使用します。
                  return Padding(
                    padding: MediaQuery.of(context3).viewInsets,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'タスク名',
                          ),
                          onChanged: (value) {
                            temp = temp.copyWith(title: value);
                          },
                          onSubmitted: (value) {
                            temp = temp.copyWith(title: value);
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: '説明',
                          ),
                          onChanged: (value) {
                            temp = temp.copyWith(description: value);
                          },
                          onSubmitted: (value) {
                            temp = temp.copyWith(description: value);
                          },
                        ),
                        Table(
                          defaultVerticalAlignment:
                          TableCellVerticalAlignment.values[0],
                          children: [
                            TableRow(
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    final date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(DateTime.now().year + 5),
                                    );
                                    if (date != null) {
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      );
                                      if (time != null) {
                                        limit.value = DateTime(
                                          date.year,
                                          date.month,
                                          date.day,
                                          time.hour,
                                          time.minute,
                                        );
                                        temp = temp.copyWith(limit: limit.value);
                                      }
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.calendar_today),
                                      Text(limit.value == null
                                          ? ""
                                          : limit.value
                                          .toString()
                                          .substring(0, 16)),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    todoProvider.writeData(temp);
                                    Navigator.pop(context3);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
          temp = TempTodoItemData();
        },
      ),
    );
  }
}