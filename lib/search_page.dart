import 'dart:convert';
import 'dart:core';

import 'package:abilities_book/abilitiesCategoriesPage/bottom_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPage createState() {
    return _SearchPage();
  }}

class _SearchPage extends State<SearchPage>{
  final box = GetStorage();
  late TextEditingController controller;
  List result = [];
  var rows = [];
  String query = '';

  void _showAbilityBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5,
        maxChildSize: 0.89,
        minChildSize: 0.3,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: BottomPanelScreen(
            abiName: box.read('appTitle'),
            abiLink: box.read('appLink'),
            abiDesc: box.read('appDesc'),
          ),
        ),
      ),
    );
  }

  Future<String> getJson() async {
    return rootBundle.loadString('data/allAbilities.json');
  }

  void getData() async {
    rows = json.decode(await getJson()) as List;
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    getData();
  }

  @override
  Widget build(BuildContext context) {

  return new Scaffold(
    appBar: new AppBar(
      title: Text(
        "WYSZUKAJ SPRAWNOŚĆ",
      ),
      backgroundColor: const Color.fromRGBO(0, 128, 0, 1.0),
    ),
    resizeToAvoidBottomInset: false,
      body: Container(
      child: Stack(
        children: [
      // mainAxisAlignment: MainAxisAlignment.center,
      // children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(
            top: 15, bottom: 15, left: 10, right: 10),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'Szukaj sprawności',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Color.fromRGBO(0, 128, 0, 1.0),
              ),
            ),
          ),
          onChanged: (v){
            setState(() {
              query = v;
              setResult(query);
            });
          },
        ),
      ),
          Container(
            margin: EdgeInsets.only(top: 80),
            child: query.isEmpty
            ? ListView.builder(
              shrinkWrap: true,
              itemCount: rows.length,
              itemBuilder: (con, id){
                return InkWell(
                  onTap: () => {
                    box.remove('appTitle'),
                    box.write('appTitle', rows[id]['title']),
                    box.remove('appLink'),
                    box.write('appLink', rows[id]['image']),
                    box.remove('appDesc'),
                    box.write('appDesc', rows[id]['description']),
                    _showAbilityBottomSheet(context)
                  },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              rows[id]['title'],
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: Image.asset(
                            rows[id]['image'].toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                );
                // return ListTile(
                //   title: Text(rows[id]['title'],
                //     style: const TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 22,
                //     ),
                //   ),
                //   onTap: (){
                //     setState(() {
                //       controller.text = rows[id]['title'];
                //       query = rows[id]['title'];
                //       setResult(query);
                //     });
                //   },
                // );
              },
            ) :
            ListView.builder(
              shrinkWrap: true,
              itemCount: result.length,
              itemBuilder: (con, id){
                return InkWell(
                  onTap: () => {
                    box.remove('appTitle'),
                    box.write('appTitle', result[id]['title']),
                    box.remove('appLink'),
                    box.write('appLink', result[id]['image']),
                    box.remove('appDesc'),
                    box.write('appDesc', result[id]['description']),
                    _showAbilityBottomSheet(context)
                  },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              result[id]['title'],
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: Image.asset(
                            result[id]['image'].toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                );
                // return ListTile(
                //   title: Text(result[id]['title'],
                //     style: const TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 22,
                //     ),
                //   ),
                //   onTap: (){
                //     setState(() {
                //       controller.text = result[id]['title'];
                //       query = result[id]['title'];
                //       setResult(query);
                //     });
                //   },
                // );
              },
            ),
          ),
     ],
    ),
   ),
  );

 }
  void setResult(String query){
    result = rows.where((element) => element['title'].toString().toLowerCase().contains(query.toLowerCase())).toList();
  }
}