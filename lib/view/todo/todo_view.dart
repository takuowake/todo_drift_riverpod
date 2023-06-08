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
    print('todoItemList: $todoItemList');
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
                  // limitという状態変数を初期化
                  // useStateフックは、初期値として与えられた値と、その値を更新するための関数を返す
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
                          // Table内のセルのデフォルトの配置が上端になる
                          defaultVerticalAlignment:
                          TableCellVerticalAlignment.values[0],
                          children: [
                            TableRow(
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    // 日付選択のダイアログを表示
                                    final date = await showDatePicker(
                                      // ダイアログを表示するためのcontext
                                      context: context,
                                      // ダイアログが始めに表示する日付は現在
                                      initialDate: DateTime.now(),
                                      // ユーザーが選択できる最初の日付（つまり、この日付以前は選択できない）
                                      firstDate: DateTime.now(),
                                      // ユーザーが選択できる最後の日付
                                      lastDate: DateTime(DateTime.now().year + 5),
                                    );
                                    // dateがnullでなければ...
                                    if (date != null) {
                                      // 時刻選択のダイアログを表示
                                      final time = await showTimePicker(
                                        context: context,
                                        // ダイアログが初期状態で表示する時間は現在
                                        initialTime: TimeOfDay.now(),
                                      );
                                      // ユーザーが時間を設定した場合に実行
                                      if (time != null) {
                                        // 選択された日付と時間を使用して新しいDateTimeオブジェクトが作成される
                                        // そして、limit変数のvalueプロパティに代入される
                                        limit.value = DateTime(
                                          date.year,
                                          date.month,
                                          date.day,
                                          time.hour,
                                          time.minute,
                                        );
                                        // temp変数のlimitプロパティが選択された日付と時間に更新される
                                        temp = temp.copyWith(limit: limit.value);
                                      }
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.calendar_today),
                                      // limit.valueの値がnullかどうかチェック
                                      Text(limit.value == null
                                      // もし limit.value が null であれば、テキストは空文字列
                                          ? ""
                                      // もし limit.value が null でなければ、limit.value を文字列に変換し、その先頭から16文字までの部分文字列を取得
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