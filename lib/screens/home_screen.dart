import 'package:flutter/material.dart';
import 'package:soundpool/soundpool.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _texts = [
    "おめでとうございます",
    "合格です",
    "よくできました",
    "残念でした",
    "不合格です",
    "がんばりましょう"
  ];

  late Soundpool _soundpool;

  @override
  void initState() {
    _soundpool = Soundpool.fromOptions();
    super.initState();
  }

  @override
  void dispose() {
    _soundpool.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ツッコミマシーン"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 1, child: _soundButton(_texts[0])),
                  Expanded(flex: 1, child: _soundButton(_texts[1])),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 1, child: _soundButton(_texts[2])),
                  Expanded(flex: 1, child: _soundButton(_texts[3])),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 1, child: _soundButton(_texts[4])),
                  Expanded(flex: 1, child: _soundButton(_texts[5])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _soundButton(String displayText) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: null,
        child: Text(displayText),
      ),
    );
  }
}
