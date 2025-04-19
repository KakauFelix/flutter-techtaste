import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/_core/widgets/appbar.dart';
import 'package:myapp/ui/_core/widgets/round_icon_button_widget.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:provider/provider.dart';

class DishScreen extends StatefulWidget {
  final String nameRestaurant;
  final Dish dish;

  const DishScreen({
    super.key,
    required this.dish,
    required this.nameRestaurant,
  });

  @override
  State<DishScreen> createState() => _DishScreenState();
}

class _DishScreenState extends State<DishScreen> {
  int qtdDishes = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: widget.nameRestaurant),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 15.0,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightBackgroundColor,
                  ),
                  width: double.infinity,
                  height: 176,
                  child: Image.asset(
                    'assets/dishes/default.png',
                    height: 176,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                spacing: 7,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.dish.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightOrangeColor,
                    ),
                  ),
                  Text(
                    'R\$${widget.dish.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(widget.dish.description),
                ],
              ),
              Row(
                spacing: 15,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BuildRoundIconButton(
                    onPressed: () {
                      if (qtdDishes > 1) {
                        setState(() {
                          qtdDishes--;
                        });
                      }
                    },
                    icon: Icons.remove,
                    backgroundColor: AppColors.mainColor,
                    iconColor: AppColors.lightBackgroundColor,
                  ),
                  Text(qtdDishes.toString(), style: TextStyle(fontSize: 18)),
                  BuildRoundIconButton(
                    onPressed: () {
                      setState(() {
                        qtdDishes++;
                      });
                    },
                    icon: Icons.add,
                    backgroundColor: AppColors.mainColor,
                    iconColor: AppColors.lightBackgroundColor,
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final bagProvider = context.read<BagProvider>();
                    for (int i = 0; i < qtdDishes; i++) {
                      bagProvider.addAllDishes([widget.dish]);
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '$qtdDishes item(ns) adicionado(s) à sacola',
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text('Adicionar', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
