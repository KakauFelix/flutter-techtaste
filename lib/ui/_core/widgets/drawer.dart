import 'package:flutter/material.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/checkout/checkout_screen.dart';
import 'package:myapp/ui/splash/splash_screen.dart';

Drawer getAppDrawer({
  required BuildContext context,
  required String currentRoute,
}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 100,
          child: DrawerHeader(
            decoration: BoxDecoration(),
            margin: EdgeInsets.zero,
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
        SizedBox(height: 18),

        buildDrawerItem(
          context: context,
          icon: Icons.home,
          title: 'Home',
          isSelected: currentRoute == '/home',
          onTap: () {
            Navigator.pop(context);
          },
        ),

        buildDrawerItem(
          context: context,
          icon: Icons.shopping_basket,
          title: 'Sacola',
          isSelected: currentRoute == '/bag',
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CheckoutScreen();
                },
              ),
            );
          },
        ),

        Divider(color: const Color.fromARGB(83, 158, 158, 158)),

        buildDrawerItem(
          context: context,
          icon: Icons.exit_to_app,
          title: 'Sair',
          isSelected: false,
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SplashScreen();
                },
              ),
            );
          },
        ),
      ],
    ),
  );
}

// Item personalizado
Widget buildDrawerItem({
  required BuildContext context,
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  bool isSelected = false,
}) {
  return Container(
    decoration:
        isSelected
            ? BoxDecoration(
              color: const Color.fromARGB(243, 255, 164, 89),
              borderRadius: BorderRadius.circular(50),
            )
            : BoxDecoration(
              color: null,
              borderRadius: BorderRadius.circular(0),
            ),
    child: ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.black : AppColors.mainColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Colors.black : Colors.white,
        ),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}
