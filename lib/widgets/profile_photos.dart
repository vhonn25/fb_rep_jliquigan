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
                  imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBvkXMVIMKaf3zr2Og37J5xymgYQYc9fbIyZylIc7QTBiDVuMU'),
              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBvkXMVIMKaf3zr2Og37J5xymgYQYc9fbIyZylIc7QTBiDVuMU',
                  fit: BoxFit.cover),
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: InkWell(
              onTap: () => customShowImageDialog(context,
                  imageUrl: 'https://queen.jollibee.com.ph/2023/05/2-pc.-Chickenjoy-VM-Promo-min-819x1024.jpg'),
              child: Image.network('https://queen.jollibee.com.ph/2023/05/2-pc.-Chickenjoy-VM-Promo-min-819x1024.jpg',
                  fit: BoxFit.cover),
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: InkWell(
              onTap: () => customShowImageDialog(context,
                  imageUrl: 'https://i1.sndcdn.com/artworks-bAq8V5mdeNgSfzW6-qSp9OA-t500x500.png'),
              child:
                  Image.network('https://i1.sndcdn.com/artworks-bAq8V5mdeNgSfzW6-qSp9OA-t500x500.png', fit: BoxFit.cover),
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: InkWell(
              onTap: () => customShowImageDialog(context,
                  imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Tian%27anmen_from_the_square_%2820200825114150%29.jpg/1200px-Tian%27anmen_from_the_square_%2820200825114150%29.jpg'),
              child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Tian%27anmen_from_the_square_%2820200825114150%29.jpg/1200px-Tian%27anmen_from_the_square_%2820200825114150%29.jpg',
                  fit: BoxFit.cover),
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: InkWell(
              onTap: () => customShowImageDialog(context,
                  imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVOrp6ikZhFtAZKCPAVpPPuucIh_s4TcXIYA&s'),
              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVOrp6ikZhFtAZKCPAVpPPuucIh_s4TcXIYA&s',
                  fit: BoxFit.cover),
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: InkWell(
              onTap: () => customShowImageDialog(context,
                  imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOhrrmVNtCZiao_sr1dOeVDAE4YeXe1ddqMw&s'),
              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOhrrmVNtCZiao_sr1dOeVDAE4YeXe1ddqMw&s',
                  fit: BoxFit.cover),
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: InkWell(
              onTap: () => customShowImageDialog(context,
                  imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOhrrmVNtCZiao_sr1dOeVDAE4YeXe1ddqMw&s'),
              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOhrrmVNtCZiao_sr1dOeVDAE4YeXe1ddqMw&s',
                  fit: BoxFit.cover),
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: InkWell(
              onTap: () => customShowImageDialog(context,
                  imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOhrrmVNtCZiao_sr1dOeVDAE4YeXe1ddqMw&s'),
              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOhrrmVNtCZiao_sr1dOeVDAE4YeXe1ddqMw&s',
                  fit: BoxFit.cover),
            )),
      ],
    );
  }
}
