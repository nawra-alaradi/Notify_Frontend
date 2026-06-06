import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  final double? width, height;
  final double marginValue;
  final BoxShape shape;
  final Color? baseColor;
  final Color highlightColor;
  const Skeleton({
    super.key,
    required this.marginValue,
    this.width,
    this.height,
    required this.shape,
    required this.highlightColor,
    this.baseColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? const Color(0xFFeef0fd),
      highlightColor: highlightColor,
      child: Container(
        margin: EdgeInsets.fromLTRB(1.w, marginValue, 0, marginValue),
        // padding: const EdgeInsets.all(9),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: (shape == BoxShape.rectangle)
              ? const BorderRadius.all(Radius.zero)
              : null,
          shape: shape,
        ),
      ),
    );
  }
}
