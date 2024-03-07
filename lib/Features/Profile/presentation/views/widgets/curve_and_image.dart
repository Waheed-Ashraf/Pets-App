import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pets_app/Features/Profile/presentation/views/widgets/picking_image.dart';
import 'package:pets_app/core/utils/colors.dart';
import 'rounded_curve.dart';
import 'package:image_picker/image_picker.dart';

class CurveAndImage extends StatefulWidget {
  const CurveAndImage({
    super.key,
  });

  @override
  State<CurveAndImage> createState() => _CurveAndImageState();
}

class _CurveAndImageState extends State<CurveAndImage> {
  File? _galleryImageFile;
  bool? cameraImage;

  final _picker = ImagePicker();

  Future _pickImageFromGallery() async {
    // ignore: unused_local_variable

    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _galleryImageFile = File(pickedImage.path);
      });
    }
  }

  File? _cameraImageFile;

  final ImagePicker _cameraPicker = ImagePicker();

  Future<void> _pickImageFromCamera() async {
    final XFile? pickedFile =
        await _cameraPicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _cameraImageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        RoundedCurveContainer(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.35,
          curveHeight: 50,
          color: primaryColor,
          child: const Center(),
        ),
        Positioned(
          bottom: -30,
          left: MediaQuery.sizeOf(context).width * 0.3,
          right: MediaQuery.sizeOf(context).width * 0.3,
          child: Stack(
            children: [
              ProfileImage(
                cameraImage: cameraImage,
                cameraImageFile: _cameraImageFile,
                galleryImageFile: _galleryImageFile,
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    showBottomSheet(context);
                  },
                  child: const CircleAvatar(
                    backgroundColor: primaryColor,
                    child: Icon(Icons.edit),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<dynamic> showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _pickImageFromCamera();
                    cameraImage = true;
                  },
                  child: const BottomSheetListTile(
                    icon: Icons.camera_alt_rounded,
                    title: 'Take a photo',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _pickImageFromGallery();
                    cameraImage = false;
                  },
                  child: const BottomSheetListTile(
                    icon: Icons.image,
                    title: 'Pick from gallery',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.cameraImage,
    required File? cameraImageFile,
    required File? galleryImageFile,
  })  : _cameraImageFile = cameraImageFile,
        _galleryImageFile = galleryImageFile;

  final bool? cameraImage;
  final File? _cameraImageFile;
  final File? _galleryImageFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.sizeOf(context).width * 0.4,
      child: cameraImage == true
          ? _cameraImageFile == null
              ? const CircleAvatar(
                  radius: 75,
                  backgroundColor: secondaryColor,
                  backgroundImage: AssetImage('assets/images/default.png'),
                )
              : CircleAvatar(
                  radius: 75,
                  backgroundColor: secondaryColor,
                  backgroundImage: Image.file(_cameraImageFile!).image,
                )
          : _galleryImageFile != null
              ? CircleAvatar(
                  radius: 75,
                  backgroundColor: secondaryColor,
                  backgroundImage: Image.file(_galleryImageFile!).image,
                )
              : const CircleAvatar(
                  radius: 75,
                  backgroundColor: secondaryColor,
                  backgroundImage: AssetImage('assets/images/default.png'),
                ),
    );
  }
}
