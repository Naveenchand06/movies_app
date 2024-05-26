import 'package:flutter/material.dart';

class RowIconWidget extends StatelessWidget {
  const RowIconWidget({
    super.key,
    required this.text,
    this.iconData,
    this.textColor,
  });

  final String text;
  final IconData? iconData;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData ?? Icons.calendar_month,
          size: 16.0,
          color: textColor ?? Colors.white,
        ),
        const SizedBox(width: 10.0),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                    color: textColor ?? Colors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
