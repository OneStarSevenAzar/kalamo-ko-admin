import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class InputBox extends StatelessWidget {
  const InputBox({
    super.key,
    this.mainText = '',
    this.hintTextfield = '',
  });

  final String mainText;
  final String hintTextfield;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          mainText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGrey, width: 2),
            color: AppColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 40),
            child: TextField(
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintTextfield,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.lightGrey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
