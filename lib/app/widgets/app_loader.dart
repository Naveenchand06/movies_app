import 'package:flutter/material.dart';
import 'package:wework_movies/utils/themes/app_colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({this.color, super.key, this.height = 24, this.width = 24});

  final Color? color;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: CircularProgressIndicator(
          color: appGradientBg.first,
        ),
      ),
    );
  }
}
