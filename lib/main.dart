import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// 公式の英語のコメントを翻訳しております
// riverpodで実装したカウンタ例

void main() {
  runApp(
    // ProviderScopeを追加することで、プロジェクト全体でRiverpodを有効にすることができます。
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

/// プロバイダはグローバルに宣言され、状態を作成する方法を指定します。
final counterProvider = StateProvider((ref) => 0);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter example')),
      body: Center(
        // Consumerは、プロバイダを読み込むことができるウィジェットです。
        // flutter_hooksを使用している場合は、フック "useProvider" を使用することもできます。
        child: Consumer(builder: (context, watch, _) {
          final count = watch(counterProvider).state;
          return Text('$count');
        }),
      ),
      floatingActionButton: FloatingActionButton(
        // read メソッドは、プロバイダをリッスンせずに読み込むためのユーティリティです
        onPressed: () => context.read(counterProvider).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}