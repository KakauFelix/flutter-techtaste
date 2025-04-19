import 'package:flutter/material.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/home/home_screen.dart';

class FinishedScreen extends StatelessWidget {
  const FinishedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 0, width: double.infinity),
            Image.asset('assets/others/happy_finished_bag.png'),
            Text(
              'Pedido finalizado!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.mainColor,
              ),
            ),
            Text(
              'Obrigado por comprar conosco!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
                },
                child: Text('Voltar para home', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
