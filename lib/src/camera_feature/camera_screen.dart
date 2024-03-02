// ignore_for_file: use_build_context_synchronously

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/core/reusables/my_icon_button.dart';
import 'package:whats_app_clone/src/camera_feature/image_preview.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({super.key});
  @override
  State<TakePictureScreen> createState() => _TakePictureScreenState();
}

//firebase

late List<CameraDescription> cameraDescription;

class _TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController cameraController;
  @override
  void initState() {
    super.initState();
    cameraController =
        CameraController(cameraDescription[0], ResolutionPreset.max);
    cameraController.initialize().then(
      (_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      },
    ).catchError(
      (Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              if (kDebugMode) {
                print('Access Denied');
              }
            default:
              if (kDebugMode) {
                print(e.description);
              }
              break;
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              child: CameraPreview(cameraController),
            ),
            Positioned(
              top: 20.sp,
              child: MyIconButtons(
                icon: Icon(
                  Ionicons.arrow_back,
                  color: Colors.black,
                  size: 21.sp,
                ),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/main'),
              ),
            ),
            Positioned(
              bottom: 25.sp,
              left: Adaptive.w(38),
              child: RawMaterialButton(
                onPressed: () async {
                  if (!cameraController.value.isInitialized) {
                    return;
                  }
                  if (cameraController.value.isTakingPicture) {
                    return;
                  }

                  try {
                    await cameraController.setFlashMode(FlashMode.auto);
                    final picture = await cameraController.takePicture();

                    await Navigator.push(
                      context,
                      // ignore: inference_failure_on_instance_creation
                      MaterialPageRoute(
                        builder: (context) => ImagePreviewScreen(file: picture),
                      ),
                    );
                  } on CameraException catch (e) {
                    debugPrint('Error Occured while taking picture: $e');
                    return;
                  }
                },
                child: const Icon(
                  Ionicons.camera,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
