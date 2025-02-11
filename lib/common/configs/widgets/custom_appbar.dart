import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber%20shop/statemanagment/customaize_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/configs/widgets/state_manage_widget.dart';
import 'package:shop_style/locator.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  void initState() {
    super.initState();

    selectedValue = myShops[0];
  }

  List<String> myShops = ['نام آرایشگاه', 'نام آرایشگاه 2'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
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
                  // const Icon(Icons.add_circle_outline_rounded, size: 25),
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
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      alignment: Alignment.centerRight,
                      underline: const SizedBox(),
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 3),
                        child: Icon(Icons.keyboard_arrow_down_rounded),
                      ),
                      value: selectedValue,
                      items: myShops.map((String value) {
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
          },
        );
      },
      selector: (p0, p1) {
        return p1.barberShopState;
      },
    );
  }
}
