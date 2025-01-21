import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/configs/widgets/custom_appbar.dart';
import 'package:shop_style/common/configs/widgets/fake_page.dart';
import 'package:shop_style/common/configs/widgets/percentage_box.dart';
import 'package:shop_style/common/configs/widgets/selected_items.dart';
import 'package:shop_style/common/configs/widgets/show_more_button.dart';
import 'package:shop_style/common/configs/widgets/user_comments.dart';
import 'package:shop_style/doshboard/widgets/container_data.dart';
import 'package:shop_style/doshboard/widgets/ticket_reserve.dart';

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
                        'نظرات اخیر',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 25),
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
                              builder: (context) => const FakePage(
                                child: ViewComments(),
                              ),
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

class ViewComments extends StatefulWidget {
  const ViewComments({
    super.key,
  });

  @override
  State<ViewComments> createState() => _ViewCommentsState();
}

class _ViewCommentsState extends State<ViewComments> {
  List<String> myShops = ['جدیدترین', 'ترین'];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = myShops[0];
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 18),
              const Row(
                children: [
                  Icon(Icons.star, size: 30),
                  Icon(Icons.star, size: 30),
                  Icon(Icons.star, size: 30),
                  Icon(Icons.star, size: 30),
                  Icon(Icons.star_border, size: 30),
                  SizedBox(width: 4),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    '4.5 . ',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    '55 دیدگاه',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height / 40),
              Text(
                'فیلتر  ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: height / 60),
              SizedBox(
                height: height / 4.3,
                child: const PercentageBoxScore(),
              ),
              Row(
                children: [
                  Text(
                    '55 دیدگاه',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColors.grey),
                  ),
                  const Spacer(),
                  Text(
                    'مرتب سازی:',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: AppColors.grey),
                  ),
                  SizedBox(width: width / 40),
                  Container(
                    height: width / 10,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(360),
                      ),
                      border: Border.all(color: AppColors.lightGrey),
                    ),
                    child: DropdownButton<String>(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      alignment: Alignment.center,
                      underline: const SizedBox(),
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 3),
                        child: Icon(Icons.keyboard_arrow_down_rounded),
                      ),
                      value: selectedValue,
                      items: myShops.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              const SizedBox(width: 12),
                              Text(
                                value,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(color: AppColors.black),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 60),
            ],
          ),
        ),
        SliverList.builder(
          itemBuilder: (context, index) {
            return index != 5
                ? const UserComment()
                : const SizedBox(height: 50);
          },
          itemCount: 6,
        ),
      ],
    );
  }
}
