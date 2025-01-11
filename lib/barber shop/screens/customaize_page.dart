import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/widgets/upload_image.dart';

class CustomaizePage extends StatelessWidget {
  const CustomaizePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'تصویر آرایشگاه',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'تصویری از محیط آرایشگاه خود آپلود کنید',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 10),
                    Stack(
                      children: [
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.lightGrey, width: 2),
                            color: AppColors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Image.asset(
                            'assets/images/2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 22,
                          bottom: 12,
                          child: Container(
                            height: 30,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: AppColors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(360)),
                            ),
                            child: Center(
                              child: Text(
                                '5 / 1',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: UploadeImage(
                  mainText: 'لوگو',
                  hintText:
                      'تصویر لوگو یا یکی از عکس های محیط آرایشگاه خود را آپلود کنید',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
