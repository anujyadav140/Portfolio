import 'package:flutter/material.dart';
import 'package:anuj_yadav/design/theme/minimalist_theme.dart';
import 'package:anuj_yadav/design/constants/app_images.dart';
import 'package:anuj_yadav/widgets/animated_text_reveal.dart';
import 'package:anuj_yadav/widgets/social_links.dart';
import 'package:anuj_yadav/widgets/geometric_background.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _profileController;
  late AnimationController _textController;
  late Animation<double> _profileScaleAnimation;
  late Animation<Offset> _profileSlideAnimation;

  @override
  void initState() {
    super.initState();
    
    _profileController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    
    _textController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _profileScaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _profileController,
      curve: Curves.elasticOut,
    ));

    _profileSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _profileController,
      curve: Curves.easeOutCubic,
    ));

    _profileController.forward();
    
    Future.delayed(const Duration(milliseconds: 300), () {
      _textController.forward();
    });
  }

  @override
  void dispose() {
    _profileController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 1200;
    final isMediumScreen = size.width > 768;

    return SizedBox(
      height: size.height * 0.75,
      width: double.infinity,
      child: Stack(
        children: [
          // Geometric background
          const GeometricBackground(),
          
          // Main content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isLargeScreen ? 120 : (isMediumScreen ? 60 : 24),
            ),
            child: Row(
              children: [
                // Left side - Text content
                Expanded(
                  flex: isLargeScreen ? 3 : 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Greeting
                      AnimatedTextReveal(
                        controller: _textController,
                        text: "Hello, I'm",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: MinimalistTheme.lightGray,
                          letterSpacing: 2,
                        ),
                        delay: const Duration(milliseconds: 100),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Name
                      AnimatedTextReveal(
                        controller: _textController,
                        text: "Anuj Yadav",
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: isLargeScreen ? 72 : (isMediumScreen ? 48 : 32),
                          fontWeight: FontWeight.w200,
                        ),
                        delay: const Duration(milliseconds: 300),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Description
                      FadeTransition(
                        opacity: _textController,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 0.3),
                            end: Offset.zero,
                          ).animate(CurvedAnimation(
                            parent: _textController,
                            curve: const Interval(0.7, 1.0, curve: Curves.easeOut),
                          )),
                          child: Container(
                            padding: const EdgeInsets.only(left: 16),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: MinimalistTheme.accentGray,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Text(
                              "A curious mind who writes code to bring ideas to life.\nI love creating digital solutions that matter.",
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: isLargeScreen ? 16 : 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 48),
                      
                      // Social links
                      FadeTransition(
                        opacity: _textController,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 0.3),
                            end: Offset.zero,
                          ).animate(CurvedAnimation(
                            parent: _textController,
                            curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
                          )),
                          child: const SocialLinks(),
                        ),
                      ),
                    ],
                  ),
                ),
                
                if (isMediumScreen) ...[
                  const SizedBox(width: 60),
                  
                  // Right side - Profile image
                  Expanded(
                    flex: isLargeScreen ? 2 : 1,
                    child: Center(
                      child: ScaleTransition(
                        scale: _profileScaleAnimation,
                        child: SlideTransition(
                          position: _profileSlideAnimation,
                          child: Container(
                            width: isLargeScreen ? 400 : 300,
                            height: isLargeScreen ? 400 : 300,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: MinimalistTheme.borderGray,
                                width: 1,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                AppImages.selfImage,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: MinimalistTheme.accentGray,
                                    child: const Icon(
                                      Icons.person,
                                      size: 48,
                                      color: MinimalistTheme.primaryWhite,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          // Scroll indicator at bottom
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Text(
                    "SCROLL TO EXPLORE",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 10,
                      color: MinimalistTheme.lightGray,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 1,
                    height: 40,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          MinimalistTheme.lightGray,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}