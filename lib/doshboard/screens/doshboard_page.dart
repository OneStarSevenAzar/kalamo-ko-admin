import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/widgets/custom_appbar.dart';
import 'package:shop_style/common/configs/widgets/fake_page.dart';
import 'package:shop_style/common/configs/widgets/show_more_button.dart';
import 'package:shop_style/common/configs/widgets/user_comments.dart';
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

class ViewComments extends StatelessWidget {
  const ViewComments({
    super.key,
  });

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
                    width: 110,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        width: 2,
                        color: AppColors.grey,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'جدیدترین',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: AppColors.black),
                        ),
                        const Icon(Icons.keyboard_arrow_down_rounded),
                      ],
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

///////////////////////

class PercentageBox extends StatelessWidget {
  const PercentageBox({
    super.key,
    required this.scores,
    required this.selectedScores,
  });

  final List<int> scores;
  final int selectedScores;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    // فرمول ریاضی برای محاسبه درصد//
    final int sum = scores[0] + scores[1] + scores[2] + scores[3] + scores[4];
    final int trySum = sum == 0 ? 1 : sum;
    final double percentage = selectedScores * 100 / trySum;
    final double percetageWid =
        (width / 1.44) - (percentage * (width / 1.44) / 100);
    // فرمول ریاضی برای محاسبه درصد//

    return Container(
      margin: EdgeInsets.only(
        top: height / 50,
        bottom: height / 50,
        right: width / 10,
        left: width / 15,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(365)),
        color: Color(0xFFE5E5E5),
      ),
      height: height / 200,
      child: Padding(
        padding: EdgeInsets.only(right: percetageWid),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(365)),
            color: Color(0xFF0D1619),
          ),
          height: height / 200,
        ),
      ),
    );
  }
}

//////////////////////
class PercentageBoxScore extends StatefulWidget {
  const PercentageBoxScore({super.key});

  @override
  State<PercentageBoxScore> createState() => _PercentageBoxScoreState();
}

class _PercentageBoxScoreState extends State<PercentageBoxScore> {
  int selectedIndex = -1;
  List<int> numberScore = [5, 4, 3, 2, 1];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final List<int> listScore = [55, 30, 16, 0, 1];
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: -width / 50,
              child: Checkbox(
                splashRadius: 5,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                checkColor: Colors.transparent,
                activeColor: AppColors.purple,
                value: selectedIndex == index,
                onChanged: (value) {
                  setState(() {
                    selectedIndex = value! ? index : -1;
                  });
                },
              ),
            ),
            Positioned(
              right: width / 15,
              child: Text(
                numberScore[index].toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            PercentageBox(
              selectedScores: listScore[index],
              scores: listScore,
            ),
            Positioned(
              left: 0,
              child: Text(
                listScore[index].toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        );
      },
    );
  }
}
