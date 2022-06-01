import 'package:flutter/material.dart';
// UIから分離したロジックをモデルのファイルの中に書く
class PersonModel extends ChangeNotifier {
  // String型の変数
  final String firstName = "だいき";
  final String lastName = "もりたけ";
  // int型の変数
  int age = 26;

  // ボタンが押されたら、年齢が増える関数
  void addAge() {
    age++;
    notifyListeners(); // notifyListenersを関数の中に書かないと、他のファイルでメソッド呼び出せない!
  }
}