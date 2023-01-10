import 'package:abilities_book/bottom_colected_panel.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get_storage/get_storage.dart';
import 'package:abilities_book/main.dart';

class CollectedAbilitiesScreen extends StatefulWidget {
  const CollectedAbilitiesScreen({Key? key}) : super(key: key);

  @override
  State<CollectedAbilitiesScreen> createState() =>
      _CollectedAbilitiesScreenState();
}

class _CollectedAbilitiesScreenState extends State<CollectedAbilitiesScreen> {
  Widget build(BuildContext context) {
    final box = GetStorage();
    var currentAbiList = pref!.getStringList('colected') ?? [];
    var currentLinkList = pref!.getStringList('links') ?? [];
    var currentDescList = pref!.getStringList('desc') ?? [];
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
            child: BottomColectedPanelScreen(
              abiName: box.read('appTitle'),
              abiLink: box.read('appLink'),
              abiDesc: box.read('appDesc'),
            ),
          ),
        ),
      );
    }
    //print(pref!.getStringList('colected'));
    return Scaffold(
      appBar: AppBar(
        title: Text("Twoje sprawności"),
        backgroundColor: const Color.fromRGBO(0, 128, 0, 1.0),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () => {
                box.remove('appTitle'),
                box.write('appTitle', currentAbiList[index]),
                box.remove('appLink'),
                box.write('appLink', currentLinkList[index]),
                box.remove('appDesc'),
                box.write('appDesc', currentDescList[index]),
                _showAbilityBottomSheet(context)
              },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${currentAbiList[index]}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 40),
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset('${currentLinkList[index]}'),
                  ),
                  IconButton(
                      onPressed: () => setState(() => {
                            currentAbiList.removeWhere(
                                (element) => element == currentAbiList[index]),
                            pref!.setStringList('colected', currentAbiList),
                          }),
                      icon: const Icon(Icons.delete)),
                ],
              ),
            ),
          ),
          );
        },
        // ignore: unnecessary_null_comparison
        itemCount: currentAbiList.length,
      ),
    );
  }
}
