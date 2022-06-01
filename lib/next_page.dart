import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  // const NextPage({Key? key}) : super(key: key); コメントアウトしないとエラーが出る!
  // main.dartの引数を受け取るコンストラクター(イニシャライザーともいう) | 日本語で初期化という意味
  NextPage(this.name);
  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('次のページ'),
      ),
      // widgetを中央によせにする
      body: Center(
        // 指定したWidgetに余白と背景色を指定
        child: Column(
          // 配列をメイン軸の中央に配置
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200, // 幅が200
              height: 200, // 高さが200
              color: Colors.blue, // 色が青
              child: Text(name), // 上で定義したコンストラクターの値がここに表示される
            ),
            SizedBox(height: 20), // パーツの間に余白を作る
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("前のページへ戻る")),
          ],
        ),
      ),
    );
  }
}
