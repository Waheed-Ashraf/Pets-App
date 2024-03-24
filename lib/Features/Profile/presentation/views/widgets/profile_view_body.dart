import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/login_view/login_view.dart';
import 'package:pets_app/core/widgets/custom_button.dart';
import 'package:pets_app/core/widgets/custom_text_field.dart';
import 'curve_and_image.dart';
import 'custom_list_tile.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

User? _user;
String? userName;
String? _latestItemUrl;

@override
class _ProfileViewBodyState extends State<ProfileViewBody> {
  void _getCurrentUser() {
    User? currentUser = _auth.currentUser;
    setState(() {
      _user = currentUser;
    });
  }

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Reference getUserStorageRef() {
    User? user = _auth.currentUser;
    return _storage.ref().child('users/${user!.uid}');
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

  void _setParameters() async {
    _getCurrentUser();
    // Reference to a document in a "users" collection using the user's ID
    DocumentReference userDocRef =
        _firestore.collection('users').doc(_user!.uid);

    // Set parameters to the document
    await userDocRef.set({
      'email': _user!.email,
      'userimage': await _getLatestItem(),
      'username': userName
    }).then((_) {
      setState(() {});
      print('Parameters set successfully!');
    }).catchError((error) {
      print('Failed to set parameters: $error');
    });
  }

  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      // Navigate to login or any other screen after sign-out
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  void _getUserData() async {
    print('${_user!.email}');
    QuerySnapshot querySnapshot = await _firestore
        .collection('users')
        .where('email', isEqualTo: _user!.email)
        .get();

    // Retrieve the username from the document
    if (querySnapshot.docs.isNotEmpty) {
      setState(() {
        userName = (querySnapshot.docs[0].data()
                as Map<String, dynamic>)['username'] ??
            '...';

        profileImage =
            (querySnapshot.docs[0].data() as Map<String, dynamic>)['userimage'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
    _getUserData();
  }

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CurveAndImage(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Text(
                  '$userName',
                  style: AppStyles.styleMedium20,
                ),
              ),
              Card(
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(
                      color: Colors.grey,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const CustomListTile(
                        icon: Icons.settings_outlined,
                        title: 'Settings',
                      ),
                      GestureDetector(
                        onTap: () {
                          editNameBottomSheet(context);
                        },
                        child: const CustomListTile(
                          icon: Icons.mode_edit_outline_outlined,
                          title: 'Edit profile information',
                        ),
                      ),
                      GestureDetector(
                          onTap: () async {
                            await _signOut();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginView(),
                              ),
                            );
                          },
                          child: const CustomListTile(
                              icon: Icons.logout, title: 'Logout'))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> editNameBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        constraints: const BoxConstraints.expand(),
        backgroundColor: Colors.white,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Edit Name:',
                    style: AppStyles.styleMedium20,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    text: userName,
                    controller: _controller,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                      text: 'Save',
                      onPressed: () {
                        userName = _controller.text;
                        _setParameters();
                        Navigator.pop(context);
                      })
                ],
              ),
            ),
          );
        });
  }
}
