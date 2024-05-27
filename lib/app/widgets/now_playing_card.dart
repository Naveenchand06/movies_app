import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:wework_movies/app/widgets/row_icon_widget.dart';

class NowPlayingCard extends StatelessWidget {
  const NowPlayingCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.70,
      height: screenSize.height * 0.4,
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          children: [
            Image.network(
              'https://picsum.photos/id/268/200/300',
              width: screenSize.width * 0.70,
              height: screenSize.height * 0.4,
              fit: BoxFit.cover,
            ),
            // * Top rating
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                color: Colors.white.withOpacity(0.5),
              ),
              child: Text(
                "6.67 ⭐️",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                      // color: Colors.white,
                    ),
              ),
            ),
            // * Top Indicators
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.visibility_outlined,
                            size: 16.0,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            "716",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0,
                                      color: Colors.white,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    // * Like
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: const Icon(
                        Icons.favorite_outline_outlined,
                        size: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // * Black Bootom Card
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  GlassmorphicContainer(
                    width: screenSize.width * 0.70,
                    height: 140.0,
                    alignment: Alignment.bottomLeft,
                    borderRadius: 20.0,
                    border: 1,
                    blur: 15,
                    linearGradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.black54.withOpacity(0.6)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderGradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.3),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Godzilla X Kong: The New Empire",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                      color: Colors.white,
                                    ),
                          ),
                          const SizedBox(height: 10.0),
                          const RowIconWidget(
                            text:
                                "Following their explosive showdown, Godzill and kong must reunite.",
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            "716 Votes",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
