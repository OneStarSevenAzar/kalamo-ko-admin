import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/widgets/custom_appbar.dart';
import 'package:shop_style/common/configs/widgets/scoring.dart';
import 'package:shop_style/common/configs/widgets/show_more_button.dart';
import 'package:shop_style/doshboard/screens/widgets/container_data.dart';
import 'package:shop_style/doshboard/screens/widgets/ticket_reserve.dart';

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
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 15),
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
                        'نمای کلی',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 250,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 120,
                            crossAxisSpacing: 50,
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
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
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
                        'نظرات اخیر',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 730,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return getComments(height);
                          },
                        ),
                      ),
                      const ShowMoreButton(),
                      const SizedBox(height: 50),
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

  Widget getComments(height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height / 40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(360),
              child: SizedBox(
                width: 66,
                height: 66,
                child: Image.asset(
                  'assets/images/1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height / 100),
                Text(
                  'نام نویسنده دیدگاه',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: AppColors.black),
                ),
                SizedBox(height: height / 200),
                Text(
                  'یکشنبه 1 دی ماه 1403  .  ساعت 21:47',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: AppColors.grey),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: height / 100),
        const Scoring(
          hasShowNumberScore: false,
          hasShowVotes: false,
        ),
        SizedBox(height: height / 200),
        Text(
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: height / 100),
        const Divider(height: 2, color: AppColors.lightGrey),
        SizedBox(height: height / 80),
        Container(
          width: 70,
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.purple, width: 2),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Center(
            child: Text(
              'پاسخ',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: AppColors.purple),
            ),
          ),
        )
      ],
    );
  }
}
