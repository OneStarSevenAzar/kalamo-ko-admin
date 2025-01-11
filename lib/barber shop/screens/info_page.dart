import 'package:flutter/material.dart';
import 'package:shop_style/barber%20shop/widgets/custom_text_box.dart';
import 'package:shop_style/barber%20shop/widgets/edit_button.dart';
import 'package:shop_style/barber%20shop/widgets/input_box.dart';
import 'package:shop_style/barber%20shop/widgets/time_work.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/widgets/custom_list_view.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomTextBox(
                    mainText: 'نام کامل آرایشگاه',
                    hintTextfield: 'نام کامل آرایشگاه',
                  ),
                  SizedBox(height: 10),
                  InputBox(
                    mainText: 'توضیحات آرایشگاه',
                    hintTextfield: 'توضیحاتی را درمورد آرایشگاه خود بنوسید.',
                  ),
                  SizedBox(height: 10),
                  CustomTextBox(
                    mainText: 'آدرس وبسایت',
                    hintTextfield:
                        'در صورتی که وبسایت دارید آدرس آن را بنویسید',
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  EditButton(nameCategory: 'اعضای آرایشگاه'),
                  SizedBox(height: 22),
                  CustomListView(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const EditButton(nameCategory: 'ساعت کاری'),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: TimeWork(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  InputBox(
                    hintTextfield: 'آدرس آرایشگاه خود را وارد کنید',
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
