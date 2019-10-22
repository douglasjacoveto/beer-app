import 'dart:async';

import 'package:flutter_beer/screens/beerScreen.dart';
import 'package:flutter_beer/widgets/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Top Beers'),
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: new Image.asset(
                'assets/images/beerglasstwo.png',
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Text("Beer List",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.grey,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                      color: Colors.black)),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // if (Platform.isAndroid)
            //   showAlertDialog(context);
            // else
            //   showAlertDialogIos(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BeerScreen()),
            );
          },
          tooltip: 'List',
          child: Icon(Icons.list),
        ),
      );

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text(
          "Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogIos(BuildContext context) {
    // set up the buttons
    Widget cancelButton = CupertinoButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = CupertinoButton(
      child: Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text("AlertDialog"),
      content: Text(
          "Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
