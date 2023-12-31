import 'package:anuj_yadav/design/constants/app_constants.dart';
import 'package:anuj_yadav/design/utils/app_colors.dart';
import 'package:anuj_yadav/design/widgets/app_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: GoogleFonts.robotoSerif().fontFamily,
                  fontSize: 24,
                ),
                children: [
                  const TextSpan(
                    text: 'I have gained experience in a wide-variety of ',
                  ),
                  TextSpan(
                    text: 'tech stacks \n',
                    style: TextStyle(color: AppColors.purple),
                  ),
                  const TextSpan(
                    text:
                        'which grant me the means to create, develop exciting new solutions ',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "I have served as software engineer at LTIMindtree; working on viaflow 2.0- a production tracking software & various Procter & Gamble projects- nextjs upgradation of various sites, solving and debugging various P&G projects in a vast codebase.\nIn my free time, I create many solo projects, and have also published an App.",
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
