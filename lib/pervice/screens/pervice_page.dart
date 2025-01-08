import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

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

class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: index == 0 ? 0 : 16),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: selectedIndex == index ? 340 : 280,
                    width: selectedIndex == index ? 320 : 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      border: Border.all(color: AppColors.lightGrey),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: selectedIndex == index ? 8 : 0,
                      ),
                      child: Stack(
                        children: [
                          const SizedBox(width: 300),
                          Positioned(
                            right: 0,
                            top: selectedIndex == index ? 8 : 0,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              child: SizedBox(
                                height: selectedIndex == index ? 110 : 150,
                                width: selectedIndex == index ? 110 : 150,
                                child: Image.asset(
                                  'assets/images/1.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: selectedIndex == index ? 0 : 45,
                            top: selectedIndex == index ? 8 : 160,
                            child: getTexts(context, index),
                          ),
                          Positioned(
                            top: 120,
                            child: selectedIndex == index
                                ? const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: ColumnChart(),
                                  )
                                : const SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getTexts(BuildContext context, index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'نام مدل مو',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              Text(
                '(55)',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: AppColors.purple),
              ),
              const SizedBox(width: 4),
              Text(
                '4.4',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Icon(Icons.star_rounded, size: 20),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            '125,000 تومان',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 2),
          selectedIndex == index
              ? Container(
                  height: 37,
                  width: 175,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.purple,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'ویرایش مدل',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: AppColors.purple),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    height: 30,
                    width: 95,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.lightGrey,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(360),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'مدل مو',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class ColumnChart extends StatefulWidget {
  const ColumnChart({
    super.key,
  });

  @override
  State<ColumnChart> createState() => _ColumnChartState();
}

class _ColumnChartState extends State<ColumnChart> {
  int selectedIndex = 1;
  List<double> paddingNemodar = [0, 100, 50, 4, 35, 90, 9, 130];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        height: 200,
        width: 300,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              spreadRadius: 1,
              blurRadius: 8,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ListView.builder(
            itemCount: 9,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return index == 0
                  ? getColView()
                  : index == 8
                      ? getColEnd()
                      : getColNemodar(index, paddingNemodar[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget getColNemodar(int index, double topPadding) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        color: const Color(0xFFFFFFFF),
        child: Stack(
          children: [
            Visibility(
              visible: selectedIndex == index,
              child: Positioned(
                bottom: topPadding + 35,
                child: Container(
                  height: 20,
                  width: 30,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.darkWhite,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                  child: Center(
                    child: Text(
                      topPadding.toInt().toString(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 37),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  child: Container(
                    height: topPadding,
                    width: 15,
                    decoration: selectedIndex == index
                        ? const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.purple,
                                AppColors.darkWhite,
                              ],
                            ),
                          )
                        : const BoxDecoration(
                            color: AppColors.darkWhite,
                          ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    color: selectedIndex != index
                        ? AppColors.purple
                        : AppColors.darkWhite,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 17),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getColEnd() {
    return Expanded(
      child: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.only(top: 173),
          child: Text(
            'روز',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.lightGrey2,
                ),
          ),
        ),
      ),
    );
  }

  Widget getColView() {
    List<int> numberView = [60, 50, 40, 30, 20, 10, 0];
    return Expanded(
      child: SizedBox(
        height: 200,
        child: Column(
          children: [
            const SizedBox(height: 6.5),
            Text(
              'بازدید',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 13),
            Text(
              numberView[0].toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 13),
            Text(
              numberView[1].toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 13),
            Text(
              numberView[2].toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 13),
            Text(
              numberView[3].toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 13),
            Text(
              numberView[4].toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 13),
            Text(
              numberView[5].toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 13),
            Text(
              numberView[6].toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
