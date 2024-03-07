import 'package:flutter/material.dart';
import 'package:pets_app/core/utils/app_styles.dart';

class BottomSheetListTile extends StatelessWidget {
  const BottomSheetListTile({
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
        color: Colors.white,
        size: 30,
      ),
      title: Text(
        title,
        style: AppStyles.styleRegular18.copyWith(color: Colors.white),
      ),
    );
  }
}
