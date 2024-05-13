import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';


//appbar for the app
class PrioritySoftAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PrioritySoftAppBar({
    super.key,
    this.text,
    this.title,
    this.actions,
    this.leading,
    this.textColor = AppColors.primaryNeutral500,
    this.useDarkIcon = true,
    this.automaticallyImplyLeading = true,
    this.centerTitle,
    this.onBackButtonPress,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String? text;

  final Color textColor;

  final Widget? title;

  final List<Widget>? actions;

  final VoidCallback? onBackButtonPress;

  final Widget? leading;

  final bool useDarkIcon;

  final bool automaticallyImplyLeading;

  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: true,
      leading: leading ??
          (automaticallyImplyLeading
              ? IconButton(
                  onPressed: onBackButtonPress ?? context.pop,
                  icon: Icon(
                    Platform.isAndroid
                        ? Icons.arrow_back
                        : Icons.arrow_back_ios,
                    size: 24.sp,
                    color: AppColors.primaryNeutral500,
                  ),
                )
              : null),
      titleSpacing: 0.0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title ??
          Text(
            text ?? "",
            style: context.headline400,
          ),
      actions: actions,
      centerTitle: centerTitle ?? false,
    );
  }
}
