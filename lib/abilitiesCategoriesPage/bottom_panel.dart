import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get_storage/get_storage.dart';
import 'package:abilities_book/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomPanelScreen extends StatefulWidget {
  final abiName;
  final abiLink;
  final abiDesc;
  BottomPanelScreen({
    Key? key,
    this.abiName,
    this.abiLink,
    this.abiDesc,
  }) : super(key: key);

  @override
  State<BottomPanelScreen> createState() => _BottomPanelScreenState();
}

class _BottomPanelScreenState extends State<BottomPanelScreen> {
  final congratulationsText = const [
    "GRATULACJE",
    "BRAWO",
    "WOOOW",
    "SUPER",
    "EKSTRA"
  ];

  final confettiController = ConfettiController(duration: const Duration(seconds: 1));

  bool isConfRaining = false;

  @override
  void initState(){
    super.initState();
    confettiController.addListener(() {
      setState((){
        isConfRaining = confettiController.state == ConfettiControllerState.playing;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    confettiController.dispose();
  }

  Widget build(BuildContext context) {
    var currentAbiList = pref!.getStringList('colected') ?? [];
    var currentLinkList = pref!.getStringList('links') ?? [];
    var currentDescList = pref!.getStringList('desc') ?? [];
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -15,
          child: Container(
            width: 60,
            height: 7,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 56, 176, 0),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.abiName.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: Image.asset(
                widget.abiLink.toString(),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15, bottom: 20, right: 15, top: 10),
              child: Text(
                widget.abiDesc.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            ConfettiWidget(
              confettiController: confettiController,
              shouldLoop: false,
              blastDirection: -pi / 2,
              blastDirectionality: BlastDirectionality.directional,
              emissionFrequency: 0.05,
              numberOfParticles: 10,
              minBlastForce: 3,
              maxBlastForce: 6,
              gravity: 0.5,
              createParticlePath: (size){
                final path = Path();
                path.addOval(Rect.fromCircle(center: Offset.zero,
                    radius: 10));
                return path;
              },
              colors: const[
                Colors.red,
                Colors.pink,
                Colors.green,
                Colors.yellow,
                Colors.blue,
                Colors.purple,
                Colors.deepOrange,
                Colors.tealAccent
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (currentAbiList.contains(widget.abiName.toString())) {
                  Fluttertoast.showToast(
                      msg: "Ta sprawność jest już zdobyta",
                    backgroundColor: Colors.grey.shade800,
                    fontSize: 15,
                    gravity: ToastGravity.BOTTOM,
                    textColor: Colors.white,
                  );
                } else {
                  currentAbiList.add(widget.abiName);
                  currentLinkList.add(widget.abiLink);
                  currentDescList.add(widget.abiDesc);
                  pref!.setStringList('colected', currentAbiList);
                  pref!.setStringList('links', currentLinkList);
                  pref!.setStringList('desc', currentDescList);
                  //print(pref!.getStringList('colected'));
                  var random = new Random();
                  var nr = random.nextInt(congratulationsText.length);
                 // Navigator.pop(context);
                  Fluttertoast.showToast(
                    msg: congratulationsText[nr],
                    backgroundColor: Color.fromARGB(255, 56, 176, 0),
                    fontSize: 15,
                    gravity: ToastGravity.BOTTOM,
                    textColor: Colors.white,
                  );
                  if(isConfRaining){
                    confettiController.stop();
                  } else {
                    confettiController.play();
                  }
                }
              },
              child: currentAbiList.contains(widget.abiName.toString())
                  ? Text(
                      "Zdobyta",
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    )
                  : Text(
                      "Zdobądź",
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
              style: ElevatedButton.styleFrom(
                // ignore: deprecated_member_use
                primary: currentAbiList.contains(widget.abiName.toString())
                    ? Color.fromRGBO(128, 128, 128, 1.0)
                    : Color.fromRGBO(0, 128, 0, 1.0),
                minimumSize: Size(150, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ],
    );
  }
}
