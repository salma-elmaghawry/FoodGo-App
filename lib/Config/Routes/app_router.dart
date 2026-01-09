import 'package:flutter/material.dart';
import 'package:foodgo_app/Config/Routes/routes.dart';
import 'package:foodgo_app/Features/auth/ui/screens/login_screen.dart';
import 'package:foodgo_app/Features/auth/ui/screens/register_screen.dart';
import 'package:foodgo_app/Features/cart/UI/screens/cart_screen.dart';
import 'package:foodgo_app/Features/checkout/screens/checkout_screen.dart';
import 'package:foodgo_app/Features/home/screens/home_screen.dart';
import 'package:foodgo_app/Features/intro/nav_root.dart';
import 'package:foodgo_app/Features/intro/splash_screen.dart';
import 'package:foodgo_app/Features/profile/screens/profile_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.navBar:
        return MaterialPageRoute(builder: (_) => NavRoot());
      //auth
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      //features
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.cart:
        return MaterialPageRoute(builder: (_) => CartScreen(products: []));
      case Routes.checkout:
        return MaterialPageRoute(builder: (_) => CheckoutScreen());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
