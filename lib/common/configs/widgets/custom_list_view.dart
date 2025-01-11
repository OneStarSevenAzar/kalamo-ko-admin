import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/widgets/column_chart.dart';

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
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: AppColors.black),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
