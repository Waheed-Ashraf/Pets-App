import 'package:flutter/material.dart';
import 'package:pets_app/core/widgets/snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl({context, String? url}) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (!await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      showSnackBar(context, message: 'Cannot launch $url', color: Colors.red);
    }
  }
}
