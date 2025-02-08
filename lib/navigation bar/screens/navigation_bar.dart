import 'package:flutter/material.dart';
import 'package:shop_style/barber%20shop/screens/barber_shop.dart';
import 'package:shop_style/doshboard/screens/doshboard_page.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/home/screens/home_screen.dart';
import 'package:shop_style/pervice/services_page.dart';
import 'package:shop_style/product%20uploade/product_uploade_page.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});
  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
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
