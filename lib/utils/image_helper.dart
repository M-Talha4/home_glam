import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget svgImage(
    {required String assetName, double? width, double? height, Color? color}) {
  return SvgPicture.asset(
    width: width,
    height: height,
    assetName,
    fit: BoxFit.cover,
    color: color,
  );
}
