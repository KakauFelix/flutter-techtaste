import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';

class BagProvider extends ChangeNotifier {
  List<Dish> dishesOnBag = [];

  addAllDishes(List<Dish> dishes) {
    dishesOnBag.addAll(dishes);
    notifyListeners();
  }

  addDish(Dish dish) {
    dishesOnBag.add(dish);
    notifyListeners();
  }

  removeDish(Dish dish) {
    dishesOnBag.remove(dish);
    notifyListeners();
  }

  clearBag() {
    dishesOnBag.clear();
    notifyListeners();
  }

  Map<Dish, int> getMapByAmount() {
    Map<Dish, int> mapResult = {};

    for (Dish dish in dishesOnBag) {
      if (mapResult[dish] == null) {
        mapResult[dish] = 1;
      } else {
        mapResult[dish] = mapResult[dish]! + 1;
      }
    }

    return mapResult;
  }

  double getTotalPrice() {
    double totalPrice = 0;

    for (Dish dish in dishesOnBag) {
      totalPrice += dish.price;
    }

    return totalPrice;
  }

  double getFrete() {
    return getTotalPrice() * 10 / 100;
  }
}
