import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/person.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.watchで状態の変化を監視する。変数の値を表示するのに使われる。
    final lastName = context.watch<PersonModel>().lastName; // 苗字の変数を呼び出す
    final firstName = context.watch<PersonModel>().firstName; // 名前の変数を呼び出す
    final age = context.watch<PersonModel>().age; // 年齢の変数を呼び出す

    return Scaffold(
      appBar: AppBar(
        title: Text("Providerで状態管理"),
      ),
      body: Center(
        child: Column(
          // 配列をメイン軸の中央に配置
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 変数を表示するだけなら、$変数名
            Text('苗字は$lastName、名前は$firstName'), // 名前の変数を表示
            SizedBox(height: 20), // 配列に余白を作る
            Text('年齢は$age'), // 年齢の変数を表示
            SizedBox(height: 20), // 配列に余白を作る
            ElevatedButton(
                onPressed: () {
                  // ボタンでメソッド呼び出すときは、context.readを使う
                  context.read<PersonModel>().addAge();
                },
                child: Text('歳をとるボタン')
            ),
          ],
        ),
      ),
    );
  }
}
