import 'package:anuj_yadav/design/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:social_media_flutter/widgets/icons.dart';
import 'package:social_media_flutter/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class ContactUsMobileWidget extends StatelessWidget {
  const ContactUsMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Contact Me',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 8),
        const Text(
            "If you want to get in touch with me drop me a quick email at 👇"),
        const SizedBox(height: 8),
        Text(
          'anujyadav160@gmail.com',
          style: TextStyle(color: AppColors.purple),
        ),
        const SizedBox(height: 20),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // socialIcon('',
              //     SocialIconsFlutter.instagram),
              socialIcon(
                  'https://github.com/anujyadav140', SocialIconsFlutter.github),
              socialIcon('https://www.linkedin.com/in/anuj-yadav-4493a21b3/',
                  SocialIconsFlutter.linkedin_box),
              // socialIcon(
              //     '',
              //     SocialIconsFlutter.youtube)
            ],
          ),
        ),
        const Divider(),
        const SizedBox(height: 20),
        const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Made By Anuj with 💚 in India'),
            ],
          ),
        )
      ]),
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
