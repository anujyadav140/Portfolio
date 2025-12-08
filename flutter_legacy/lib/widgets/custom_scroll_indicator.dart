import 'package:flutter/material.dart';
import 'package:anuj_yadav/design/theme/minimalist_theme.dart';

class CustomScrollIndicator extends StatelessWidget {
  final double progress;
  final int currentSection;
  final Function(int) onSectionTap;

  const CustomScrollIndicator({
    super.key,
    required this.progress,
    required this.currentSection,
    required this.onSectionTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 1200;

    if (!isLargeScreen) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        // Progress indicator
        Container(
          width: 1,
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                MinimalistTheme.borderGray,
                Colors.transparent,
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: progress * 80,
                child: Container(
                  width: 1,
                  height: 20,
                  color: MinimalistTheme.primaryWhite,
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Section dots
        Column(
          children: List.generate(4, (index) {
            final isActive = currentSection == index;
            
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => onSectionTap(index),
                  child: Container(
                    width: isActive ? 8 : 4,
                    height: isActive ? 8 : 4,
                    decoration: BoxDecoration(
                      color: isActive 
                          ? MinimalistTheme.primaryWhite 
                          : MinimalistTheme.borderGray,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}