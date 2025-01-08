import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class ProductUploadePage extends StatelessWidget {
  const ProductUploadePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 15),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 9, bottom: 40),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(Icons.arrow_back, size: 20),
                        ),
                        SizedBox(width: width / 30),
                        Text(
                          'افزودن مدل یا محصول',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SelectItem(
                        nameItem: 'نوع خدمت یا محصول',
                        testText: 'مدل مو',
                      ),
                      SizedBox(height: 15),
                      Divider(
                        height: 2,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UploadeImage(
                        mainText: 'تصویر مدل',
                        hintText: 'برای مدل خود تصویر آپلود کنید.',
                      ),
                      UploadeImage(
                        mainText: 'تصویر قبل از اجرا',
                        importantText: true,
                      ),
                      UploadeImage(
                        mainText: 'تصویر بعد از اجرا',
                        hintText: 'تصویر بعد از اجرا را در این محل آپلود کنید',
                      ),
                      CustomTextfield(
                        mainText: 'نام مدل مو *',
                        hintText: 'نام مدل مو را وارد کنید',
                        hintTextfield: 'عنوان مدل خود را بنویسید ',
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SelectItem(
                        nameItem: 'اجرای مدل چند دقیقه طول میکشد؟',
                        testText: 'تعیین کنید',
                        topPadding: 22,
                      ),
                      SizedBox(height: 15),
                      Divider(
                        height: 2,
                        color: AppColors.grey,
                      ),
                      SelectItem(
                        nameItem: 'اجرای مدل چند دقیقه طول میکشد؟',
                        testText: 'تعیین کنید',
                        topPadding: 22,
                      ),
                      SelectItem(
                        nameItem: 'اجرای مدل چند دقیقه طول میکشد؟',
                        testText: 'تعیین کنید',
                        topPadding: 22,
                      ),
                      SelectItem(
                        nameItem: 'اجرای مدل چند دقیقه طول میکشد؟',
                        testText: 'تعیین کنید',
                        topPadding: 22,
                      ),
                      // CustomDropdown(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectItem extends StatelessWidget {
  const SelectItem({
    super.key,
    this.nameItem = '',
    this.testText = '',
    this.topPadding = 0,
  });

  final String nameItem;
  final String testText;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Row(
        children: [
          Text(
            nameItem,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(),
          Text(
            testText,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.mainText = '',
    this.hintText = '',
    this.hintTextfield = '',
  });

  final String mainText;
  final String hintText;
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
        const SizedBox(height: 5),
        Text(
          hintText,
          style: Theme.of(context).textTheme.bodySmall,
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

class UploadeImage extends StatelessWidget {
  const UploadeImage({
    super.key,
    this.mainText = '',
    this.hintText = '',
    this.hintStyle,
    this.importantText = false,
  });

  final String mainText;
  final String hintText;
  final TextStyle? hintStyle;
  final bool importantText;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          mainText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 5),
        importantText
            ? getImportantAsText(context)
            : Text(
                hintText,
                style: Theme.of(context).textTheme.bodySmall,
              ),
        const SizedBox(height: 16),
        Container(
          width: width / 4,
          height: width / 4,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: AppColors.grey,
            ),
          ),
          child: const Icon(
            Icons.drive_folder_upload_outlined,
            size: 50,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }

  Widget getImportantAsText(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text:
                'در صورتی که قبلا این مدل را اجرا کرده اید و تصویر قبل و بعد از اجرای آن را داری',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          TextSpan(
            text: ' تصویر قبل ',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          TextSpan(
            text: 'را در این محل آپلود کنید',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});
  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue = 'زرد';
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: height / 18,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey, width: 2),
              color: AppColors.white,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: DropdownButton<String>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColors.black,
                size: 30,
              ),
              value: selectedValue,
              items: <String>['زرد', 'قرمز', 'سبز', 'آبی'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: Stack(
                      children: [
                        SizedBox(width: width / 1.5),
                        Text(
                          value,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppColors.black),
                        ),
                      ],
                    ),
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
