import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);
  static const rootName = '/filter';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactose = false;
  bool _vegetarian = false;
  bool _vegan = false;
  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filter Page'),
        ),
        drawer: const MainDrawe(),
        body: Column(children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: Text('Adjust your meal selection',
                  style: Theme.of(context).textTheme.headline6)),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    'Gluten-Free',
                    'only include gluten-free meals',
                    _glutenFree, (bool newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose-Free', 'only include Lactose-free meals', _lactose,
                    (bool newValue) {
                  setState(() {
                    _lactose = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian-Free',
                    'only include Vegetarian-free meals',
                    _vegetarian, (bool newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan-Free', 'only include Vegan-free meals', _vegan,
                    (bool newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                })
              ],
            ),
          )
        ]));
  }
}
