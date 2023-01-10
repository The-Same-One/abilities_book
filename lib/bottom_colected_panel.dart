import 'dart:math';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get_storage/get_storage.dart';
import 'package:abilities_book/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomColectedPanelScreen extends StatefulWidget {
  final abiName;
  final abiLink;
  final abiDesc;
  BottomColectedPanelScreen({
    Key? key,
    this.abiName,
    this.abiLink,
    this.abiDesc,
  }) : super(key: key);

  @override
  State<BottomColectedPanelScreen> createState() => _BottomColectedPanelScreenState();
}

class _BottomColectedPanelScreenState extends State<BottomColectedPanelScreen> {

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
           /* ElevatedButton(
              onPressed: () => setState(() => {
                currentAbiList.removeWhere(
                        (element) => element == currentAbiList),
                pref!.setStringList('colected', currentAbiList),
              }),
              child: Text(
                "USUŃ",
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                // ignore: deprecated_member_use
                primary: Colors.red,
                minimumSize: Size(150, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),*/
          ],
        ),
      ],
    );
  }
}
