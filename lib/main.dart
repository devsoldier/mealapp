import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primaryColor: Colors.red,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                // fontSize: 30,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      // home: CategoriesScreen(),
      /*routes "table" */
      initialRoute: '/',
      routes: {
        // '/': (ctx) => CategoriesScreen(),
        '/': (ctx) => TabsScreen(),
        /*first screen */
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        /*second screen */
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(
      //     builder: (ctx) => CategoriesScreen(),
      //   );
      // },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('DeliMeals'),
//         ),
//         body: Center(
//           child: Text('Navigation Time!'),
//         ));
//   }
// }
