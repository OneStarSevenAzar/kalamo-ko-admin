import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/configs/widgets/custom_textfield.dart';
import 'package:shop_style/common/configs/widgets/selected_items.dart';
import 'package:shop_style/common/configs/widgets/upload_image.dart';
import 'package:shop_style/product%20uploade/widgets/name_list_model.dart';

class ProductUploadePage extends StatefulWidget {
  const ProductUploadePage({super.key});

  @override
  State<ProductUploadePage> createState() => _ProductUploadePageState();
}

class _ProductUploadePageState extends State<ProductUploadePage> {
  DateTime timeWorkInModel = DateTime.utc(0, 0, 0);
  
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
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: basicPadding),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        'افزودن مدل یا محصول',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 15),
                      const SelectItem(
                        nameItem: 'نوع خدمت یا محصول',
                        items: ['مدل مو', 'لوازم', 'رنگ مو'],
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            'تصویر مدل',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'برای مدل خود تصویر آپلود کنید.',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            children: [
                              UploadeImage(),
                              Spacer(),
                              UploadeImage(),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            'تصویر قبل و بعد از اجرا',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(
                                Icons.error,
                                color: AppColors.yellow,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: ':نکته  ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                      TextSpan(
                                        text:
                                            'در صورتی که قبلا این مدل را اجرا کرده اید و تصویر قبل و بعد از اجرای آن را دارید در این محل آپلود کنید',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(color: AppColors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Column(
                                children: [
                                  const UploadeImage(),
                                  const SizedBox(height: 16),
                                  Text(
                                    'تصویر قبل و بعد از اجرا',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(color: AppColors.grey),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  const UploadeImage(),
                                  const SizedBox(height: 16),
                                  Text(
                                    'تصویر بعد از اجرا',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(color: AppColors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: basicPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextfield(
                        mainText: 'نام مدل مو *',
                        hintText: 'نام مدل مو را وارد کنید',
                        hintTextfield: 'عنوان مدل خود را بنویسید ',
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Expanded(
                              child: Divider(height: 2, color: AppColors.grey)),
                          Text(
                            ' یا ',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const Expanded(
                              child: Divider(height: 2, color: AppColors.grey)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      NameListModel(context: context),
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
                      Row(
                        children: [
                          Text(
                            'اجرای مدل چند دقیقه طول میکشد؟',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                scrollControlDisabledMaxHeightRatio: 0.4,
                                context: context,
                                builder: (context) => const MyHomePage(),
                              );
                            },
                            child: Text(
                              'تعیین کنید',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: AppColors.purple),
                            ),
                          ),
                        ],
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
                            .bodyMedium
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
                          color: AppColors.purple,
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
                height: 60,
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
    return Row(
      children: [
        Container(
          height: 37,
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
        ),
      ],
    );
  }
}

///////////////////////////////////

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 125,
            child: Text(
              ':',
              style:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 50),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // hourMinute12H(),
              hourMinute15Interval(width),
              // hourMinuteSecond(),
              // hourMinute12HCustomStyle(),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: width / 2.5,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: AppColors.lightGrey)),
                    child: Center(
                      child: Text('پاک کردن همه',
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: width / 2.5,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: AppColors.timePicker,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Center(
                      child: Text(
                        'اعمال',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
              // Container(
              //   margin: const EdgeInsets.symmetric(vertical: 50),
              //   child: Text(
              //     '${_dateTime.hour.toString().padLeft(2, '0')}:${_dateTime.minute.toString().padLeft(2, '0')}:${_dateTime.second.toString().padLeft(2, '0')}',
              //     style:
              //         const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  /// SAMPLE
  Widget hourMinute12H() {
    return TimePickerSpinner(
      is24HourMode: false,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }

  Widget hourMinuteSecond() {
    return TimePickerSpinner(
      isShowSeconds: true,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }

  Widget hourMinute15Interval(width) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ساعت', style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(width: width / 3.2),
            Text('دقیقه', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        TimePickerSpinner(
          alignment: Alignment.center,
          highlightedTextStyle: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: AppColors.timePicker,
          ),
          normalTextStyle: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: AppColors.timePickerLight,
          ),
          spacing: width / 3,
          minutesInterval: 5,
          onTimeChange: (time) {
            setState(() {
              _dateTime = time;
              
            });
          },
        ),
      ],
    );
  }

  Widget hourMinute12HCustomStyle() {
    return TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: const TextStyle(fontSize: 24, color: Colors.deepOrange),
      highlightedTextStyle: const TextStyle(fontSize: 24, color: Colors.yellow),
      spacing: 50,
      itemHeight: 80,
      isForce2Digits: true,
      minutesInterval: 15,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
}
