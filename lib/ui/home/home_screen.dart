import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/data/categories_data.dart';
import 'package:myapp/data/restaurant_data.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/_core/widgets/appbar.dart';
import 'package:myapp/ui/_core/widgets/drawer.dart';
import 'package:myapp/ui/home/widgets/category_widget.dart';
import 'package:myapp/ui/home/widgets/restaurant_widget.dart';
import 'package:myapp/ui/home/widgets/search_input.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);

    return Scaffold(
      drawer: getAppDrawer(context: context, currentRoute: '/home'),
      appBar: getAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 32.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/logo.png', width: 147)),
              Text(
                "Boas-vindas!",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightOrangeColor,
                ),
              ),
              SearchInput(
                onChanged: (value) {
                  print('Buscando por: $value');
                },
              ),
              Text(
                "Escolha por categoria",
                style: TextStyle(
                  fontSize: 22.0,
                  color: AppColors.lightOrangeColor,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10.0,
                  children: List.generate(
                    CategoriesData.listCategories.length,
                    (index) {
                      return CategoryWidget(
                        category: CategoriesData.listCategories[index],
                      );
                    },
                  ),
                ),
              ),
              Image.asset('assets/banners/banner_promo.png'),
              Text("Bem avaliados", style: TextStyle(fontSize: 16.0)),
              Column(
                spacing: 16.0,
                children: List.generate(restaurantData.listRestaurants.length, (
                  index,
                ) {
                  Restaurant restaurant = restaurantData.listRestaurants[index];
                  return RestaurantWidget(restaurant: restaurant);
                }),
              ),
              SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}
