import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

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
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: -width / 30,
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
              right: width / 18,
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
