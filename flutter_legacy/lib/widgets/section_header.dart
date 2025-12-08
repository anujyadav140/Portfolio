import 'package:flutter/material.dart';
import 'package:anuj_yadav/design/theme/minimalist_theme.dart';
import 'package:anuj_yadav/widgets/fade_in_up.dart';

class SectionHeader extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;

  const SectionHeader({
    super.key,
    required this.number,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 1200;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInUp(
          child: Row(
            children: [
              Text(
                number,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 14,
                  color: MinimalistTheme.lightGray,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        MinimalistTheme.borderGray,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        FadeInUp(
          delay: const Duration(milliseconds: 200),
          child: Text(
            title,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: isLargeScreen ? 48 : 32,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        
        const SizedBox(height: 8),
        
        FadeInUp(
          delay: const Duration(milliseconds: 400),
          child: Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: MinimalistTheme.lightGray,
            ),
          ),
        ),
      ],
    );
  }
}