import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_app/main.dart';

class Other extends StatelessWidget {
  // 他のページで使われているコントローラーを見つけてきてくれます。
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // 最新のcount変数の値にアクセス
    return Scaffold(
        appBar: AppBar(
          // OtherページのAppBarの色を変更しています。
          // AppBarがないと前のページに戻れなかったので、配置しました
          backgroundColor: Colors.amber,
          title: Text("次のページ"),
        ),
        body: Center(
            child: Container(
              // 縦にWidgetを並べて表示する
          child: Column(
            // 中央軸に寄せるコード。画面中央にchildrenの中のText()が表示されます。
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("int型の変数${c.count}"),
              Text("String型の変数${c.name}"),
              Text("List型の変数${c.list}"),
              Text("List型の変数の０番目${c.list[0]}"),
              Text("List型の変数の1番目${c.list[1]}"),
              Text("List型の変数の2番目${c.list[2]}"),
              ElevatedButton(onPressed: () => Get.back(), child: Text("戻るボタン"))
            ],
          ),
        )));
  }
}
