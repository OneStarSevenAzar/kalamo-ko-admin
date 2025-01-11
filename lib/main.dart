import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber%20shop/screens/barber_shop.dart';
import 'package:shop_style/common/configs/theme.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/home/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // setupLocator();
  runApp(MaterialApp(
    theme: CustomTheme().lighTheme,
    scrollBehavior: const MaterialScrollBehavior().copyWith(
      dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      },
    ),
    home: const BarberShop(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [
        // ChangeNotifierProvider(
        //   create: (context) => locator.get<GlobalController>(),
        // )
      ],
      child: Consumer<GlobalController>(
        builder: (context, value, child) {
          return const HomeScreen();
        },
      ),
    );
  }
}
