import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/counter_model.dart';
// ChangeNotifierProviderを使ったカウンターアプリ
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ChangeNotifierProviderでMyHomePageをラップして、Providerを使えるようにする
      home: ChangeNotifierProvider<CounterModel>(
        create: (context) => CounterModel(),
          child: const MyHomePage()),
    );
  }
}
// StatelessWidgetは状態を持たないので、画面を作るだけ。ロジックはProviderを使って呼び出す。
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Providerをこのページで呼び出すために書く変数。
    final countModel = Provider.of<CounterModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Providerを使ったカンターアプリ"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ここで、Provider.of<CounterModel>(context).countと書かれていて、他のページから状態をもった変数を呼び出す。
              Text('カウンター変数${countModel.count}', style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
      ),
      // 画面右下のプラスボタン
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ここで、Provider.of<CounterModel>(context).countAdd();と書かれていて、他のページから状態をもった関数を呼び出す。
          countModel.countAdd();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


