import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters,
      this.saveFilters); /*_setFilters from main.dart is passed to saveFilters */

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'] != null;
    _lactoseFree = widget.currentFilters['lactose'] != null;
    _vegetarian = widget.currentFilters['vegetarian'] != null;
    _vegan = widget.currentFilters['vegan'] != null;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text('gluten-free'),
        value: _glutenFree,
        subtitle: Text('only include gluten-free meals'),
        onChanged: (newValue) {
          setState(() {
            _glutenFree = newValue;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your filters'), actions: <Widget>[
        IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.saveFilters(selectedFilters);
            })
      ]),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('adjust your meal selection',
                style: Theme.of(context).textTheme.headline1),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                  'gluten-free', 'only include gluten-free meals', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'vegetarian', 'only include vegetarian meals', _vegetarian,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTile('lactose-free',
                  'only include lactose-free meals', _lactoseFree, (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTile('vegan', 'only include vegan meals', _vegan,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
