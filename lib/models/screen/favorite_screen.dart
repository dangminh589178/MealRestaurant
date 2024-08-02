import 'package:demoflutter/models/data/dummy_data.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget{
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context)  {
      print("FavoriteScreen invoke");
      return Column(
        children: [
          for(var item in listFavorite)
            Text(item.title)
        ],
      );
  }

}