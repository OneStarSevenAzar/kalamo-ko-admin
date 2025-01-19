import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class ShowMoreButton extends StatelessWidget {
  const ShowMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height / 18,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGrey,
          width: 1,
        ),
        color: AppColors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(360),
        ),
      ),
      child: Center(
        child: Text(
          'مشاهده همه',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
