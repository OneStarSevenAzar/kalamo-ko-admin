import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber%20shop/repository/customaize_repository.dart';
import 'package:shop_style/barber%20shop/screens/barber_shop.dart';
import 'package:shop_style/barber%20shop/screens/test.dart';
import 'package:shop_style/barber%20shop/statemanagment/customaize_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/theme.dart';
import 'package:shop_style/doshboard/screens/doshboard_page.dart';
import 'package:shop_style/home/screens/home_screen.dart';
import 'package:shop_style/pervice/services_page.dart';
import 'package:shop_style/product%20uploade/product_uploade_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

void main() {
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
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    DoshboardPage(),
    ServicesPage(),
    ProductUploadePage(),
    HomeScreen(),
    BarberShop(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.lightGrey, width: 4),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.purple,
          unselectedItemColor: AppColors.bottomSheetColor,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedLabelStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: AppColors.purple),
          unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'داشبورد',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.room_service_rounded),
              label: 'خدمات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_business_rounded),
              label: 'افزودن آگهی',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'چت',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop_rounded),
              label: 'آرایشگاه',
            ),
          ],
        ),
      ),
    );
  }
}



// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => BarberShopProvider(repository: BarberShopRepository()),
//       child: MaterialApp(
//         title: 'Barber Shop App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: BarberShopScreen(),
//       ),
//     );
//   }
// }