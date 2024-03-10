import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/login_view/login_view.dart';
import 'package:pets_app/core/utils/app_styles.dart';
import 'curve_and_image.dart';
import 'custom_list_tile.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

User? _user;
String? userName;

@override
class _ProfileViewBodyState extends State<ProfileViewBody> {
  void _getCurrentUser() {
    User? currentUser = _auth.currentUser;
    setState(() {
      _user = currentUser;
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

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
                      const CustomListTile(
                        icon: Icons.mode_edit_outline_outlined,
                        title: 'Edit profile information',
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
                          icon: Icons.logout_outlined,
                          title: 'Logout',
                        ),
                      ),
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
}
