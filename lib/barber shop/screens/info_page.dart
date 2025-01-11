import 'package:flutter/material.dart';
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
                  SizedBox(height: 50,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    this.nameCategory = '',
  });

  final String nameCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'اعضای آرایشگاه',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        Container(
          width: 120,
          height: 45,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              width: 2,
              color: AppColors.purple,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              'ویرایش',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.purple,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

class InputBox extends StatelessWidget {
  const InputBox({
    super.key,
    this.mainText = '',
    this.hintTextfield = '',
  });

  final String mainText;
  final String hintTextfield;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          mainText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGrey, width: 2),
            color: AppColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 40),
            child: TextField(
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintTextfield,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.lightGrey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextBox extends StatefulWidget {
  const CustomTextBox({
    super.key,
    this.mainText = '',
    this.hintTextfield = '',
  });

  final String mainText;
  final String hintTextfield;

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  final TextEditingController controller = TextEditingController();
  String nameShop = '';
  bool absorbingTextfield = true;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          widget.mainText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        Container(
          height: height / 18,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGrey, width: 2),
            color: AppColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(360)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 40),
            child: Row(
              children: [
                SizedBox(
                  width: width / 1.3,
                  child: AbsorbPointer(
                    absorbing: absorbingTextfield,
                    child: TextField(
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.hintTextfield,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.lightGrey),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      absorbingTextfield = !absorbingTextfield;
                    });
                  },
                  child: const Icon(Icons.security),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TimeWork extends StatelessWidget {
  const TimeWork({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Text(
          '10 صبح الی 9 شب',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.black),
        ),
      ],
    );
  }
}
