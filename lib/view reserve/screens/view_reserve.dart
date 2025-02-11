import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/widgets/percentage_box.dart';
import 'package:shop_style/common/configs/widgets/user_comments.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shop_style/doshboard/widgets/ticket_reserve.dart';

class ViewReserve extends StatefulWidget {
  const ViewReserve({
    super.key,
  });

  @override
  State<ViewReserve> createState() => _ViewReserveState();
}

class _ViewReserveState extends State<ViewReserve> {
  List<String> myShops = ['جدیدترین', 'ترین'];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = myShops[0];
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          surfaceTintColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 15),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 18),
                      Text(
                        AppLocalizations.of(context)!.views_comment,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Row(
                        children: [
                          Icon(Icons.star, size: 30),
                          Icon(Icons.star, size: 30),
                          Icon(Icons.star, size: 30),
                          Icon(Icons.star, size: 30),
                          Icon(Icons.star_border, size: 30),
                          SizedBox(width: 4),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            '4.5 . ',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            '55 دیدگاه',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverList.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return index != 2
                        ? const TicketReserve(itemCount: 10)
                        : const SizedBox(height: 50);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
