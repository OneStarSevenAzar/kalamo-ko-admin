import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/enums.dart';

class SelectItem extends StatefulWidget {
  const SelectItem({
    super.key,
    this.nameItem = '',
    this.topPadding = 0,
    this.style,
    required this.items,
    this.hintText,
    this.selectItemEnum = SelectItemEnum.seletForList,
  });

  final String nameItem;
  final double topPadding;
  final TextStyle? style;
  final List<String> items;
  final String? hintText;
  final SelectItemEnum selectItemEnum;

  @override
  State<SelectItem> createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {
  String? selectedValue = 'تعیین کنید';
  List<String> newItems = ['تعیین کنید'];

  @override
  void initState() {
    super.initState();
    newItems.addAll(widget.items);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: widget.topPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                widget.nameItem,
                style: widget.style ?? Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              widget.selectItemEnum == SelectItemEnum.seletForList
                  ? getDropdown(height, context)
                  : Container(
                      width: width / 6,
                      height: width / 11,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(360)),
                        border: Border.all(
                          color: AppColors.grey,
                        ),
                      ),
                      child: const Icon(
                        Icons.date_range,
                        size: 30,
                        color: AppColors.grey,
                      ),
                    ),
            ],
          ),
          widget.hintText == null
              ? const SizedBox()
              : Text(
                  widget.hintText!,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: AppColors.grey),
                ),
        ],
      ),
    );
  }

  Widget getDropdown(double height, BuildContext context) {
    return SizedBox(
      height: height / 18,
      child: DropdownButton<String>(
        alignment: Alignment.centerLeft,
        underline: const SizedBox(),
        icon: const SizedBox(),
        value: selectedValue,
        items: newItems.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: value == 'تعیین کنید'
                ? Text(
                    value,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.purple),
                  )
                : Text(
                    value,
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
    );
  }
}
