import 'package:anuj_yadav/design/constants/app_images.dart';
import 'package:anuj_yadav/design/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'dart:html' as html;

class IntroMobileWidget extends StatelessWidget {
  const IntroMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          // const Align(
          //   alignment: Alignment.topCenter,
          //   child: RiveAnimation.asset(AppAnimations.introAnimation),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 64,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(AppImages.selfImage),
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.robotoSerif().fontFamily,
                        fontSize: 24,
                        height: 1),
                    children: [
                      TextSpan(
                          text: 'Anuj Yadav ',
                          style: TextStyle(color: AppColors.purple))
                    ]),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // socialIcon('',
                    //     SocialIconsFlutter.instagram),
                    socialIcon('https://github.com/anujyadav140',
                        SocialIconsFlutter.github),
                    socialIcon(
                        'https://www.linkedin.com/in/anuj-yadav-4493a21b3/',
                        SocialIconsFlutter.linkedin_box),
                    // socialIcon(
                    //     '',
                    //     SocialIconsFlutter.youtube)
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'A curious guy,',
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.underline, fontSize: 14),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.white,
                        height: 1.4,
                        fontFamily: GoogleFonts.robotoSerif().fontFamily,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                    children: [
                      const TextSpan(text: 'Who writes code to bring '),
                      const TextSpan(text: 'ideas to '),
                      TextSpan(
                          text: 'life',
                          style: TextStyle(color: AppColors.purple)),
                      const TextSpan(text: '...')
                    ]),
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "I'm a Software Engineer & ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.robotoSerif().fontFamily,
                        fontSize: 16),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: GoogleFonts.robotoSerif().fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              text: ' a full stack dev ',
                              style: TextStyle(
                                  backgroundColor: Colors.grey[700],
                                  color: Colors.grey[100])),
                          const TextSpan(text: ' who loves to create stuff!')
                        ]),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget socialIcon(String link, IconData iconPath) {
    return InkWell(
      onTap: () => html.window.open(link, '_blank'),
      child: SocialWidget(
        placeholderText: '',
        iconData: iconPath,
        iconSize: 20,
        iconColor: Colors.white,
        link: link,
      ),
    );
  }
}
