import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_drift_riverpod/util/notify/notify.dart';
import 'package:todo_drift_riverpod/view/root.dart';

void main() {
  initial_notyfy();//追加
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    start_listen(context);//追加
    return MaterialApp(
      home: Root(),
    );
  }
}