import 'package:flutter/material.dart';

class profile_photos extends StatelessWidget {
  const profile_photos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      //Photos Section
      primary: false,
      padding: const EdgeInsets.all(0),
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 4,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(0),
          child:
              Image.network('assets/images/Red Guitar.png', fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child:
              Image.network('assets/images/Red Guitar.png', fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child:
              Image.network('assets/images/Red Guitar.png', fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child:
              Image.network('assets/images/Red Guitar.png', fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child:
              Image.network('assets/images/Red Guitar.png', fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child:
              Image.network('assets/images/Red Guitar.png', fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child:
              Image.network('assets/images/Red Guitar.png', fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child:
              Image.network('assets/images/Red Guitar.png', fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child:
              Image.network('assets/images/Red Guitar.png', fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child:
              Image.network('assets/images/Red Guitar.png', fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child:
              Image.network('assets/images/Red Guitar.png', fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child:
              Image.network('assets/images/Red Guitar.png', fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child:
              Image.network('assets/images/Red Guitar.png', fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child:
              Image.network('assets/images/Red Guitar.png', fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child:
              Image.network('assets/images/Red Guitar.png', fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child:
              Image.network('assets/images/Red Guitar.png', fit: BoxFit.cover),
        ),
      ],
    );
  }
}
