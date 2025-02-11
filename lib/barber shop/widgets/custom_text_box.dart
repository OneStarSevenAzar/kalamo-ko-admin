import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class CustomTextBox extends StatefulWidget {
  const CustomTextBox({
    super.key,
    this.mainText = '',
    this.hintTextfield = '',
    this.onChanged,
  });

  final String mainText;
  final String hintTextfield;
  final Function(String value)? onChanged;
  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  final TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  String nameShop = '';
  bool absorbingTextfield = true;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          widget.mainText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        Container(
          height: height / 18,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGrey, width: 2),
            color: AppColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(360)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 40),
            child: Row(
              children: [
                SizedBox(
                  width: width / 1.3,
                  child: AbsorbPointer(
                    absorbing: absorbingTextfield,
                    child: TextField(
                      onChanged: widget.onChanged,
                      controller: controller,
                      focusNode: focusNode,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.hintTextfield,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.lightGrey),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      absorbingTextfield = !absorbingTextfield;
                      absorbingTextfield
                          ? focusNode.unfocus()
                          : focusNode.requestFocus();
                    });
                  },
                  child: const Icon(Icons.mode_rounded),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
