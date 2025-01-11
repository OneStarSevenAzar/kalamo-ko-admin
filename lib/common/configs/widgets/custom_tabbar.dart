import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class CustomTabbar extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> content;
  final Function(int index) onTabChange;
  const CustomTabbar({
    super.key,
    required this.tabs,
    required this.content,
    required this.onTabChange,
  });

  @override
  State<CustomTabbar> createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...List.generate(
              widget.tabs.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      width: 150,
                      height: 45,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(
                          width: 2,
                          color: currentIndex == index
                              ? AppColors.purple
                              : AppColors.lightGrey,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Text(
                          widget.tabs[index],
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: currentIndex == index
                                        ? AppColors.purple
                                        : AppColors.black,
                                  ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: widget.content[currentIndex],
        ),
      ],
    );
  }
}
