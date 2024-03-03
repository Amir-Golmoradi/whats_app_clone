import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:whats_app_clone/core/I18n/messages.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/theme/typo.dart';

class ImagePreviewScreen extends StatefulWidget {
  const ImagePreviewScreen({required this.file, super.key});
  final XFile file;
  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  @override
  Widget build(BuildContext context) {
    final pictureFile = File(widget.file.path);
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: AppMessage.images.tr,
          style: typoGraphy.textTheme.headlineMedium!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: Center(
        child: Image.file(pictureFile),
      ),
    );
  }
}
