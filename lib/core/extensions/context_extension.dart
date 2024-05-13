import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/router/app_router.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/core/ui/widget/primary_button.dart';
import 'package:myapp/resources/assets.gen.dart';

extension BuildContextX on BuildContext {
  void pop() {
    Navigator.of(this).pop();
  }


//error snackbar

  void showErrorSnackBar(String text) {
    showBottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.icons.failed.svg(
            height: 100.sp,
            width: 100.sp,
            fit: BoxFit.contain,
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              letterSpacing: 0.3,
            ),
            textAlign: TextAlign.center,
          ),
          20.verticalSpace,
          SizedBox(
            height: 50.sp,
            width: double.infinity,
            child: PrimaryButton(
              onPressed: () {
                pop();
              },
              text: "BACK",
              textColor: Colors.white,
              color: AppColors.primaryNeutral500,
            ),
          ),
          10.verticalSpace,
        ],
      ),
      true,
    );
  }


//success snackbar
  void showSuccessBar(String text) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(text)));
  }

//bottom sheet
  Future<void> showBottomSheet(Widget body, [bool? isScrollControlled]) async =>
      await showModalBottomSheet(
        isScrollControlled: isScrollControlled ?? false,
        useRootNavigator: true,
        context: this,
        showDragHandle: true,
        builder: (buildContext) {
          return Padding(
            padding: EdgeInsets.only(
              right: 15,
              left: 15,
              top: 5,
              bottom: MediaQuery.of(buildContext).viewInsets.bottom,
            ),
            child: SafeArea(child: body),
          );
        },
      );


//add to cart success tile

  Future<void> addToCartSuccessTile(int items) async {
    showBottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.icons.success.svg(
            height: 100.sp,
            width: 100.sp,
            fit: BoxFit.contain,
          ),
          Text("Added to cart",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
                letterSpacing: 0.3,
              )),
          5.verticalSpace,
          Text(
            "$items Item Total",
            style: bodyText200.copyWith(
              color: AppColors.primaryNeutral400,
            ),
          ),
          20.verticalSpace,
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50.sp,
                  width: double.infinity,
                  child: PrimaryButton(
                    onPressed: () {
                      pop();
                    },
                    text: "BACK EXPLORE",
                    textColor: AppColors.primaryNeutral500,
                  ),
                ),
              ),
              15.horizontalSpace,
              Expanded(
                child: SizedBox(
                  height: 50.sp,
                  width: double.infinity,
                  child: PrimaryButton(
                    onPressed: () {
                      pop();
                      pop();
                      router.push(const CartRoute());
                    },
                    text: "TO CART",
                    textColor: Colors.white,
                    color: AppColors.primaryNeutral500,
                  ),
                ),
              ),
            ],
          ),
          10.verticalSpace,
        ],
      ),
      true,
    );
  }


//text styling

  TextStyle get headline700 => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 30.sp,
        letterSpacing: 0.3,
        height: (24 / 20).sp,
      );

  TextStyle get headline600 => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        height: (20 / 24).sp,
      );

  TextStyle get headline500 => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18.sp,
        height: (20 / 24).sp,
      );

  TextStyle get headline400 => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        height: (14 / 16).sp,
      );

  TextStyle get headline300 => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14.sp,
        height: (12 / 16).sp,
      );

  TextStyle get bodyText100 => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
      );

  TextStyle get bodyText200 => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      );

  TextStyle get bodyText10 => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 11.sp,
      );

  TextStyle get bodyTextBold10 => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 13.sp,
      );
}
