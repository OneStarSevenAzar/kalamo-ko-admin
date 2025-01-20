import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class UserComment extends StatelessWidget {
  const UserComment({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height / 80),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(360),
              child: SizedBox(
                width: 66,
                height: 66,
                child: Image.asset(
                  'assets/images/1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height / 100),
                Text(
                  'نام نویسنده دیدگاه',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: AppColors.black),
                ),
                SizedBox(height: height / 200),
                Text(
                  'یکشنبه 1 دی ماه 1403  .  ساعت 21:47',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: AppColors.grey),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: height / 200),
        const Row(
          children: [
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_border),
            SizedBox(width: 4),
          ],
        ),
        SizedBox(height: height / 200),
        Text(
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(height: height / 100),
        Container(
          width: 50,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.purple, width: 2),
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: Center(
            child: Text(
              'پاسخ',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: AppColors.purple),
            ),
          ),
        ),
        SizedBox(height: height / 80),
        const Divider(height: 2, color: AppColors.lightGrey),
      ],
    );
  }
}
