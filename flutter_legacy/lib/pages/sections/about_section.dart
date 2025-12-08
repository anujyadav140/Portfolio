import 'package:flutter/material.dart';
import 'package:anuj_yadav/design/theme/minimalist_theme.dart';
import 'package:anuj_yadav/widgets/section_header.dart';
import 'package:anuj_yadav/widgets/compact_skills_grid.dart';
import 'package:anuj_yadav/widgets/fade_in_up.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
            number: "01",
            title: "About",
            subtitle: "Who I am",
          ),
          
          const SizedBox(height: 16),
          
          // Title
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Text(
              "I'm a Product Manager",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: isLargeScreen ? 32 : (isMediumScreen ? 24 : 20),
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Description
          FadeInUp(
            delay: const Duration(milliseconds: 400),
            child: Text(
              "with 3+ years of product experience, skilled in transforming legacy systems into scalable SaaS solutions. "
              "I led cross-functional teams at LTIMindtree and Epitome Network, developing mobile platforms and KPI dashboards"
              ". Recently, Graduated from Master of Information Systems Management at Carnegie Mellon University",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isLargeScreen ? 18 : 16,
              ),
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Skills section
          FadeInUp(
            delay: const Duration(milliseconds: 800),
            child: Text(
              "Skills",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          
          const SizedBox(height: 12),
          
          const CompactSkillsGrid(),
        ],
      ),
    );
  }
}