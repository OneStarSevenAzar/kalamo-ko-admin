import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber%20shop/statemanagment/customaize_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/configs/widgets/state_manage_widget.dart';
import 'package:shop_style/locator.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<BarberShopProvider>(context, listen: false)
            .fetchBarberShopData();
      },
    );
  }

  PageController controller = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Selector<BarberShopProvider, BlocStatus>(
      builder: (context, value, child) {
        locator.get<BarberShopProvider>().barberShopData;
        return StateManageWidget(
          status: value,
          loadingWidget: () {
            return const Center(child: CircularProgressIndicator());
          },
          errorWidgetBuilder: (message, statusCode) {
            return Center(child: Text(message!));
          },
          completedWidgetBuilder: (value) {
            return getCode(context);
          },
        );
      },
      selector: (p0, p1) {
        return p1.barberShopState;
      },
    );
  }

  Widget getCode(BuildContext context) {
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
            itemCount: getValueImage().length,
            itemBuilder: (context, index) {
              return getValueImage()[index];
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
                  '${getValueImage().length} / ${selectedIndex + 1}',
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

  List<Image> getValueImage() {
    return locator
        .get<BarberShopProvider>()
        .barberShopData!
        .images
        .map(
          (image) => Image.network(
            image.url,
            fit: BoxFit.cover,
          ),
        )
        .toList();
  }
}
