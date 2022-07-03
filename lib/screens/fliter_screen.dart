import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);
  static const rootName = '/filter';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filter Page'),
        ),
        drawer: const MainDrawe(),
        body: const Center(child: Text('Filter')));
  }
}
