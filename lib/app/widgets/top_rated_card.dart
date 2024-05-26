import 'package:flutter/material.dart';

class TopRatedCard extends StatelessWidget {
  const TopRatedCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return // * Top Rated Card
        Center(
      child: Container(
        height: screenSize.height * 0.32,
        width: screenSize.width * 0.84,
        margin: const EdgeInsets.only(
          top: 8.0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenSize.width * 0.88,
              height: 160,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      'https://picsum.photos/id/234/200/300',
                      width: screenSize.width * 0.88,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      margin: const EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade700.withOpacity(0.9),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.visibility_outlined,
                            size: 14.0,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 2.0),
                          Text(
                            "71K",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            // * Top rated Card Details
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 0.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "The Dark Knight Rises",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 16.0,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 10.0),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 50.0),
                          child: Text(
                            "The young bruce wayne travels to far east. Where hes is trained...",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  height: 1.3,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      Text(
                        "6.7K Votes",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                              fontSize: 18.0,
                            ),
                      ),
                      const SizedBox(
                        height: 20.0,
                        child: VerticalDivider(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "6.7 ⭐️",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                              fontSize: 18.0,
                            ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
