import 'package:akshit_madan/design/constants/app_constants.dart';
import 'package:akshit_madan/design/utils/app_colors.dart';
import 'package:akshit_madan/design/widgets/app_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TechstackMobileWidget extends StatelessWidget {
  const TechstackMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Preah',
                  fontSize: 24,
                ),
                children: [
                  const TextSpan(
                    text:
                        'I have attained expertise in an array of cutting-edge ',
                  ),
                  TextSpan(
                    text: 'tech stacks ',
                    style: TextStyle(color: AppColors.purple),
                  ),
                  const TextSpan(
                    text:
                        'empowering me to craft seamless and innovative solutions.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "I have served as the Founder of growmonks, overseeing the entire project lifecycle from ideation to successful client project delivery. As a Flutter Engineer at Tickertape(10M+), where I had the privilege of developing for a huge user base. I gained invaluable experience and deepened my understanding of mobile development concepts.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Wrap(
                  children: techStack.keys.map((techName) {
                    return techStackCircle(
                      techStack[techName]!['image']!,
                      techStack[techName]!['link']!,
                    );
                  }).toList(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget techStackCircle(String imagePath, String link) {
    return GestureDetector(
      onTap: () {
        final Uri url = Uri.parse(link);
        launchUrl(url);
      },
      child: Container(
        margin: const EdgeInsets.all(6),
        height: 54,
        width: 54,
        padding: const EdgeInsets.all(8),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: AppColors.violet),
        child: AppImageWidget(
          path: imagePath,
        ),
      ),
    );
  }
}
