import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notify/features/Onboarding/presentation/widgets/custom_container.dart';

class DocumentOnboardingWidget extends StatelessWidget {
  const DocumentOnboardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300.h,
      child: Stack(
        alignment: .center,
        children: [
          CustomContainer(
            width: 200.w,
            height: 224.h,
            margin: EdgeInsets.all(0),
            shape: BoxShape.rectangle,
            color: Color(0xFF191919),
            borderRadius: 14.r,
            padding: EdgeInsets.fromLTRB(15.w, 12.h, 15.w, 12.h),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  crossAxisAlignment: .center,
                  children: [
                    Icon(
                      Icons.edit_note_rounded,
                      color: Color(0xFF868686),
                      size: 30.w,
                    ),
                    CustomContainer(
                      child: null,
                      width: 82.w,
                      height: 8.h,
                      margin: EdgeInsets.all(0),
                      shape: BoxShape.rectangle,
                      color: Color(0xFF2C2C2C),
                      borderRadius: 14.r,
                    ),
                  ],
                ),
                CustomContainer(
                  child: null,
                  width: 166.w,
                  height: 8.h,
                  margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                  shape: BoxShape.rectangle,
                  color: Color(0xFF2C2C2C),
                  borderRadius: 14.r,
                ),
                CustomContainer(
                  child: null,
                  width: 150.w,
                  height: 8.h,
                  margin: EdgeInsets.only(bottom: 10.h),
                  shape: BoxShape.rectangle,
                  color: Color(0xFF2C2C2C),
                  borderRadius: 14.r,
                ),
                CustomContainer(
                  child: null,
                  width: 166.w,
                  height: 8.h,
                  margin: EdgeInsets.only(bottom: 10.h),
                  shape: BoxShape.rectangle,
                  color: Color(0xFF2C2C2C),
                  borderRadius: 14.r,
                ),
                CustomContainer(
                  child: null,
                  width: 150.w,
                  height: 8.h,
                  margin: EdgeInsets.only(bottom: 10.h),
                  shape: BoxShape.rectangle,
                  color: Color(0xFF2C2C2C),
                  borderRadius: 14.r,
                ),
                CustomContainer(
                  child: null,
                  width: 166.w,
                  height: 8.h,
                  margin: EdgeInsets.only(bottom: 10.h),
                  shape: BoxShape.rectangle,
                  color: Color(0xFF2C2C2C),
                  borderRadius: 14.r,
                ),
                CustomContainer(
                  child: null,
                  width: 82.w,
                  height: 8.h,
                  margin: EdgeInsets.only(bottom: 10.h),
                  shape: BoxShape.rectangle,
                  color: Color(0xFF2C2C2C),
                  borderRadius: 14.r,
                ),
                CustomContainer(
                  child: null,
                  width: 166.w,
                  height: 8.h,
                  margin: EdgeInsets.only(bottom: 10.h),
                  shape: BoxShape.rectangle,
                  color: Color(0xFF2C2C2C),
                  borderRadius: 14.r,
                ),
                CustomContainer(
                  child: null,
                  width: 166.w,
                  height: 8.h,
                  margin: EdgeInsets.only(bottom: 10.h),
                  shape: BoxShape.rectangle,
                  color: Color(0xFF2C2C2C),
                  borderRadius: 14.r,
                ),
              ],
            ),
          ),
          Positioned(
            right: 20.w,
            bottom: 5.h,
            child: CustomContainer(
              borderColor: Color(0xFF9B79BE),
              isBoxShadowRequired: false,
              width: 176.w,
              height: 128.h,
              margin: EdgeInsets.all(0),
              shape: BoxShape.rectangle,
              color: Color(0xFF4A1281),
              borderRadius: 14.r,
              padding: EdgeInsets.fromLTRB(15.w, 12.h, 15.w, 12.h),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    crossAxisAlignment: .center,
                    children: [
                      Icon(
                        Icons.diamond_rounded,
                        color: Color(0xFF9B79BE),
                        size: 30.w,
                      ),
                      CustomContainer(
                        child: null,
                        width: 70.w,
                        height: 8.h,
                        margin: EdgeInsets.all(0),
                        shape: BoxShape.rectangle,
                        color: Color(0xFF40116F),
                        borderRadius: 14.r,
                      ),
                    ],
                  ),

                  CustomContainer(
                    child: null,
                    width: 138.w,
                    height: 8.h,
                    margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                    shape: BoxShape.rectangle,
                    color: Color(0xFF40116F),
                    borderRadius: 14.r,
                  ),
                  CustomContainer(
                    child: null,
                    width: 128.w,
                    height: 8.h,
                    margin: EdgeInsets.only(bottom: 10.h),
                    shape: BoxShape.rectangle,
                    color: Color(0xFF40116F),
                    borderRadius: 14.r,
                  ),
                  CustomContainer(
                    child: null,
                    width: 100.w,
                    height: 8.h,
                    margin: EdgeInsets.only(bottom: 0.h),
                    shape: BoxShape.rectangle,
                    color: Color(0xFF40116F),
                    borderRadius: 14.r,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
