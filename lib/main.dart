import 'package:flutter/material.dart';
import 'package:test_app/next_page.dart';
// Flutterの画面遷移を行うでもアプリ
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "画面遷移をするサンプルアプリ",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('最初のページ'),
      ),
      body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage('次のページへ渡す値')));
            },
            child: Text("次のページへ移動"),
          )
      ),
    );
  }
}

