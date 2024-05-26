import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_pin,
                    size: 24.0,
                  ),
                  Text(
                    " Redstone Oaks",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              Text(
                "Vishnu Dev nagar, Wakad, pimpri-chinchwa...",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const CircleAvatar(
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
