import 'package:flutter/material.dart';
import 'package:markatty/Config/Routes/routes.dart';
import 'package:markatty/Features/Auth/ui/screens/login_screen.dart';
import 'package:markatty/Features/Auth/ui/screens/register_screen.dart';
import 'package:markatty/splash_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
        //auth
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
