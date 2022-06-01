import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // const MyHomePage({Key? key}) : super(key: key);
  // ユーザーというコレクションを定義
  List<Map<String, dynamic>> allUser = [];

  // ユーザーのデータをAPIから取得するメソッド
  Future getAllUser() async {
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/users"));
      List data = (json.decode(response.body)
      as Map<String, dynamic>)["data"]; // MapでString, dynamic型に変換
      data.forEach((element) {
        allUser.add(element);
      });

      print(allUser);
    } catch (e) {
      print("例外処理が発生");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Future Builder"),
        ),
        body: FutureBuilder(
          // ListViewをBuilderでラップしてFutureBuilderに書き換える
            future: getAllUser(),
            builder: (context, snapshot) {
              //, snapshotを追加
              if (snapshot.connectionState == ConnectionState.waiting) {
                // 読み間でいるWidgetを表示
                return Center(
                  child: Text("LOADING ...."),
                );
              } else {
                return ListView.builder(
                    itemCount: allUser.length, // Listのデータを数える
                    itemBuilder: (context, index) => ListTile(
                      // CircleAvatarはイメージと画像を丸くしてくれる。
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        // コンソールのjsonのデータのavatarを表示
                        backgroundImage: NetworkImage(allUser[index]['avatar']),
                      ),
                      // コンソールのjsonのデータのfirst_nameとlast_nameを表示
                      title: Text("${allUser[index]['first_name']} ${allUser[index]['last_name']}"),
                      // コンソールのjsonのデータのemailを表示
                      subtitle: Text("${allUser[index]['email']}"),
                    ));
              }
            }));
  }
}