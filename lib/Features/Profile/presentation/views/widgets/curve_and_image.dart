import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pets_app/Features/Profile/presentation/views/widgets/picking_image_list_tile.dart';
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

String? cameraImageUrl;
String? galleryImageUrl;

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
      _uploadImageToFirebaseStorage(_galleryImageFile!);
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
      _uploadImageToFirebaseStorage(_cameraImageFile!);
    }
  }

  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> _uploadImageToFirebaseStorage(File imageFile) async {
    try {
      // Create a unique filename for the image
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      // Reference to the image file in Firebase Storage
      Reference reference = _storage.ref().child('images/$fileName.jpg');

      // Upload the image to Firebase Storage
      await reference.putFile(imageFile);

      // Get the download URL of the uploaded image
      String imageUrl = await reference.getDownloadURL();
      if (cameraImage == true) {
        cameraImageUrl = imageUrl;
        setState(() {});
      } else {
        galleryImageUrl = imageUrl;
        setState(() {});
      }

      // Print the download URL (you can use it to display or store the image)
      print('Image uploaded to Firebase Storage: $imageUrl');

      // Show a message indicating successful upload
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Image uploaded to Firebase Storage'),
        ),
      );
    } catch (error) {
      // Handle any errors that occur during image upload
      print('Error uploading image: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to upload image to Firebase Storage'),
        ),
      );
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
                  onTap: () async {
                    cameraImage = true;
                    await _pickImageFromCamera();
                  },
                  child: const BottomSheetListTile(
                    icon: Icons.camera_alt_rounded,
                    title: 'Take a photo',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    cameraImage = false;
                    _pickImageFromGallery();
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
  // ignore: unused_field
  final File? _cameraImageFile;
  // ignore: unused_field
  final File? _galleryImageFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.sizeOf(context).width * 0.4,
      child: cameraImage == true
          ? cameraImageUrl == null
              ? const CircleAvatar(
                  radius: 75,
                  backgroundColor: secondaryColor,
                  backgroundImage: AssetImage('assets/images/default.png'),
                )
              : CircleAvatar(
                  radius: 75,
                  backgroundColor: secondaryColor,
                  backgroundImage: NetworkImage(cameraImageUrl!),
                )
          : galleryImageUrl != null
              ? CircleAvatar(
                  radius: 75,
                  backgroundColor: secondaryColor,
                  backgroundImage: NetworkImage(galleryImageUrl!),
                )
              : const CircleAvatar(
                  radius: 75,
                  backgroundColor: secondaryColor,
                  backgroundImage: AssetImage('assets/images/default.png'),
                ),
    );
  }
}
