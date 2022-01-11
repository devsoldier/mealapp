import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    /*
    retrieve data arguments from category item into routeArgs
    (only id and title as denoted under category item)
    */
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title']!;
    final categoryid = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryid);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      /*
      List out the content of the selected category
      */
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
