import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';

import 'other_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MaterialAppをGetMaterialAppに変更する
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(context) {

    // Get.put()を使ってクラスをインスタンス化することですべての子Routeで利用できるようになります。
    final Controller c = Get.put(Controller());

    return Scaffold(
      // countが変わるたびにTextを更新するにはObx(()=>)を使ってください。
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // 8行使っていたNavigator.pushの代わりに短い Get.to()を使ってください。context不要です。
        body: Center(child: ElevatedButton(
          // Otherページへ画面遷移するコード
            child: Text("Go to Other"), onPressed: () => Get.to(Other()))),
        // 数字が増えるボタンのコード
        floatingActionButton:
        FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Controller extends GetxController{
  var count = 0.obs;
  var name = '田中太郎'.obs;
  final list = ['apple', 'orange', 'grape'];
  increment() => count++;
}

