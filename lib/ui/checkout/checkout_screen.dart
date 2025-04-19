import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:myapp/ui/others/finished_screen.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);

    if (bagProvider.getMapByAmount().isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Sacola'), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/others/empty_bag.png'),
                Text(
                  'Sua sacola está vazia!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor,
                  ),
                ),
                Text(
                  'Adicione itens para continuar.',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Voltar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Sacola'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              bagProvider.clearBag();
            },
            child: Text('Limpar', style: TextStyle(color: AppColors.mainColor)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10.0,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Pedido',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightOrangeColor,
                ),
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  bagProvider.getMapByAmount().keys.length,
                  (index) {
                    Dish dish =
                        bagProvider.getMapByAmount().keys.toList()[index];

                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightBackgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                            child: Container(
                              width: 75,
                              height: 75,
                              child: Image.asset(
                                'assets/dishes/default.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dish.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text('R\$${dish.price.toStringAsFixed(2)}'),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () => bagProvider.removeDish(dish),
                                  icon: Icon(
                                    Icons.remove,
                                    color: AppColors.mainColor,
                                  ),
                                ),
                                Text(
                                  bagProvider.getMapByAmount()[dish].toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  onPressed:
                                      () => bagProvider.addAllDishes([dish]),
                                  icon: Icon(
                                    Icons.add,
                                    color: AppColors.mainColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Pagamento',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightOrangeColor,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 75,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        spacing: 15,
                        children: [
                          Image.asset('assets/others/visa.png', width: 35),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('VISA Classic'), Text('****-0976')],
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        width: 35,
                        height: 35,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.lightBackgroundColor,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Entregar no endereço:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightOrangeColor,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 75,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        spacing: 15,
                        children: [
                          Icon(Icons.location_on, size: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Rua das Acácias, 28'),
                              Text('Casa 10'),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        width: 35,
                        height: 35,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.lightBackgroundColor,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Confirmar',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightOrangeColor,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  child: Column(
                    spacing: 8,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subtotal'),
                          Text(
                            'R\$${bagProvider.getTotalPrice().toStringAsFixed(2)}',
                            style: TextStyle(color: AppColors.lightOrangeColor),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Frete'),
                          Text(
                            'R\$${bagProvider.getFrete().toStringAsFixed(2)}',
                            style: TextStyle(color: AppColors.lightOrangeColor),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total'),
                          Text(
                            'R\$${(bagProvider.getTotalPrice() + bagProvider.getFrete()).toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.lightOrangeColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      ElevatedButton(
                        onPressed: () {
                          bagProvider.clearBag();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return FinishedScreen();
                              },
                            ),
                          );
                        },
                        child: Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.wallet, color: Colors.black, size: 25),
                            Text("Pedir", style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
