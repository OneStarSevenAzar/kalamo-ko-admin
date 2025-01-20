import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/configs/widgets/custom_appbar.dart';
import 'package:shop_style/common/configs/widgets/custom_list_view.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    const EdgeInsets bacePadding = EdgeInsets.symmetric(horizontal: 22);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: <Widget>[
              const SliverPadding(
                padding: bacePadding,
                sliver: SliverToBoxAdapter(
                  child: CustomAppbar(),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(right: 22),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'مدل موها',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 22),
                        const CustomListView(type: TypeListViewEnum.poroduct,),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 15)),
              SliverPadding(
                padding: const EdgeInsets.only(right: 22),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'محصولات',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 22),
                        const CustomListView(type: TypeListViewEnum.poroduct,),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 30)),
     
            ],
          ),
        ),
      ),
    );
  }
}
