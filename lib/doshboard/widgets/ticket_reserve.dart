import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class TicketReserve extends StatefulWidget {
  const TicketReserve({
    super.key,
  });

  @override
  State<TicketReserve> createState() => _TicketReserveState();
}

class _TicketReserveState extends State<TicketReserve> {
  int selectedIndex = 0;
  double heightSize = 450;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: heightSize,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: getChildTicketReserve(index, width, context),
          );
        },
      ),
    );
  }

  Widget getChildTicketReserve(int index, double width, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedIndex != index) {
            selectedIndex = index;
            heightSize = 450;
          } else {
            selectedIndex = -1;
            heightSize = 260;
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        height: selectedIndex == index ? 250 : 55,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightGrey,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            selectedIndex == index
                ? const Radius.circular(16)
                : const Radius.circular(48),
          ),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      '10:00 صبح',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Spacer(),
                    selectedIndex == index
                        ? const Icon(Icons.keyboard_arrow_up_rounded)
                        : const Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'مدل موی خامه ای',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.black,
                                  ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time_rounded,
                              size: 15,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '40 دقیقه',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Text(
                          '125,000 تومان',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const Spacer(),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      child: SizedBox(
                        height: width / 7,
                        width: width / 7,
                        child: Image.asset(
                          'assets/images/1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.lightGrey, height: 2),
                const SizedBox(height: 16),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(365),
                      ),
                      child: SizedBox(
                        height: width / 7,
                        width: width / 7,
                        child: Image.asset(
                          'assets/images/1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'نام مشتری',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                color: AppColors.black,
                              ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '09120000000  .  یکشنبه، 21  .  ساعت 21:47',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
