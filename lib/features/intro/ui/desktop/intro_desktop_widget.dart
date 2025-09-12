import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:anuj_yadav/design/constants/app_animations.dart';
import 'package:anuj_yadav/design/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'dart:html' as html;

class IntroDesktopWidget extends StatelessWidget {
  const IntroDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w / 30),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            left: 800.0,
            top: 350.0,
            child: SizedBox(
              width: 300,
              height: 300,
              child: RiveAnimation.asset(
                AppAnimations.introAnimation,
                stateMachines: ['State Machine 1'],
              ),
            ),
          ),

          // Main content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),

              // Avatar + Intro texts
              Row(
                children: [
                  CircleAvatar(
                    radius: w / 14,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: w / 14 - 4,
                      backgroundImage: const AssetImage(AppImages.selfImage),
                    ),
                  ),
                  const SizedBox(width: 100),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // “I am Anuj Yadav”
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: GoogleFonts.robotoSerif().fontFamily,
                            fontSize: w / 40,
                          ),
                          children: [
                            const TextSpan(text: 'I am '),
                            TextSpan(
                              text: 'Anuj Yadav ',
                              style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'A curious guy,',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      // “Who writes code to bring ideas to life...”
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            height: 1.2,
                            fontFamily: GoogleFonts.robotoSerif().fontFamily,
                            fontSize: w / 20,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const [
                            TextSpan(text: 'Who writes code to bring\n'),
                            TextSpan(text: 'ideas to '),
                            TextSpan(
                              text: 'life',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(text: '...'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 60),

              // Role description + social icons
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I'm a Product Manager",
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.2,
                      fontFamily: GoogleFonts.robotoSerif().fontFamily,
                      fontSize: w / 28,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.2,
                        fontFamily: GoogleFonts.robotoSerif().fontFamily,
                        fontSize: w / 44,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: ' with software development skills, ',
                          style: TextStyle(
                            backgroundColor: Colors.grey[700],
                            color: Colors.grey[100],
                          ),
                        ),
                        const TextSpan(text: ' who loves to create stuff!'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      socialIcon(
                        'https://github.com/anujyadav140',
                        SocialIconsFlutter.github,
                      ),
                      const SizedBox(width: 16),
                      socialIcon(
                        'https://www.linkedin.com/in/anuj-yadav-4493a21b3/',
                        SocialIconsFlutter.linkedin_box,
                      ),
                    ],
                  ),
                ],
              ),
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
        iconColor: Colors.white,
        link: link,
      ),
    );
  }
}
