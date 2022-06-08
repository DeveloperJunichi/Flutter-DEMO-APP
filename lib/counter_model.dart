import 'package:flutter/material.dart';
// Providerで変数と関数の状態を管理するクラス
class CounterModel extends ChangeNotifier {
  // int型の変数
  int _count = 0;
  // ゲッターと呼ばれる値を渡すコード
  int get count => _count;
  // クリックするとカウンターが増える関数
  void countAdd() {
    _count++;
    notifyListeners();
  }
}