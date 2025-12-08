import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anuj_yadav/design/theme/minimalist_theme.dart';
import 'package:anuj_yadav/design/constants/app_constants.dart';
import 'package:anuj_yadav/widgets/fade_in_up.dart';

class CompactSkillsGrid extends StatelessWidget {
  const CompactSkillsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 1200;
    final isMediumScreen = size.width > 768;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Technical Skills
        _buildSkillCategory(
          context,
          "Technical",
          technicalSkills,
          0,
          isLargeScreen,
          isMediumScreen,
          hasIcons: true,
        ),
        
        const SizedBox(height: 32),
        
        // Product Management Skills
        _buildSkillCategory(
          context,
          "Product Management", 
          productSkills,
          200,
          isLargeScreen,
          isMediumScreen,
        ),
        
        const SizedBox(height: 32),
        
        // Tools
        _buildSkillCategory(
          context,
          "Tools",
          toolsSkills,
          400,
          isLargeScreen,
          isMediumScreen,
          hasIcons: true,
        ),
      ],
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String title,
    List<String> skills,
    int delayOffset,
    bool isLargeScreen,
    bool isMediumScreen, {
    bool hasIcons = false,
  }) {
    return FadeInUp(
      delay: Duration(milliseconds: delayOffset),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: isLargeScreen ? 20 : 18,
              fontWeight: FontWeight.w400,
              color: MinimalistTheme.primaryWhite,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: skills.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: MinimalistTheme.primaryWhite,
                  border: Border.all(
                    color: MinimalistTheme.primaryWhite,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (hasIcons) ...[
                      SizedBox(
                        width: 16,
                        height: 16,
                        child: techStackImages.containsKey(skill)
                            ? _buildSkillIcon(techStackImages[skill]!)
                            : Icon(
                                _getIconForSkill(skill),
                                size: 16,
                                color: MinimalistTheme.primaryBlack,
                              ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      skill,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 13,
                        color: MinimalistTheme.primaryBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  IconData _getIconForSkill(String skill) {
    switch (skill.toLowerCase()) {
      case 'python':
        return Icons.terminal;
      case 'javascript':
        return Icons.code;
      case 'sql':
        return Icons.storage;
      case 'firebase':
        return Icons.cloud;
      case 'jira':
        return Icons.assignment;
      case 'figma':
        return Icons.design_services;
      case 'excel':
        return Icons.table_chart;
      default:
        return Icons.circle;
    }
  }

  Widget _buildSkillIcon(String assetPath) {
    if (assetPath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        assetPath,
        width: 16,
        height: 16,
        colorFilter: const ColorFilter.mode(MinimalistTheme.primaryBlack, BlendMode.srcIn),
      );
    }
    // Render PNG/JPG icons in grayscale to keep brand shapes visible
    // without filling the whole chip with a solid color.
    return ColorFiltered(
      colorFilter: const ColorFilter.matrix(<double>[
        // Grayscale matrix
        0.2126, 0.7152, 0.0722, 0, 0,
        0.2126, 0.7152, 0.0722, 0, 0,
        0.2126, 0.7152, 0.0722, 0, 0,
        0,      0,      0,      1, 0,
      ]),
      child: Image.asset(
        assetPath,
        width: 16,
        height: 16,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.medium,
        errorBuilder: (context, error, stackTrace) {
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
