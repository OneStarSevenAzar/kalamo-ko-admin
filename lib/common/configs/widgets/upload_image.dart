import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class UploadeImage extends StatelessWidget {
  const UploadeImage({
    super.key,
    this.mainText = '',
    this.hintText = '',
    this.hintStyle,
    this.importantText = false,
  });

  final String mainText;
  final String hintText;
  final TextStyle? hintStyle;
  final bool importantText;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          mainText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 5),
        importantText
            ? getImportantAsText(context)
            : Text(
                hintText,
                style: Theme.of(context).textTheme.bodySmall,
              ),
        const SizedBox(height: 16),
        Container(
          width: width / 4,
          height: width / 4,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: AppColors.grey,
            ),
          ),
          child: const Icon(
            Icons.drive_folder_upload_outlined,
            size: 50,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }

  Widget getImportantAsText(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text:
                'در صورتی که قبلا این مدل را اجرا کرده اید و تصویر قبل و بعد از اجرای آن را داری',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          TextSpan(
            text: ' تصویر قبل ',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          TextSpan(
            text: 'را در این محل آپلود کنید',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
