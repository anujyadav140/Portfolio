import 'package:flutter/material.dart';
import 'package:anuj_yadav/design/theme/minimalist_theme.dart';
import 'package:anuj_yadav/models/project_model.dart';
import 'package:anuj_yadav/pages/project_detail_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;
  final bool isLarge;
  final bool isSmall;
  final int index;

  const ProjectCard({
    super.key,
    required this.project,
    this.isLarge = false,
    this.isSmall = false,
    required this.index,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
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
    final isLargeScreen = size.width > 1200;
    final isMediumScreen = size.width > 768;

    double cardHeight;
    if (widget.isLarge) {
      cardHeight = isLargeScreen ? 400 : (isMediumScreen ? 320 : 280);
    } else if (widget.isSmall) {
      cardHeight = isLargeScreen ? 280 : (isMediumScreen ? 240 : 200);
    } else {
      cardHeight = isLargeScreen ? 320 : (isMediumScreen ? 280 : 240);
    }

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
        onTap: () => _navigateToProjectDetail(),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            height: cardHeight,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Project image
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: MinimalistTheme.accentGray,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(1),
                        topRight: Radius.circular(1),
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Project image
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(1),
                              topRight: Radius.circular(1),
                            ),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
                              child: Image.asset(
                                widget.project.imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: MinimalistTheme.accentGray,
                                  child: Center(
                                    child: Icon(
                                      _getProjectIcon(widget.project.name),
                                      size: 48,
                                      color: MinimalistTheme.primaryWhite.withValues(alpha: 0.7),
                                    ),
                                  ),
                                );
                              },
                            ),
                            ),
                          ),
                        ),
                        
                        // Overlay gradient
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(1),
                                topRight: Radius.circular(1),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  MinimalistTheme.primaryBlack.withValues(alpha: 0.1),
                                ],
                              ),
                            ),
                          ),
                        ),
                        
                        // Project index
                        Positioned(
                          top: 16,
                          right: 16,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: MinimalistTheme.primaryBlack.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(1),
                            ),
                            child: Text(
                              '${widget.index + 1}'.padLeft(2, '0'),
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: 12,
                                color: MinimalistTheme.primaryWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Project details
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Project name
                        Text(
                          widget.project.name,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: widget.isLarge ? 18 : 16,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        
                        const SizedBox(height: 8),
                        
                        // Project description - Flexible space
                        Flexible(
                          child: Text(
                            widget.project.shortDescription,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: widget.isLarge ? 13 : 12,
                              color: MinimalistTheme.lightGray,
                              height: 1.3,
                            ),
                            maxLines: widget.isLarge ? 4 : 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        
                        const SizedBox(height: 12),
                        
                        // Technologies - More compact
                        Wrap(
                          spacing: 6,
                          runSpacing: 4,
                          children: widget.project.technologies.take(3).map((tech) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: MinimalistTheme.borderGray,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                tech,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: 9,
                                  color: MinimalistTheme.lightGray,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        
                        const SizedBox(height: 8),
                        
                        // Action indicators
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                if (widget.project.isVideo) ...[
                                  Icon(
                                    Icons.play_circle_outline,
                                    size: 14,
                                    color: MinimalistTheme.lightGray,
                                  ),
                                  const SizedBox(width: 6),
                                ],
                                Icon(
                                  Icons.photo_library_outlined,
                                  size: 14,
                                  color: MinimalistTheme.lightGray,
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 14,
                              color: _isHovered 
                                  ? MinimalistTheme.primaryWhite 
                                  : MinimalistTheme.lightGray,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getProjectIcon(String projectName) {
    switch (projectName.toLowerCase()) {
      case 'diarify':
        return Icons.book;
      case 'poetry ai':
        return Icons.edit;
      case 'poetry analysis':
        return Icons.analytics;
      default:
        return Icons.code;
    }
  }

  void _navigateToProjectDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProjectDetailPage(project: widget.project),
      ),
    );
  }

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}