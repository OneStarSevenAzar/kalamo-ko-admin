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
        child: Padding(
          padding: const EdgeInsets.only(left: 22),
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
        ),
      ),
    );
  }
}

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  List<String> images = ['assets/images/1.png', 'assets/images/2.png'];
  PageController controller = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            onPageChanged: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            controller: controller,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.cover,
              );
            },
          ),
          Positioned(
            right: 22,
            bottom: 12,
            child: Container(
              height: 30,
              width: 50,
              decoration: const BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.all(Radius.circular(360)),
              ),
              child: Center(
                child: Text(
                  '${images.length} / ${selectedIndex + 1}',
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
    );
  }
}
