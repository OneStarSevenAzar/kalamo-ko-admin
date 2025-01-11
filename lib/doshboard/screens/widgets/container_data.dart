import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class ContainerData extends StatelessWidget {
  const ContainerData({
    super.key,
    required this.icon,
    required this.title,
    required this.number,
  });

  final IconData icon;
  final String title;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: const BoxDecoration(
            color: AppColors.lightGrey2,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.settings,
                  color: AppColors.grey,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  number.toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
