import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pets_app/Features/Profile/presentation/views/widgets/picking_image_list_tile.dart';
import 'package:pets_app/Features/Profile/presentation/views/widgets/profile_image_full.dart';
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
String? username;
String? profileImage;
String? _latestItemUrl;
User? _user;

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
      await _uploadImageToFirebaseStorage(_galleryImageFile!);
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
      await _uploadImageToFirebaseStorage(_cameraImageFile!);
    }
  }

  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Method to get the storage reference for the current user
  Reference getUserStorageRef() {
    User? user = _auth.currentUser;
    return _storage.ref().child('users/${user!.uid}');
  }

  Future<void> _uploadImageToFirebaseStorage(File imageFile) async {
    try {
      // Create a unique filename for the image
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      // Reference to the image file in Firebase Storage
      Reference reference = getUserStorageRef().child('$fileName.jpg');

      // Upload the image to Firebase Storage
      await reference.putFile(imageFile);

      // Get the download URL of the uploaded image
      String imageUrl = await reference.getDownloadURL();

      setState(() {});
      if (cameraImage == true) {
        cameraImageUrl = imageUrl;
        print('vvvvvvvvvvvvvvvvv$cameraImageUrl');
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

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
    _getUserData();
    _getLatestItem();
    cameraImage = true;
  }

  // Method to get the current user
  void _getCurrentUser() {
    User? currentUser = _auth.currentUser;
    setState(() {
      _user = currentUser;
    });
    print('Cccccccccccccurent user done');
  }

  void _setParameters() async {
    _getCurrentUser();
    // Reference to a document in a "users" collection using the user's ID
    DocumentReference userDocRef =
        _firestore.collection('users').doc(_user!.uid);

    // Set parameters to the document
    await userDocRef.set({
      'email': _user!.email,
      'userimage': await _getLatestItem(),
      'username': username
    }).then((_) {
      setState(() {});
      print('Parameters set successfully!');
    }).catchError((error) {
      print('Failed to set parameters: $error');
    });
  }

  void _getUserData() async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('users')
        .where('email', isEqualTo: _user!.email)
        .get();

    // Retrieve the username from the document
    if (querySnapshot.docs.isNotEmpty) {
      setState(() {
        username =
            (querySnapshot.docs[0].data() as Map<String, dynamic>)['username'];
        profileImage =
            (querySnapshot.docs[0].data() as Map<String, dynamic>)['userimage'];
        print('wwwwwwwwwwwwwwwwwww$profileImage');
      });
      print('uuuuuuuuuuuuuuuuuuser:$username');
    }
  }

  Future<String?> _getLatestItem() async {
    try {
      // List all items in the storage bucket
      ListResult result = await getUserStorageRef().listAll();

      // Sort the items by name (assuming names represent the order)
      result.items.sort((a, b) => b.name.compareTo(a.name));

      // Get the URL of the last item (latest item)
      if (result.items.isNotEmpty) {
        _latestItemUrl = await result.items.last.getDownloadURL();
        // print('dddddddddddddd$_latestItemUrl');
        setState(() {});
        // print('dddddddddddddd$_latestItemUrl');
        // print('wweeeeeeeeeeeeeeeeeeeeeeeeeee$_latestItemUrl');
        return _latestItemUrl!;
      } else {
        return _latestItemUrl = 'Sorry!!!!';
      }
    } catch (error) {
      print('Error getting latest item: $error');
    }

    return null;
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
          child: Image.asset(
            'assets/images/appbar.PNG',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
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
                    _setParameters();
                    setState(() {});
                  },
                  child: const BottomSheetListTile(
                    icon: Icons.camera_alt_rounded,
                    title: 'Take a photo',
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    cameraImage = false;
                    await _pickImageFromGallery();
                    _setParameters();
                    setState(() {});
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

class ProfileImage extends StatefulWidget {
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
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(_user!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Lottie.asset('assets/images/loading.json');
          }
          Map photoData = snapshot.data!.data() as Map;
          print(photoData);
          String? photoUrl = photoData['userimage'];
          print('pppppppppppppppppp:$photoUrl');
          return photoUrl != null
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileImageFull(
                                imageUrl: photoUrl,
                              )),
                    );
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: secondaryColor,
                        backgroundImage: NetworkImage(photoUrl),
                      )),
                )
              : const CircleAvatar(
                  radius: 75,
                  backgroundColor: secondaryColor,
                  backgroundImage: AssetImage('assets/images/default.png'),
                );
        });
  }
}
