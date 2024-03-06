import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  final double curveHeight;

  CurveClipper(this.curveHeight);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - curveHeight);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - curveHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RoundedCurveContainer extends StatelessWidget {
  final double width;
  final double height;
  final double curveHeight;
  final Color color;
  final Widget child;

  const RoundedCurveContainer({
    super.key,
    required this.width,
    required this.height,
    required this.curveHeight,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurveClipper(curveHeight),
      child: Container(
        width: width,
        height: height,
        color: color,
        child: child,
      ),
    );
  }
}
