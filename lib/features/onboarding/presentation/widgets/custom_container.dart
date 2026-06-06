import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;
  final double width;
  final double height;
  final EdgeInsets? margin;
  final BoxShape shape;
  final Color color;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  final bool? isBoxShadowRequired;

  const CustomContainer({
    super.key,
    required this.child,
    required this.width,
    required this.height,
    this.margin,
    required this.shape,
    required this.color,
    required this.borderRadius,
    this.padding,
    this.borderColor,
    this.isBoxShadowRequired,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        shape: shape,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null
            ? BoxBorder.all(color: borderColor!, width: 2.w)
            : null,
        boxShadow: (isBoxShadowRequired == null || isBoxShadowRequired == true)
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  offset: Offset(0, 2),
                  blurRadius: 5.r,
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}
