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
              color: Colors.white,
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
                    color: selectedIndex == index
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
            const SizedBox(height: 4),
            Text(
              numberView[0].toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 4),
            Text(
              numberView[1].toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 4),
            Text(
              numberView[2].toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 4),
            Text(
              numberView[3].toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 4),
            Text(
              numberView[4].toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 4),
            Text(
              numberView[5].toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 4),
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
