import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/configs/widgets/custom_textfield.dart';
import 'package:shop_style/common/configs/widgets/selected_items.dart';
import 'package:shop_style/common/configs/widgets/upload_image.dart';

class ProductUploadePage extends StatelessWidget {
  const ProductUploadePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final double basicPadding = width / 20;

    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(
                  left: basicPadding,
                  right: basicPadding,
                  top: 40,
                  bottom: 15,
                ),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back, size: 20),
                      SizedBox(width: width / 30),
                      Text(
                        'افزودن مدل یا محصول',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: basicPadding),
                  child: const Column(
                    children: [
                      SelectItem(
                        nameItem: 'نوع خدمت یا محصول',
                        items: ['مدل مو', 'لوازم', 'رنگ مو'],
                      ),
                      SizedBox(height: 15),
                      Divider(height: 2, color: AppColors.grey),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: basicPadding),
                  child: const Column(
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
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: basicPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 15),
                      const SelectItem(
                        nameItem: 'اجرای مدل چند دقیقه طول میکشد؟',
                        items: ['a', 'b', 'c'],
                      ),
                      const SizedBox(height: 15),
                      const Divider(height: 2, color: AppColors.grey),
                      const SizedBox(height: 15),
                      const SelectItem(
                        nameItem: 'دستمزد انجام کار (قیمت به تومان)',
                        items: ['b', 'c'],
                      ),
                      SelectItem(
                        nameItem: 'تخفیف (اختیاری)',
                        items: const ['a', 'b', 'c'],
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: AppColors.red),
                      ),
                      const SizedBox(height: 15),
                      const SelectItem(
                        nameItem: 'پیش پرداخت رزرو نوبت',
                        hintText:
                            'در صورتی که این بخش تعیین نشود رزرو نوبت برای مشتریان شما رایگان خواهد بود',
                        items: ['a', 'b', 'c'],
                        selectItemEnum: SelectItemEnum.selectFordate,
                      ),
                      const SizedBox(height: 15),
                      const SelectItem(
                        nameItem: 'تخفیف های روزانه (اختیاری)',
                        hintText:
                            'از روی تقویم روزهایی که محصول یا مدل تخفیف دارد را مشخص کنید',
                        items: ['a', 'b', 'c'],
                      ),
                      const SizedBox(height: 15),
                      const Divider(height: 2, color: AppColors.grey),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: basicPadding),
                  child: getFooterWidget(context, width, height),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const Divider(height: 1, color: AppColors.grey),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: basicPadding),
                      child: Container(
                        height: height / 18,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.lightGrey, width: 2),
                          color: AppColors.black,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Center(
                          child: Text(
                            'ثبت آگهی مدل',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getFooterWidget(BuildContext context, double width, double height) {
    return Column(
      children: [
        const CustomTextfield(
          mainText: 'نام آرایشگاه *',
          hintText: 'نام آرایشگاه خود را وارد کنید',
          hintTextfield: 'نام آرایشگاه به طور پیشفرض پر میشود',
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'تگ ها *',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 5),
            Text(
              'برای محصول خود تگ بگذارید تا مشتریان راحت تر محصول شما را پیدا کنند',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(360)),
              child: Container(
                width: width,
                height: height / 18,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.lightGrey,
                    width: 1,
                  ),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 4,
                      ),
                      child: getTag(height, width, context, 'نام مدل مو'),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getTag(
      double height, double width, BuildContext context, String nameTag) {
    return Container(
      height: height / 25,
      decoration: const BoxDecoration(
        color: AppColors.purple,
        borderRadius: BorderRadius.all(Radius.circular(360)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 30),
        child: Center(
          child: Row(
            children: [
              const Icon(
                Icons.close,
                color: AppColors.white,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                nameTag,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
