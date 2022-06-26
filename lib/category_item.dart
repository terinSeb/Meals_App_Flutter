import 'package:flutter/material.dart';
import 'package:meals_app_flutter/category_meals_screnn.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItem({Key? key, required this.title, required this.color})
      : super(key: key);
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      // ignore: prefer_const_constructors
      return CategoryMealsScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => selectCategory(context)),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.3), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
