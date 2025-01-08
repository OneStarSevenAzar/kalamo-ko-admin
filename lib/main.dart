import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/common/configs/theme.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/home/screens/home_screen.dart';
import 'package:shop_style/pervice/screens/pervice_page.dart';
import 'package:shop_style/product%20uploade/product_uploade_page.dart';

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
    home: const ProductUploadePage(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [
        // ChangeNotifierProvider(
        // create: (context) => locator.get<GlobalController>(),
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
