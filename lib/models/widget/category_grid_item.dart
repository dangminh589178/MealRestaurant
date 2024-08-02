import 'package:demoflutter/models/categoryy.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category, required this.onClickCategory});

  final Categoryy category;
  final void Function() onClickCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.red ,
      onTap: (){
        onClickCategory();
      
      // Navigator.push(context, MaterialPageRoute(builder: 
      // (context) => MealsScreen(title:category.title, meals: dummyMeals)
      
      // ));  
      } ,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
          category.color.withOpacity(0.55),
          category.color.withOpacity(0.9)
        ], begin: Alignment.topLeft, end: Alignment.topRight)),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
