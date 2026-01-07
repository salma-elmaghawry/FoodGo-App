import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodgo_app/Core/Theme/app_colors.dart';
import 'package:foodgo_app/Features/cart/screens/cart_screen.dart';
import 'package:foodgo_app/Features/checkout/screens/checkout_screen.dart';
import 'package:foodgo_app/Features/home/screens/home_screen.dart';
import 'package:foodgo_app/Features/profile/screens/profile_screen.dart';

class NavRoot extends StatefulWidget {
  NavRoot({super.key});

  @override
  State<NavRoot> createState() => _NavRootState();
}

class _NavRootState extends State<NavRoot> with TickerProviderStateMixin {
  late PageController controller;
  late List<Widget> screens;
  int currentScreen = 0;

  late List<AnimationController> iconControllers;

  @override
  void initState() {
    super.initState();

    screens = [HomeScreen(), CartScreen(), CheckoutScreen(), ProfileScreen()];

    controller = PageController(initialPage: 0);
    iconControllers = List.generate(
      4,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
      ),
    );
    iconControllers[currentScreen].forward();
  }

  @override
  void dispose() {
    controller.dispose();
    for (var c in iconControllers) c.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() => currentScreen = index);
    controller.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOutExpo,
    );

    // Animate selected icon
    iconControllers[index].forward();

    // Reverse others
    for (var i = 0; i < iconControllers.length; i++) {
      if (i != index) iconControllers[i].reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
        onPageChanged: (index) {
          setState(() => currentScreen = index);
          iconControllers[index].forward();
          for (var i = 0; i < iconControllers.length; i++) {
            if (i != index) iconControllers[i].reverse();
          }
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: currentScreen,
          onTap: _onTabTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.creditcard),
              label: 'Checkout',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
