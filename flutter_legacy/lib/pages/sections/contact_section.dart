import 'package:flutter/material.dart';
import 'package:anuj_yadav/design/theme/minimalist_theme.dart';
import 'package:anuj_yadav/widgets/section_header.dart';
import 'package:anuj_yadav/widgets/social_links.dart';
import 'package:anuj_yadav/widgets/fade_in_up.dart';
import 'package:flutter/services.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  bool _isEmailHovered = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 1200;
    final isMediumScreen = size.width > 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isLargeScreen ? 120 : (isMediumScreen ? 60 : 24),
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          const SectionHeader(
            number: "03",
            title: "Contact",
            subtitle: "Get in touch",
          ),
          
          const SizedBox(height: 16),
          
          // Main content - Left aligned
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                child: Text(
                  "Let's work together",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: isLargeScreen ? 32 : (isMediumScreen ? 24 : 20),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              FadeInUp(
                delay: const Duration(milliseconds: 400),
                child: Text(
                  "I'm always interested in hearing about new opportunities, "
                  "projects, and collaborations. Whether you have a question "
                  "or just want to say hi, feel free to reach out.",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: isLargeScreen ? 18 : 16,
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Email
              FadeInUp(
                delay: const Duration(milliseconds: 600),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Label outside the button
                    Text(
                      "EMAIL",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 10,
                        color: MinimalistTheme.lightGray,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Clickable email only copies to clipboard
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => setState(() => _isEmailHovered = true),
                      onExit: (_) => setState(() => _isEmailHovered = false),
                      child: GestureDetector(
                        onTap: _copyEmailToClipboard,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              minHeight: 48,
                              maxWidth: 360,
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: MinimalistTheme.primaryWhite,
                                border: Border.all(
                                  color: _isEmailHovered
                                      ? MinimalistTheme.lightGray
                                      : MinimalistTheme.primaryWhite,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Text(
                                "anujyadav160@gmail.com",
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: MinimalistTheme.primaryBlack,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Social links
              FadeInUp(
                delay: const Duration(milliseconds: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SOCIAL",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 10,
                        color: MinimalistTheme.lightGray,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const SocialLinks(showLabels: true),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Simple footer
              FadeInUp(
                delay: const Duration(milliseconds: 1200),
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: MinimalistTheme.borderGray,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Text(
                    "© 2025 Anuj Yadav",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: MinimalistTheme.lightGray,
                    ),
                  ),
                ),
              ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _copyEmailToClipboard() async {
    const email = 'anujyadav160@gmail.com';
    await Clipboard.setData(const ClipboardData(text: email));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Email copied to clipboard')),
    );
  }
}
