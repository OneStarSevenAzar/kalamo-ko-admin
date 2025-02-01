import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

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
  List<int> numberDay = [1, 2, 3, 4, 5, 6, 7];

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
              color: Colors.grey,
              spreadRadius: 0.1,
              blurRadius: 8,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            children: [
              SizedBox(
                height: 175,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return index == 0
                        ? getColView()
                        : getColNemodar(index, paddingNemodar[index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 31),
                child: SizedBox(
                  height: 20,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          numberDay[index].toString(),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
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
                bottom: topPadding + 25,
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
                const SizedBox(width: 38),
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
                                AppColors.boldPurple,
                                AppColors.cyan,
                              ],
                            ),
                          )
                        : const BoxDecoration(
                            color: AppColors.darkWhite,
                          ),
                  ),
                ),
                const SizedBox(height: 8),
                selectedIndex == index
                    ? Container(
                        height: 7,
                        width: 7,
                        decoration: const BoxDecoration(
                          color: AppColors.cyan,
                          shape: BoxShape.circle,
                        ),
                      )
                    : Container(
                        height: 5,
                        width: 5,
                        decoration: const BoxDecoration(
                          color: AppColors.purple,
                          shape: BoxShape.circle,
                        ),
                      ),
                const SizedBox(height: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getColView() {
    List<int> numberView = [60, 50, 40, 30, 20, 10, 0];
    return Expanded(
      child: SizedBox(
        width: 30,
        height: 200,
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverPadding(padding: EdgeInsets.only(top: 15)),
            SliverList.builder(
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Text(
                    index == 0 ? 'بازدید' : numberView[index - 1].toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                );
              },
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 15)),
          ],
        ),
      ),
    );
  }
}
