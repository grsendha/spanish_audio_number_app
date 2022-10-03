import 'package:flutter/material.dart';
import './numberAudio.dart';
import 'package:audioplayers/audio_cache.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioCache audioPlayer = AudioCache();
  List<NumberAudio> numberList = [
    NumberAudio("one.wav", Colors.red, "One"),
    NumberAudio("two.wav", Colors.blue, "Two"),
    NumberAudio("three.wav", Colors.green, "Three"),
    NumberAudio("four.wav", Colors.yellow, "Four"),
    NumberAudio("five.wav", Colors.purple, "Five"),
    NumberAudio("six.wav", Colors.brown, "Six"),
    NumberAudio("seven.wav", Colors.cyan, "Seven"),
    NumberAudio("eight.wav", Colors.pink, "Eight"),
    NumberAudio("nine.wav", Colors.grey, "Nine"),
    NumberAudio("ten.wav", Colors.deepOrange, "Ten"),
  ];

  play(String uri) {
    audioPlayer.play(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spanish Audio Number"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid, width: 4, color: Colors.red),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image(
                  image: AssetImage("images/logo.png"),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: numberList.length,
                  itemBuilder: ((context, index) => SizedBox(
                        width: 100,
                        height: 50,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: numberList[index].buttonColor,
                          child: Text(
                            numberList[index].buttonText,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            play(numberList[index].audioUri);
                          },
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
