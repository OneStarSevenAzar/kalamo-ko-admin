import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    this.nameCategory = '',
    this.onTap,
    this.editing = true,
  });

  final String nameCategory;
  final GestureTapCallback? onTap;
  final bool editing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          nameCategory,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap ?? () {},
          child: Container(
            width: 120,
            height: 45,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                width: 2,
                color: AppColors.purple,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: Text(
                editing ? 'ویرایش' : 'تایید',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.purple,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
