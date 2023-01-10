import 'dart:convert';
import 'dart:core';
import 'package:abilities_book/abilitiesCategoriesPage/bottom_panel.dart';
import 'package:abilities_book/model/ability.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

class AbilitiesByCategoryPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final categoryName;
  // ignore: prefer_typing_uninitialized_variables
  final nameOfCategoryAppbar;
  const AbilitiesByCategoryPage(
      {Key? key, this.categoryName, this.nameOfCategoryAppbar})
      : super(key: key);

  @override
  _AbilitiesByCategoryPage createState() => _AbilitiesByCategoryPage();
}

class _AbilitiesByCategoryPage extends State<AbilitiesByCategoryPage> {
  late List data;
  final box = GetStorage();
  // ignore: unused_field, deprecated_member_use
  List<dynamic> abilitiesList = [];
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

  Future<String> loadAssets() async {
    return await rootBundle.loadString(widget.categoryName.toString());
  }

  Future<Ability> fetchDescription() async {
    final response = await loadAssets();
    final dataDescr = json.decode(response) as Map<String, dynamic>;
    Ability abs = Ability.fromJson(dataDescr);

    print(abs);
    return abs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.nameOfCategoryAppbar),
          backgroundColor: const Color.fromRGBO(0, 128, 0, 1.0),
        ),
        body: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString(widget.categoryName.toString()),
            builder: (context, snapshot) {
              // fetchDescription();
              // Decode the JSON
              var newData = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => {
                      box.remove('appTitle'),
                      box.write('appTitle', newData[index]['title']),
                      box.remove('appLink'),
                      box.write('appLink', newData[index]['image']),
                      box.remove('appDesc'),
                      box.write('appDesc', newData[index]['description']),
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
                                  newData[index]['title'],
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
                                newData[index]['image'].toString(),
                              ),
                            ),
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
