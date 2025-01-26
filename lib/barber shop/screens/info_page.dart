import 'package:flutter/material.dart';
import 'package:shop_style/barber%20shop/widgets/custom_text_box.dart';
import 'package:shop_style/barber%20shop/widgets/edit_button.dart';
import 'package:shop_style/barber%20shop/widgets/input_box.dart';
import 'package:shop_style/barber%20shop/widgets/time_work.dart';
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

  @override
  Widget build(BuildContext context) {
    const EdgeInsets bacePadding = EdgeInsets.only(left: 22);

    return CustomScrollView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      slivers: <Widget>[
        SliverPadding(
          padding: bacePadding,
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                const CustomTextBox(
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
        SliverPadding(
          padding: bacePadding,
          sliver: SliverToBoxAdapter(
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
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Row(
                          children: [
                            const TimeWork(),
                            Visibility(
                              visible: activeEditTimeWorke,
                              child: const Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
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
}
