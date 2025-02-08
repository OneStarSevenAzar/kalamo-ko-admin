import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber%20shop/statemanagment/customaize_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/configs/widgets/state_manage_widget.dart';
import 'package:shop_style/locator.dart';

class UserComment extends StatefulWidget {
  const UserComment({super.key, required this.index});
  final int index;

  @override
  State<UserComment> createState() => _UserCommentState();
}

class _UserCommentState extends State<UserComment> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<BarberShopProvider>(context, listen: false)
            .fetchBarberShopData();
      },
    );
  }

  var api = locator.get<BarberShopProvider>().barberShopData!;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Selector<BarberShopProvider, BlocStatus>(
      builder: (context, value, child) {
        locator.get<BarberShopProvider>().barberShopData;
        return StateManageWidget(
          status: value,
          loadingWidget: () {
            return const Center(child: CircularProgressIndicator());
          },
          errorWidgetBuilder: (message, statusCode) {
            return Center(child: Text(message!));
          },
          completedWidgetBuilder: (value) {
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
                          // 'یکشنبه 1 دی ماه 1403  .  ساعت 21:47',
                          api.comments[widget.index].createdAt,
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
                SizedBox(
                  height: 20,
                  width: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return getRating(widget.index)[index];
                    },
                  ),
                ),
                SizedBox(height: height / 200),
                Text(
                  api.comments[widget.index].comment,
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
          },
        );
      },
      selector: (p0, p1) {
        return p1.barberShopState;
      },
    );
  }

  List<Icon> getRating(numComment) {
    List<Icon> listIcon = [];

    for (var i = 0; i < 5; i++) {
      if (i < (api.comments[numComment].rating!)) {
        listIcon.add(const Icon(Icons.star));
      } else {
        listIcon.add(const Icon(Icons.star_border));
      }
    }

    return listIcon;
  }
}
