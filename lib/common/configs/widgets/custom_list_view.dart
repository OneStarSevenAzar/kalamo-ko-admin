import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/configs/widgets/column_chart.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key, required this.type});

  final TypeListViewEnum type;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: selectedIndex != -1
          ? 340
          : widget.type == TypeListViewEnum.barberArtist
              ? 125
              : 300,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex == index
                      ? selectedIndex = -1
                      : selectedIndex = index;
                });
              },
              child: SizedBox(
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      height: widget.type == TypeListViewEnum.poroduct
                          ? selectedIndex == index
                              ? 350
                              : 280
                          : selectedIndex == index
                              ? 350
                              : 125,
                      width: widget.type == TypeListViewEnum.poroduct
                          ? selectedIndex == index
                              ? 320
                              : 150
                          : selectedIndex == index
                              ? 320
                              : 125,
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
                            // const SizedBox(width: 300),
                            Positioned(
                              top: 9,
                              left: 3,
                              child: Visibility(
                                visible: widget.type ==
                                        TypeListViewEnum.barberArtist &&
                                    selectedIndex == index,
                                child: const Icon(Icons.menu),
                              ),
                            ),
                            Positioned(
                              right:
                                  widget.type == TypeListViewEnum.barberArtist &&
                                          selectedIndex != index
                                      ? 6
                                      : 0,
                              top: widget.type == TypeListViewEnum.poroduct
                                  ? selectedIndex == index
                                      ? 8
                                      : 0
                                  : 6,
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: const Radius.circular(12),
                                  bottom: Radius.circular(
                                    widget.type == TypeListViewEnum.poroduct &&
                                            selectedIndex != index
                                        ? 0
                                        : 12,
                                  ),
                                ),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 250),
                                  height: widget.type == TypeListViewEnum.poroduct
                                      ? selectedIndex == index
                                          ? 110
                                          : 150
                                      : 110,
                                  width: widget.type == TypeListViewEnum.poroduct
                                      ? selectedIndex == index
                                          ? 110
                                          : 150
                                      : 110,
                                  child: Image.asset(
                                    'assets/images/1.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: selectedIndex == index ? 0 : 40,
                              top: selectedIndex == index ? 8 : 160,
                              child: getTexts(context, index),
                            ),
                            Positioned(
                              top: 120,
                              left: 0,
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
            ),
          );
        },
      ),
    );
  }

  Widget getTexts(BuildContext context, index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نام مدل مو',
          style: Theme.of(context).textTheme.titleMedium,
        ),
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
        widget.type == TypeListViewEnum.barberArtist
            ? Text(
                'متخصص رنگ مو',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppColors.grey),
              )
            : Text(
                '125,000 تومان',
                style: Theme.of(context).textTheme.titleMedium,
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
                    widget.type == TypeListViewEnum.barberArtist
                        ? 'ویرایش آرایشگر'
                        : 'ویرایش مدل',
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
                  height: 25,
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
    );
  }
}
