import 'package:flutter/material.dart';
import 'package:wework_movies/utils/themes/app_colors.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    super.key,
    this.onPress,
    this.title,
  });

  final VoidCallback? onPress;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Something went wrong!'),
          const SizedBox(height: 6.0),
          TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            onPressed: onPress,
            child: Text(
              title ?? 'Try Again!',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: appGradientBg.first,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
