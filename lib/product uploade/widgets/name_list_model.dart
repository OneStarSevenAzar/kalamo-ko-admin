import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class NameListModel extends StatefulWidget {
  const NameListModel({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  State<NameListModel> createState() => _NameListModelState();
}

class _NameListModelState extends State<NameListModel> {
  List<String> items = ['a', 'b'];
  List<String> newItems = ['انتخاب از لیست مدل موها'];

  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = newItems[0];
    newItems.addAll(items);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
      height: height / 18,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey, width: 2),
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(360)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 40),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            const Positioned(
              left: 0,
              child: Icon(Icons.keyboard_arrow_down),
            ),
            SizedBox(
              width: width,
              height: height / 18,
              child: DropdownButton<String>(
                alignment: Alignment.centerLeft,
                underline: const SizedBox(),
                icon: const SizedBox(),
                value: selectedValue,
                items: newItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodySmall,
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
      ),
    );
  }
}
