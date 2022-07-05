import 'package:flutter/material.dart';
import 'package:meals_app_flutter/dummy_data.dart';

class MealsDetailScreen extends StatelessWidget {
  final Function addFavoriteMeal;
  final Function isMealFavorite;
  const MealsDetailScreen(
      {Key? key, required this.addFavoriteMeal, required this.isMealFavorite})
      : super(key: key);

  static const rootName = '/meal-detail';

  Widget buildSectiontitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealsId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealsId);
    return Scaffold(
      appBar: AppBar(
        title: Text(mealsId),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectiontitle(context, 'Ingredients'),
            // ignore: avoid_unnecessary_containers
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, inx) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[inx]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectiontitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, inx) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${inx + 1}'),
                      ),
                      title: Text(selectedMeal.steps[inx]),
                    ),
                    const Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isMealFavorite(mealsId) ? Icons.star : Icons.star_border),
        onPressed: () {
          addFavoriteMeal(mealsId);
        },
      ),
    );
  }
}
