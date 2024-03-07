import 'package:flutter/material.dart';
import 'package:pets_app/core/utils/app_styles.dart';
import 'curve_and_image.dart';
import 'custom_list_tile.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

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
                  'Mohamed Osman',
                  style: AppStyles.styleMedium20,
                ),
              ),
              const Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(
                      color: Colors.grey,
                    )),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomListTile(
                        icon: Icons.settings_outlined,
                        title: 'Settings',
                      ),
                      CustomListTile(
                        icon: Icons.mode_edit_outline_outlined,
                        title: 'Edit profile information',
                      ),
                      CustomListTile(
                        icon: Icons.logout_outlined,
                        title: 'Logout',
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
