import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber%20shop/statemanagment/customaize_controller.dart';
import 'package:shop_style/common/configs/colors.dart';

class UploadeImage extends StatefulWidget {
  const UploadeImage({super.key});

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
        GestureDetector(
          onTap: () async {
            await _pickImage();
            // Provider.of<BarberShopProvider>(context, listen: false)
            //     .fetchBarberShopPut(
            //   name: '',
            //   isActive: true,
            //   lat: 0,
            //   long: 0,
            //   barberShopId: barberShopId,
            //   imageName: '1',
            //   imageUrl: _image!,
            //   imageId: 1,
            // );
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Container(
              width: width / 2.4,
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
}
