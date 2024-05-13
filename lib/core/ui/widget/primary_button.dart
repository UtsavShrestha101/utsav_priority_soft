import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';


//button for the app
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.text = "",
    this.isLoading = false,
    this.onPressed,
    this.textStyle,
    this.isEnable = true,
    this.color,
    this.textColor,
    this.widget,
  });

  final bool isLoading;
  final bool isEnable;
  final String? text;
  final Widget? widget;

  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(60.sp)),
          border: Border.all(
            color: AppColors.primaryNeutral200,
          )),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: (color != null)
              ? MaterialStateProperty.all<Color>(
                  color!,
                )
              : null,
        ),
        onPressed: !isLoading ? onPressed : null,
        child: widget ??
            (isLoading
                ? const Center(
                    child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                  ))
                : Text(
                    text ?? "",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  )),
      ),
    );
  }
}
