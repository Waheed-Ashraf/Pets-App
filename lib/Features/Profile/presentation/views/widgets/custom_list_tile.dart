import 'package:flutter/material.dart';
import 'package:pets_app/core/utils/app_styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
        size: 30,
      ),
      title: Text(
        title,
        style: AppStyles.styleRegular18,
      ),
    );
  }
}
