import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaveWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;
  final EdgeInsets? margin;

  const WaveWidget({
    super.key,
    required this.width,
    required this.height,
    this.color,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color:
            color ?? Theme.of(context).colorScheme.primary, //Color(0xFFFF5CAE),
        border: BoxBorder.all(color: color ?? Color(0xFFFF5CAE), width: 0),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }
}
