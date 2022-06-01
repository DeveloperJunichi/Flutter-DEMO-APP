import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<NextPage> createState() => _NextPagePageState();
}

class _NextPagePageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Nextページ'),
            OutlinedButton(
              child: const Text('戻る'),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(),
              ),
              onPressed: () {
                // 前の画面に戻る処理
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}