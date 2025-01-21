import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_style/common/configs/colors.dart';

class UploadeImage extends StatefulWidget {
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
  State<UploadeImage> createState() => _UploadeImageState();
}

class _UploadeImageState extends State<UploadeImage> {
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          widget.mainText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 5),
        widget.importantText
            ? getImportantAsText(context)
            : Text(
                widget.hintText,
                style: Theme.of(context).textTheme.bodySmall,
              ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            _pickImage();
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Container(
              width: width / 4,
              height: width / 4,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                  color: AppColors.purple,
                ),
              ),
              child: _image == null
                  ? const Icon(
                      Icons.drive_folder_upload_outlined,
                      size: 50,
                      color: AppColors.grey,
                    )
                  : Image.file(_image!, fit: BoxFit.cover),
            ),
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
