import 'dart:core';

import 'package:abilities_book/profile_page.dart';
import 'package:abilities_book/search_page.dart';
import 'package:flutter/material.dart';
import 'package:abilities_book/abilitiesCategoriesPage/abilities_categories.dart';
import 'package:abilities_book/abilities_by_category_page.dart';

class AbilitiesPage extends StatefulWidget {
  const AbilitiesPage({Key? key}) : super(key: key);

  @override
  _AbilitiesPageState createState() {
    return _AbilitiesPageState();
  }
}

class _AbilitiesPageState extends State<AbilitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AbilitiesCategoryPage(
                            categoryTypes:
                                "data/types/campingAbilitiesTypes.json",
                            appBarName: "Obozownictwo i przyroda")));
              },
              child: const Text(
                "OBOZOWNICTWO I PRZYRODA",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(0, 100, 0, 1.0),
                ),
              ),
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(300, 60),
                side: BorderSide(color: Color.fromRGBO(0, 100, 0, 1.0), width: 2),
              ),
            ),
            Container(
              height: 15,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AbilitiesCategoryPage(
                            categoryTypes:
                                "data/types/musicAbilitiesTypes.json",
                            appBarName: "Muzyka i ekspresja")));
              },
              child: const Text(
                "MUZYKA I EKSPRESJA",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(0, 100, 0, 1.0),
                ),
              ),
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(300, 60),
                side: BorderSide(color: Color.fromRGBO(0, 100, 0, 1.0), width: 2),
              ),
            ),
            Container(
              height: 15,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AbilitiesCategoryPage(
                            categoryTypes:
                                "data/types/sportAbilitiesTypes.json",
                            appBarName: "Sport, turystyka i krajoznawstwo")));
              },
              child: const Text(
                "SPORT, TURYSTYKA I KRAJOZNAWSTWO",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(0, 100, 0, 1.0),
                ),
              ),
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(300, 60),
                side: BorderSide(color: Color.fromRGBO(0, 100, 0, 1.0), width: 2),
              ),
            ),
            Container(
              height: 15,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AbilitiesCategoryPage(
                            categoryTypes: "data/types/artAbilitiesTypes.json",
                            appBarName: "Sztuka i technika")));
              },
              child: const Text(
                "SZTUKA I TECHNIKA",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(0, 100, 0, 1.0),
                ),
              ),
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(300, 60),
                side: BorderSide(color: Color.fromRGBO(0, 100, 0, 1.0), width: 2),
              ),
            ),
            Container(
              height: 15,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AbilitiesCategoryPage(
                            categoryTypes:
                                "data/types/scienceAbilitiesTypes.json",
                            appBarName: "Nauka i kultura")));
              },
              child: const Text(
                "NAUKA I KULTURA",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(0, 100, 0, 1.0),
                ),
              ),
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(300, 60),
                side: BorderSide(color: Color.fromRGBO(0, 100, 0, 1.0), width: 2),
              ),
            ),
            Container(
              height: 15,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AbilitiesCategoryPage(
                            categoryTypes:
                                "data/types/spiritAbilitiesTypes.json",
                            appBarName: "Duch i charakter")));
              },
              child: const Text(
                "DUCH I CHARAKTER",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(0, 100, 0, 1.0),
                ),
              ),
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(300, 60),
                side: BorderSide(color: Color.fromRGBO(0, 100, 0, 1.0), width: 2),
              ),
            ),
            Container(
              height: 15,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AbilitiesByCategoryPage(
                            categoryName: "data/types/chalanges.json",
                            nameOfCategoryAppbar: "Próby")));
              },
              child: const Text(
                "PRÓBY",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(0, 100, 0, 1.0),
                ),
              ),
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(300, 60),
                side: BorderSide(color: Color.fromRGBO(0, 100, 0, 1.0), width: 2),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            Container(
                width: 120,
                height: 50,
            margin:EdgeInsets.all(10),
              child: FloatingActionButton.extended(
                // heroTag: 'profile',
                onPressed: () {
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context) => const ProfilePage()));
                 },
              backgroundColor: const Color.fromRGBO(56, 176, 0, 1.0),
                label: Row(
                  children:[
                    Icon(Icons.account_circle),
                    Text(' Profil'),
                  ]),
              )
            ),
            Container(
              width: 120,
                height: 50,
                margin:EdgeInsets.all(10),
                child: FloatingActionButton.extended(
                  heroTag: 'searchPage',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchPage()));
                  },
                  backgroundColor: const Color.fromRGBO(56, 176, 0, 1.0),
                  label: Row(
                      children:[
                        Icon(Icons.search),
                        Text('Szukaj'),
                      ]),
                )
            )
    ]
      ),

    );
  }
}
