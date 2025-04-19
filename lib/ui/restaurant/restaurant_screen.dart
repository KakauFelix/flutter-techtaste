import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:myapp/ui/_core/widgets/appbar.dart';
import 'package:myapp/ui/dish/dish_screen.dart';
import 'package:provider/provider.dart';
import 'package:myapp/ui/_core/widgets/round_icon_button_widget.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 32.0,
            children: [
              Image.asset('assets/${restaurant.imagePath}', width: 125),
              Text(
                'Mais pedidos',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightOrangeColor,
                ),
              ),
              Column(
                spacing: 15,
                children: List.generate(restaurant.dishes.length, (index) {
                  Dish dish = restaurant.dishes[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightBackgroundColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: double.infinity,
                    height: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Imagem do prato
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          child: Container(
                            width: 80,
                            height: 100,
                            child: Image.asset(
                              'assets/dishes/default.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Informações + botão
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Textos
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dish.name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.lightOrangeColor,
                                      ),
                                    ),
                                    Text(
                                      'R\$${dish.price.toStringAsFixed(2)}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 5),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => DishScreen(
                                                  dish: dish,
                                                  nameRestaurant:
                                                      restaurant.name,
                                                ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Ver mais',
                                        style: TextStyle(
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                // Botão no canto direito
                                BuildRoundIconButton(
                                  onPressed: () {
                                    context.read<BagProvider>().addAllDishes([
                                      dish,
                                    ]);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '1 item adicionado à sacola',
                                        ),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                  icon: Icons.add,
                                  backgroundColor: AppColors.mainColor,
                                  iconColor: AppColors.lightBackgroundColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );

                  /* // Uso do ListTile 
                  return ListTile(
                    leading: Image.asset(
                      'assets/dishes/default.png',
                      width: 75,
                    ),
                    title: Text(dish.name),
                    subtitle: Text('R\$${dish.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<BagProvider>().addAllDishes([dish]);
                      },
                      icon: Icon(Icons.add),
                    ),
                  );*/
                }),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
