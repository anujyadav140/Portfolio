import 'package:flutter/material.dart';
import 'package:anuj_yadav/design/theme/minimalist_theme.dart';

class CustomNavigationBar extends StatefulWidget {
  final int currentSection;
  final Function(int) onSectionTap;

  const CustomNavigationBar({
    super.key,
    required this.currentSection,
    required this.onSectionTap,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  bool _isVisible = true;
  final List<String> _sections = ['Home', 'About', 'Projects', 'Contact'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 1200;
    final isMediumScreen = size.width > 768;

    if (!isMediumScreen) {
      return const SizedBox.shrink();
    }

    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(
          horizontal: isLargeScreen ? 120 : 60,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MinimalistTheme.primaryBlack,
              MinimalistTheme.primaryBlack.withValues(alpha: 0.8),
              Colors.transparent,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo/Name
            Text(
              'ANUJ YADAV',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 14,
                letterSpacing: 2,
              ),
            ),
            
            // Navigation items
            Row(
              children: _sections.asMap().entries.map((entry) {
                final index = entry.key;
                final section = entry.value;
                final isActive = widget.currentSection == index;
                
                return Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => widget.onSectionTap(index),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            section.toLowerCase(),
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: isActive 
                                  ? MinimalistTheme.primaryWhite 
                                  : MinimalistTheme.lightGray,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: 20,
                            height: 1,
                            color: isActive 
                                ? MinimalistTheme.primaryWhite 
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}