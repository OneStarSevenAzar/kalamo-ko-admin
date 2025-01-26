import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class TimeWork extends StatefulWidget {
  const TimeWork({
    super.key,
  });

  @override
  State<TimeWork> createState() => _TimeWorkState();
}

class _TimeWorkState extends State<TimeWork> {
  List<String> timesWork = ['10 صبح الی 9 شب'];
  @override
  Widget build(BuildContext context) {
    String? selectedValue = '10 صبح الی 9 شب';

    return Expanded(
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.green,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'شنبه',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.black),
          ),
          const Spacer(),
          SizedBox(
            height: 27,
            child: DropdownButton<String>(
              alignment: Alignment.centerLeft,
              underline: const SizedBox(),
              icon: const SizedBox(),
              value: selectedValue,
              items: timesWork.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.black),
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
