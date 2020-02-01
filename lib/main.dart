import "package:flare_flutter/flare_actor.dart";

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flare_flutter/provider/asset_flare.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FlareActor.asset(
        AssetFlare(bundle: rootBundle, name: "assets/optimized.flr"),
        alignment: Alignment.center,
        animation: 'progress',
      )),
    );
  }
}
