import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  String? selectedValue = 'نام آرایشگاه';

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height / 10,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(360),
            ),
            child: SizedBox(
              width: width / 12,
              height: width / 12,
              child: Image.asset(
                'assets/images/1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.notification_add, size: 25),
          const SizedBox(width: 10),
          const Icon(Icons.search, size: 25),
          const SizedBox(width: 10),
          const Icon(Icons.add_circle_outline_rounded, size: 25),
          const Spacer(),
          Container(
            height: width / 10,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(360),
              ),
              border: Border.all(color: AppColors.lightGrey),
            ),
            child: DropdownButton<String>(
              alignment: Alignment.centerLeft,
              underline: const SizedBox(),
              icon: const SizedBox(),
              value: selectedValue,
              items: ['نام آرایشگاه'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      const SizedBox(width: 3),
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(360),
                        ),
                        child: SizedBox(
                          width: width / 13,
                          height: width / 13,
                          child: Image.asset(
                            'assets/images/2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        value,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: AppColors.black),
                      ),
                      const SizedBox(width: 3),
                      const Icon(Icons.keyboard_arrow_down_sharp),
                      const SizedBox(width: 3),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
