import 'package:flutter/material.dart';
import 'package:shop_style/barber%20shop/widgets/custom_text_box.dart';
import 'package:shop_style/barber%20shop/widgets/edit_button.dart';
import 'package:shop_style/barber%20shop/widgets/input_box.dart';
import 'package:shop_style/barber%20shop/widgets/activate.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/configs/widgets/custom_list_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  bool activeEditTimeWorke = false;
  List<String> timesWorkMorning = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22'
  ];
  List<String> timesWorkNight = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22'
  ];
  String? selectedMorning = '0';
  String? selectedNight = '0';

  @override
  Widget build(BuildContext context) {
    const EdgeInsets bacePadding = EdgeInsets.only(left: 22);

    return CustomScrollView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: bacePadding,
            child: Column(
              children: [
                const CustomTextBox(
                  // onChanged: (value) {
                  //   Provider.of<BarberShopProvider>(context, listen: false)
                  //       .fetchBarberShopPut(
                  //           name: 'asedfd',
                  //           isActive: true,
                  //           lat: 0,
                  //           long: 0,
                  //           barberShopId: 1);
                  // },
                  mainText: 'نام کامل آرایشگاه',
                  hintTextfield: 'نام کامل آرایشگاه',
                ),
                const SizedBox(height: 10),
                InputBox(
                  mainText: 'توضیحات آرایشگاه',
                  hintTextfield:
                      AppLocalizations.of(context)!.barbershop_description,
                ),
                const SizedBox(height: 10),
                const CustomTextBox(
                  mainText: 'آدرس وبسایت',
                  hintTextfield: 'در صورتی که وبسایت دارید آدرس آن را بنویسید',
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: bacePadding,
                child: EditButton(nameCategory: 'اعضای آرایشگاه'),
              ),
              SizedBox(height: 22),
              CustomListView(type: TypeListViewEnum.barberArtist),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: timeWork(bacePadding),
        ),
        const SliverPadding(
          padding: bacePadding,
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                InputBox(
                  hintTextfield: 'آدرس آرایشگاه خود را وارد کنید',
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget timeWork(EdgeInsets bacePadding) {
    return Padding(
      padding: bacePadding,
      child: Column(
        children: [
          const SizedBox(height: 40),
          EditButton(
            nameCategory: 'ساعت کاری',
            onTap: () {
              setState(() {
                activeEditTimeWorke = !activeEditTimeWorke;
              });
            },
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 240,
            child: Activate(
              hasActive: activeEditTimeWorke,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Visibility(
                                visible: activeEditTimeWorke,
                                child: const Icon(Icons.keyboard_arrow_down),
                              ),
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
                              Row(
                                children: [
                                  getDropdownTime(context, timesWorkMorning,
                                      selectedMorning),
                                  const Text(' صبح الی '),
                                  getDropdownTime(
                                      context, timesWorkNight, selectedNight),
                                  const Text(' شب'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getDropdownTime(
    BuildContext context,
    List<String> timesWork,
    String? selected,
  ) {
    return SizedBox(
      height: 27,
      child: DropdownButton<String>(
        enableFeedback: activeEditTimeWorke,
        alignment: Alignment.centerLeft,
        underline: const SizedBox(),
        icon: const SizedBox(),
        value: selected,
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
            selected = newValue;
          });
        },
      ),
    );
  }
}
