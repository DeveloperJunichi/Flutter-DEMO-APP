import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/home_page.dart';
import 'package:test_app/person.dart';

void main() {
  runApp(
    // ドキュメントの翻訳
    // プロバイダは[MyApp]の内部ではなく、その上に配置されます。
    // プロバイダをモックしながら、[MyApp] を使うことができます。
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PersonModel()),
      ],
      child: const MyApp(),
    ),
  );
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
      home: const HomePage(),
    );
  }
}
