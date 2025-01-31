
import 'package:facebook_application/widgets/constants.dart';
import 'package:flutter/material.dart';

customDialog(BuildContext context, {required title, required content}) {
  AlertDialog alertDialog = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: <Widget>[
      ElevatedButton(
        child: Text('Okay'),
        style: ElevatedButton.styleFrom(
          backgroundColor: FB_DARK_PRIMARY, foregroundColor: Colors.white),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}
