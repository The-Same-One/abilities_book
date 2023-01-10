import 'dart:convert';
import 'dart:core';
import 'package:abilities_book/abilities_by_category_page.dart';
import 'package:flutter/material.dart';

class AbilitiesCategoryPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final categoryTypes;
  final appBarName;
  const AbilitiesCategoryPage({Key? key, this.categoryTypes, this.appBarName})
      : super(key: key);

  @override
  _AbilitiesCategoryPage createState() => _AbilitiesCategoryPage();
}

class _AbilitiesCategoryPage extends State<AbilitiesCategoryPage> {
  late List data;
  // final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.appBarName.toString()),
          backgroundColor: const Color.fromRGBO(0, 128, 0, 1.0),
        ),
        body: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString(widget.categoryTypes.toString()),
            builder: (context, snapshot) {
              // Decode the JSON
              var newData = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AbilitiesByCategoryPage(
                                    categoryName: newData[index]['category'],
                                    nameOfCategoryAppbar: newData[index]
                                        ['title'],
                                  )));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // SEARCH BAR (nie tutaj - znaleźć miejce)
                            // TextField(
                            //       controller: controller,
                            //       decoration: InputDecoration(
                            //         prefixIcon: const Icon(Icons.search),
                            //         hintText: 'Szukaj sprawności',
                            //         border: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(20),
                            //           borderSide: const BorderSide(
                            //             color: Color.fromRGBO(0, 128, 0, 1.0),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  newData[index]['title'],
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                // Text(
                                //   newData[index]['category'],
                                //   style: TextStyle(color: Colors.grey.shade600),
                                // ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            // SizedBox(
                            //   height: 50,
                            //   width: 50,
                            //   child: Image.asset(
                            //     newData[index]['img'].toString(),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: newData == null ? 0 : newData.length,
              );
            },
          ),
        ));
  }
}
