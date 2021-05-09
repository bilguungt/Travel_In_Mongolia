import 'package:flutter/material.dart';
import 'package:travel_app/Screens/ListScreen/listScreen.dart';
import 'package:travel_app/Screens/home/home.dart';

class Routes {
  static const ListScreen = "ListScreen";
}
class Router {

  // final RouteObserver<PageRoute> routeObserver;
  //
  // Router() : routeObserver = RouteObserver<PageRoute>();
  // Widget previousWidget;

  Route<dynamic> generateRoute(RouteSettings settings) {

    // Route<dynamic> route;
    Widget currentWidget;
    switch (settings.name) {
      case Routes.ListScreen:
        return MaterialPageRoute(builder: (context) => ListScreen());
        Map<String, dynamic> args = settings.arguments as Map;
        currentWidget = ListScreen(
          places: args['places'],
        );
        break;
      default:
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }

    // route = _buildRouteBuilder(settings, currentWidget);


    // print('route -> $route ${route.navigator} ${route.navigator?.widget} ${route
    //     .settings} ${route.isCurrent} ${route.isActive} ${route.isFirst}');


  }

  PageRouteBuilder _buildRouteBuilder(RouteSettings settings, Widget builder) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (BuildContext ctx, _, __) {
        return builder;
      },
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

}