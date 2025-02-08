import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/widgets/percentage_box.dart';
import 'package:shop_style/common/configs/widgets/user_comments.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewComments extends StatefulWidget {
  const ViewComments({
    super.key,
  });

  @override
  State<ViewComments> createState() => _ViewCommentsState();
}

class _ViewCommentsState extends State<ViewComments> {
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
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: height / 40),
                      Text(
                        'فیلتر  ',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: height / 60),
                      SizedBox(
                        height: height / 4.3,
                        child: const PercentageBoxScore(),
                      ),
                      Row(
                        children: [
                          Text(
                            '55 دیدگاه',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppColors.grey),
                          ),
                          const Spacer(),
                          Text(
                            AppLocalizations.of(context)!.sorting,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(color: AppColors.grey),
                          ),
                          SizedBox(width: width / 40),
                          Container(
                            height: width / 10,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(360),
                              ),
                              border: Border.all(color: AppColors.lightGrey),
                            ),
                            child: DropdownButton<String>(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              alignment: Alignment.center,
                              underline: const SizedBox(),
                              icon: const Padding(
                                padding: EdgeInsets.only(left: 3),
                                child: Icon(Icons.keyboard_arrow_down_rounded),
                              ),
                              value: selectedValue,
                              items: myShops.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 12),
                                      Text(
                                        value,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(color: AppColors.black),
                                      ),
                                    ],
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
                      SizedBox(height: height / 60),
                    ],
                  ),
                ),
                SliverList.builder(
                  itemBuilder: (context, index) {
                    return index != 5
                        ? UserComment(index: index)
                        : const SizedBox(height: 50);
                  },
                  itemCount: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
