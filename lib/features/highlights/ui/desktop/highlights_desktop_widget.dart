import 'package:akshit_madan/design/constants/app_images.dart';
import 'package:akshit_madan/design/utils/app_colors.dart';
import 'package:akshit_madan/design/widgets/app_image_widget.dart';
import 'package:akshit_madan/design/widgets/buttons/app_outlined_button.dart';
import 'package:flutter/material.dart';

class HighlightsDesktopWidget extends StatelessWidget {
  const HighlightsDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 100),
      // height: MediaQuery.of(context).size.height - 100,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
                BoxShadow(
                  blurRadius: 200,
                  spreadRadius: 200,
                  color: AppColors.purple.withOpacity(0.4),
                )
              ]),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'About Me',
                  style: TextStyle(fontSize: 40),
                ),
                const SizedBox(height: 40),
                Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  direction: Axis.horizontal,
                  children: [
                    highlightContainer(
                        context,
                        false,
                        'Working as a Software Developer at LTIMindtree',
                        AppImages.bookmarkImage,
                        'Delivered products for clients such as Viatris and Procter & Gamble, which gave me the opportunity of working on exciting new technologies. ',
                        'VISIT CHANNEL'),
                    highlightContainer(
                        context,
                        false,
                        'Working as a full stack developer',
                        AppImages.bulbImage,
                        'Front-end expertise in React, Flutter, and Angular, along with back-end skills in Flask and Express. Proven track record delivering efficient full-stack solutions.',
                        'VISIT CHANNEL'),
                    highlightContainer(
                        context,
                        true,
                        'Artificial Intelligence - LLMS - Supervised Learning',
                        AppImages.pickerImage,
                        'I have gotten interested in LLMS, Generative AI, Models for supervised learning etc. I like to build things utilizing these technologies and try to solve a problem with it. I have published my own App on playstore.',
                        'See Projects'),
                    highlightContainer(
                        context,
                        true,
                        'My hobbies are ...',
                        AppImages.cupImage,
                        "I like to sketch, do digital drawing, animate & I also like to read books and write poetry.",
                        'See more'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget highlightContainer(BuildContext context, bool showButton, String topic,
      imagePath, text, buttonText) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w / 2.4,
      height: h / 2.52,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
          color: AppColors.purpleDark.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // AppImageWidget(
          //   imageWidth: 100,
          //   imageHeight: 100,
          //   path: imagePath,
          // ),
          // const SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topic,
                  style: const TextStyle(
                      fontSize: 26, height: 1.4, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Text(
                  text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  // style: TextStyle(fontSize: w / 80),
                ),
                const SizedBox(height: 10),
                if (showButton)
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: AppOutlinedButton(
                      title: buttonText,
                      textStyle: const TextStyle(fontSize: 12),
                      onTap: () {
                        if (buttonText == "See more") {
                        } else if (buttonText == "See Projects") {}
                      },
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
