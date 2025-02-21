import 'package:facebook_application/widgets/custom_dialogs.dart';
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
      crossAxisCount: 3,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.all(0),
            child: InkWell(
              onTap: () => customShowImageDialog(context,
                  imageUrl: 'assets/images/Red Guitar.png'),
              child: Image.asset('assets/images/Red Guitar.png',
                  fit: BoxFit.cover),
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: InkWell(
              onTap: () => customShowImageDialog(context,
                  imageUrl: 'assets/images/Jollideals.png'),
              child: Image.asset('assets/images/Jollideals.png',
                  fit: BoxFit.cover),
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: InkWell(
              onTap: () => customShowImageDialog(context,
                  imageUrl: 'assets/images/Sigma Cat.png'),
              child:
                  Image.asset('assets/images/Sigma Cat.png', fit: BoxFit.cover),
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: InkWell(
              onTap: () => customShowImageDialog(context,
                  imageUrl: 'assets/images/Tiananmen Square.png'),
              child: Image.asset('assets/images/Tiananmen Square.png',
                  fit: BoxFit.cover),
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: InkWell(
              onTap: () => customShowImageDialog(context,
                  imageUrl: 'assets/images/Saturation.png'),
              child: Image.asset('assets/images/Saturation.png',
                  fit: BoxFit.cover),
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: InkWell(
              onTap: () => customShowImageDialog(context,
                  imageUrl: 'assets/images/Hello World.png'),
              child: Image.asset('assets/images/Hello World.png',
                  fit: BoxFit.cover),
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: InkWell(
              onTap: () => customShowImageDialog(context,
                  imageUrl: 'assets/images/Hello World.png'),
              child: Image.asset('assets/images/Hello World.png',
                  fit: BoxFit.cover),
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: InkWell(
              onTap: () => customShowImageDialog(context,
                  imageUrl: 'assets/images/Hello World.png'),
              child: Image.asset('assets/images/Hello World.png',
                  fit: BoxFit.cover),
            )),
      ],
    );
  }
}
