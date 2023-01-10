import 'dart:core';
import 'package:abilities_book/ad_state.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'abilities_page.dart';

 SharedPreferences? pref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  await GetStorage.init();
  pref = await SharedPreferences.getInstance();
  runApp(Provider.value(value: adState,
  builder: (context, child) => MyApp(),),);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _NoteButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final Function() _onPressed;
  const _NoteButton(this._text, this._color, this._onPressed);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      // ignore: sort_child_properties_last
      child: Text(
        _text,
        style: const TextStyle(
            fontSize: 25, color: Colors.white),
      ),
      height: 50,
      minWidth: 200,
      color: _color,
    );
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Książeczka sprawności',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      darkTheme: ThemeData(),
      home: const MyHomePage(title: 'Książeczka sprawności'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BannerAd? banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
            size: AdSize.banner,
            adUnitId: adState.bannerAdUnitId,
            listener: adState.adListener,
            request: AdRequest()
        )..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/lilijka.png',
              scale: 0.5,
            ),
            _NoteButton(
                "SPRAWNOŚCI",
                const Color.fromRGBO(0, 128, 0, 1.0),
                     () =>
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AbilitiesPage()))),
            Container(
              height: 15,
            ),
            if (banner == null)
              SizedBox(
                height: 50,
                child: Text("AAAAAAAAAAAAAAAAAAAAAAA"),
              )
            else
              SizedBox(
                height: 50,
                child: AdWidget(ad: banner!),
              ),
          ],
        ),
      ),
    );
  }
}
