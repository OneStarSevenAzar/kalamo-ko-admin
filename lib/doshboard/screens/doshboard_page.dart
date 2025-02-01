import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/widgets/custom_appbar.dart';
import 'package:shop_style/common/configs/widgets/show_more_button.dart';
import 'package:shop_style/common/configs/widgets/user_comments.dart';
import 'package:shop_style/date_picker_view.dart';
import 'package:shop_style/doshboard/widgets/container_data.dart';
import 'package:shop_style/doshboard/widgets/ticket_reserve.dart';
import 'package:shop_style/view%20comments/screens/view_comments.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DoshboardPage extends StatefulWidget {
  const DoshboardPage({super.key});

  @override
  State<DoshboardPage> createState() => _DoshboardPageState();
}

class _DoshboardPageState extends State<DoshboardPage> {
  final List<IconData> iconBox = [
    Icons.person_pin_sharp,
    Icons.date_range,
    Icons.settings,
    Icons.production_quantity_limits,
  ];

  final List<String> titles = [
    'همه مشتریان',
    'همه رزرو ها',
    'خدمات شما',
    'محصولات شما',
  ];
  final List<int> numbers = [1521, 1711, 27, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: CustomAppbar(),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.card_items,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 120,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return ContainerData(
                      icon: iconBox[index],
                      title: titles[index],
                      number: numbers[index],
                    );
                  },
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        'رزرو های اخیر',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 300,
                        decoration: const BoxDecoration(
                          color: AppColors.lightGrey2,
                          borderRadius: BorderRadius.all(Radius.circular(22)),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Container(
                            height: 13,
                            width: 13,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.green,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'چهارشنبه، 7 دی ماه، 1403',
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ],
                      ),
                      const TicketReserve(),
                      const SizedBox(width: 12),
                      const ShowMoreButton(),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 25),
                      Text(
                        AppLocalizations.of(context)!.history_comment,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 650,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return const UserComment();
                          },
                        ),
                      ),
                      ShowMoreButton(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ViewComments(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
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
