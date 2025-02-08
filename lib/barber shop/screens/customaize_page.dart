import 'package:flutter/material.dart';
import 'package:shop_style/barber%20shop/widgets/banner_slider.dart';
import 'package:shop_style/common/configs/widgets/upload_image.dart';

class CustomaizePage extends StatelessWidget {
  const CustomaizePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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
                  const ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                    child: SizedBox(
                      height: 300,
                      child: BannerSlider(),
                    ),
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
    );
  }
}
