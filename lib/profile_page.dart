import 'dart:core';

import 'package:abilities_book/collected_abilities.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() {
    return _ProfilePageState();
  }
}

// final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class _ProfilePageState extends State<ProfilePage> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
        child: Text("BRAK"),
        value: "BRAK",
      ),
      const DropdownMenuItem(
        child: Text("Młodzik"),
        value: "MŁODZIK",
      ),
      const DropdownMenuItem(
        child: Text("Wywiadowca"),
        value: "WYW",
      ),
      const DropdownMenuItem(
        child: Text("Ćwik"),
        value: "ĆWIK",
      ),
      const DropdownMenuItem(
        child: Text("Harcerz Orli"),
        value: "HO",
      ),
      const DropdownMenuItem(
        child: Text("Harcerz Rzeczypospolitej"),
        value: "HR",
      ),
    ];
    return menuItems;
  }

  String selectedValue = "BRAK";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twój profil"),
        backgroundColor: const Color.fromRGBO(0, 128, 0, 1.0),
      ),
      body: Center(
        child: Hero(
        tag: 'profile',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //const Icon(Icons.assessment_outlined),
            // Row(
            //   children: [
            //     const Text(
            //       "Twój stopień: ",
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         fontSize: 20,
            //         color: Color.fromRGBO(0, 100, 0, 1.0),
            //       ),
            //     ),
            //     Container(
            //       width: 15,
            //     ),
            //     DropdownButton(
            //       value: selectedValue,
            //       onChanged: (String? newValue) {
            //         setState(() {
            //           selectedValue = newValue!;
            //         });
            //       },
            //       items: dropdownItems,
            //     ),
            //   ],
            // ),
            // Container(
             // height: 15,
            //),
            _NoteButton(
                "MOJE SPRAWNOŚCI",
                const Color.fromRGBO(0, 128, 0, 1.0),
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CollectedAbilitiesScreen()))),
          ],
        ),
      ),
      ),
    );
  }
}

class _NoteButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final Function() _onPressed;
  const _NoteButton(this._text, this._color, this._onPressed);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      child: Text(
        _text,
        style: const TextStyle(fontSize: 25, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        // ignore: deprecated_member_use
        primary: _color,
        minimumSize: Size(150, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      // height: 50,
      // minWidth: 200,
      // color: _color,
    );
  }
}
