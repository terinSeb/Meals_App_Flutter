import 'package:flutter/material.dart';

class MealsDetailScreen extends StatelessWidget {
  const MealsDetailScreen({Key? key}) : super(key: key);

  static const rootName = '/meal-detail';
  @override
  Widget build(BuildContext context) {
    final mealsId = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealsId),
      ),
      body: Center(
        child: Text(mealsId),
      ),
    );
  }
}
