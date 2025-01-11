import 'package:flutter/material.dart';
import 'package:shop_style/barber%20shop/screens/customaize_page.dart';
import 'package:shop_style/barber%20shop/screens/info_page.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/widgets/custom_appbar.dart';
import 'package:shop_style/common/configs/widgets/custom_tabbar.dart';

class BarberShop extends StatefulWidget {
  const BarberShop({super.key});

  @override
  State<BarberShop> createState() => _BarberShopState();
}

class _BarberShopState extends State<BarberShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              const SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: CustomAppbar(),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(right: 22, left: 22),
                sliver: SliverToBoxAdapter(
                  child: CustomTabbar(
                    onTabChange: (index) {},
                    tabs: const ['اطلاعات آرایشگاه', 'شخصی سازی فروشگاه'],
                    content: const [
                      SizedBox(
                        height: 800,
                        child: InfoPage(),
                      ),
                      SizedBox(
                        height: 800,
                        child: CustomaizePage(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
