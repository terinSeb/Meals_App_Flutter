import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import '/screens/fliter_screen.dart';
import '/screens/meals_details_screen.dart';
import '/screens/tabs_screen.dart';
import 'screens/category_meals_screnn.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: prefer_final_fields
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availableMeal = DUMMY_MEALS;
  final List<Meal> _favoriteMeal = [];
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if ((_filters['gluten'] as bool) && !meal.isGlutenFree) {
          return false;
        }
        if ((_filters['lactose'] as bool) && !meal.isLactoseFree) {
          return false;
        }
        if ((_filters['vegan'] as bool) && !meal.isVegan) {
          return false;
        }
        if ((_filters['vegetarian'] as bool) && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toogleFavoriteMeal(String mealId) {
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeal.any((meal) => meal.id == mealId);
  }

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
        '/': (context) => TabScreen(favoriteMeal: _favoriteMeal),
        CategoryMealsScreen.routeName: ((ctx) =>
            CategoryMealsScreen(availableMeal: _availableMeal)),
        MealsDetailScreen.rootName: (ctx) => MealsDetailScreen(
            addFavoriteMeal: _toogleFavoriteMeal,
            isMealFavorite: _isMealFavorite),
        FilterScreen.rootName: (context) =>
            FilterScreen(initialFilters: _filters, saveFilters: _setFilters)
      },
      onGenerateRoute: (settings) {
        // debugPrint(settings?.arguments);
        return MaterialPageRoute(
            builder: ((context) =>
                CategoryMealsScreen(availableMeal: _availableMeal)));
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: ((context) =>
                CategoryMealsScreen(availableMeal: _availableMeal)));
      },
    );
  }
}
