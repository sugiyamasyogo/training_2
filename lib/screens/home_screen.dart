import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  List<int> _soundIds = [0, 0, 0, 0, 0, 0,];

  late Soundpool _soundpool;

  @override
  void initState()  {
     _initSounds();
    _soundpool = Soundpool.fromOptions();
    super.initState();
  }

  Future<void> _initSounds() async {
    _soundpool = Soundpool.fromOptions();
    _soundIds[0] = await loadSound("assets/sounds/sound1.mp3");
    _soundIds[1] = await loadSound("assets/sounds/sound2.mp3");
    _soundIds[2] = await loadSound("assets/sounds/sound3.mp3");
    _soundIds[3] = await loadSound("assets/sounds/sound4.mp3");
    _soundIds[4] = await loadSound("assets/sounds/sound5.mp3");
    _soundIds[5] = await loadSound("assets/sounds/sound6.mp3");

    setState(() {});
  }

  Future<int> loadSound(String soundPath) {
    return rootBundle.load(soundPath).then((value) => _soundpool.load(value));
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
                  Expanded(
                      flex: 1, child: _soundButton(_texts[0], _soundIds[0])),
                  Expanded(
                      flex: 1, child: _soundButton(_texts[1], _soundIds[1])),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 1, child: _soundButton(_texts[2], _soundIds[2])),
                  Expanded(
                      flex: 1, child: _soundButton(_texts[3], _soundIds[3])),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 1, child: _soundButton(_texts[4], _soundIds[4])),
                  Expanded(
                      flex: 1, child: _soundButton(_texts[5], _soundIds[5])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _soundButton(String displayText, int soundId) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _playSound(soundId),
        child: Text(displayText),
      ),
    );
  }

  _playSound(int soundId) {
    _soundpool.play(soundId);
  }
}
