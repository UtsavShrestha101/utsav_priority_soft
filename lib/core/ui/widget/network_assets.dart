import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// used to get network image
class NetworkAssets extends StatelessWidget {
  final String url;
  final double imgHeight;
  final double imgWidth;
  const NetworkAssets(
      {super.key,
      required this.url,
      required this.imgHeight,
      required this.imgWidth});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => SizedBox(
        height: 25.sp,
        width: 25.sp,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        // color: AppColors.primaryError500,
      ),
      fadeOutDuration: const Duration(milliseconds: 500),
      height: imgHeight,
      width: imgWidth,
      fit: BoxFit.contain,
    );
  }
}
