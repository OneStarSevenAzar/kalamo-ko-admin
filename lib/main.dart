import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber%20shop/statemanagment/customaize_controller.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_style/common/configs/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shop_style/locator.dart';
import 'package:shop_style/navigation%20bar/screens/navigation_bar.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MaterialApp(
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('en', 'US'), // زبان انگلیسی
      Locale('fa', 'IR'), // زبان فارسی
    ],
    locale: const Locale('fa', ''), // زبان پیشفرض (فارسی)
    theme: CustomTheme().lighTheme,
    scrollBehavior: const MaterialScrollBehavior().copyWith(
      dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      },
    ),
    home: MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => locator.get<GlobalController>(),
        ),
        ChangeNotifierProvider(
          create: (context) => locator.get<BarberShopProvider>(),
        ),
      ],
      child: const CustomNavigationBar(),
    ),
  ));
}
