import 'package:flutter/material.dart';
import 'package:anuj_yadav/design/theme/minimalist_theme.dart';
import 'package:anuj_yadav/design/constants/app_constants.dart';
import 'package:anuj_yadav/widgets/fade_in_up.dart';
import 'package:url_launcher/url_launcher.dart';

class TechStackGrid extends StatelessWidget {
  const TechStackGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final techList = techStack.entries.toList();
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 1200;
    final isMediumScreen = size.width > 768;
    
    final columns = isLargeScreen ? 4 : (isMediumScreen ? 3 : 2);

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: techList.asMap().entries.map((entry) {
        final index = entry.key;
        final techEntry = entry.value;
        
        return FadeInUp(
          delay: Duration(milliseconds: 100 * index),
          child: _TechItem(
            name: techEntry.key,
            imagePath: techEntry.value['image']!,
            link: techEntry.value['link']!,
          ),
        );
      }).toList(),
    );
  }
}

class _TechItem extends StatefulWidget {
  final String name;
  final String imagePath;
  final String link;

  const _TechItem({
    required this.name,
    required this.imagePath,
    required this.link,
  });

  @override
  State<_TechItem> createState() => _TechItemState();
}

class _TechItemState extends State<_TechItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 768;
    
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: GestureDetector(
        onTap: () => _launchUrl(widget.link),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: isSmallScreen ? 60 : 70,
            height: isSmallScreen ? 60 : 70,
            decoration: BoxDecoration(
              border: Border.all(
                color: _isHovered 
                    ? MinimalistTheme.primaryWhite 
                    : MinimalistTheme.borderGray,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tech icon
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    widget.imagePath,
                    width: 24,
                    height: 24,
                    color: _isHovered 
                        ? MinimalistTheme.primaryWhite 
                        : MinimalistTheme.lightGray,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        _getIconForTech(widget.name),
                        size: 16,
                        color: _isHovered 
                            ? MinimalistTheme.primaryWhite 
                            : MinimalistTheme.lightGray,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: isSmallScreen ? 10 : 12,
                    color: _isHovered 
                        ? MinimalistTheme.primaryWhite 
                        : MinimalistTheme.lightGray,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconForTech(String techName) {
    switch (techName.toLowerCase()) {
      case 'flutter':
      case 'dart':
        return Icons.widgets;
      case 'react':
      case 'angular':
        return Icons.web;
      case 'javascript':
      case 'typescript':
        return Icons.code;
      case 'sql':
        return Icons.storage;
      case 'firebase':
        return Icons.cloud;
      case 'mongodb':
        return Icons.storage;
      case 'nodejs':
        return Icons.dns;
      case 'python':
        return Icons.terminal;
      case 'jira':
        return Icons.assignment;
      case 'figma':
        return Icons.design_services;
      case 'excel':
        return Icons.table_chart;
      case 'git':
        return Icons.source;
      case 'azure':
      case 'aws':
        return Icons.cloud_queue;
      case 'langchain':
        return Icons.link;
      default:
        return Icons.extension;
    }
  }

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}