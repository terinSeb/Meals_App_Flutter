import 'package:flutter/material.dart';
import 'package:meals_app_flutter/screens/meals_details_screen.dart';
import 'package:meals_app_flutter/screens/tabs_screen.dart';
import 'screens/category_meals_screnn.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      // home: const CategoriesScreen(),
      // initialRoute: '/',
      routes: {
        // '/': (context) => const CategoriesScreen(),
        '/': (context) => const TabScreen(),
        CategoryMealsScreen.routeName: ((ctx) => const CategoryMealsScreen()),
        MealsDetailScreen.rootName: (ctx) => const MealsDetailScreen()
      },
      onGenerateRoute: (settings) {
        // debugPrint(settings?.arguments);
        return MaterialPageRoute(
            builder: ((context) => const CategoryMealsScreen()));
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: ((context) => const CategoryMealsScreen()));
      },
    );
  }
}
