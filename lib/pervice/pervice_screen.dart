import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/widgets/custom_appbar.dart';
import 'package:shop_style/common/configs/widgets/custom_list_view.dart';

class PerviceScreen extends StatefulWidget {
  const PerviceScreen({super.key});

  @override
  State<PerviceScreen> createState() => _PerviceScreenState();
}

class _PerviceScreenState extends State<PerviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: CustomScrollView(
              slivers: <Widget>[
                const SliverToBoxAdapter(
                  child: CustomAppbar(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'مدل موها',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 22),
                        const CustomListView(),
                      ],
                    ),
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(top: 15)),
                SliverToBoxAdapter(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'محصولات',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 22),
                        const CustomListView(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
