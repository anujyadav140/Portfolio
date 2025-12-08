import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anuj_yadav/design/theme/minimalist_theme.dart';
import 'package:anuj_yadav/design/constants/app_images.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  final bool showLabels;
  final bool isVertical;

  const SocialLinks({
    super.key,
    this.showLabels = false,
    this.isVertical = false,
  });

  @override
  Widget build(BuildContext context) {
    final links = [
      {
        'label': 'GitHub',
        'url': 'https://github.com/anujyadav140',
        'icon': Icons.code,
        'type': 'icon',
      },
      {
        'label': 'LinkedIn',
        'url': 'https://www.linkedin.com/in/anuj-yadav-4493a21b3/',
        'svgPath': AppImages.linkedInIcon,
        'type': 'svg',
      },
    ];

    if (isVertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: links.map((link) => _buildSocialLink(context, link)).toList(),
      );
    }

    return Row(
      children: links
          .map((link) => _buildSocialLink(context, link))
          .toList(),
    );
  }

  Widget _buildSocialLink(BuildContext context, Map<String, dynamic> link) {
    return Padding(
      padding: isVertical 
          ? const EdgeInsets.only(bottom: 16)
          : const EdgeInsets.only(right: 24),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => _launchUrl(link['url'] as String),
          child: showLabels
              ? _SocialLinkWithLabel(
                  label: link['label'] as String,
                  icon: link['type'] == 'icon' ? link['icon'] as IconData : null,
                  svgPath: link['type'] == 'svg' ? link['svgPath'] as String : null,
                )
              : _SocialIcon(
                  icon: link['type'] == 'icon' ? link['icon'] as IconData : null,
                  svgPath: link['type'] == 'svg' ? link['svgPath'] as String : null,
                ),
        ),
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

class _SocialIcon extends StatefulWidget {
  final IconData? icon;
  final String? svgPath;

  const _SocialIcon({this.icon, this.svgPath});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon>
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
      end: 1.1,
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
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: MinimalistTheme.primaryWhite,
            border: Border.all(
              color: _isHovered 
                  ? MinimalistTheme.lightGray 
                  : MinimalistTheme.primaryWhite,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
          child: widget.icon != null
              ? Icon(
                  widget.icon,
                  size: 20,
                  color: MinimalistTheme.primaryBlack,
                )
              : SvgPicture.asset(
                  widget.svgPath!,
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                    MinimalistTheme.primaryBlack,
                    BlendMode.srcIn,
                  ),
                ),
        ),
      ),
    );
  }
}

class _SocialLinkWithLabel extends StatefulWidget {
  final String label;
  final IconData? icon;
  final String? svgPath;

  const _SocialLinkWithLabel({
    required this.label,
    this.icon,
    this.svgPath,
  });

  @override
  State<_SocialLinkWithLabel> createState() => _SocialLinkWithLabelState();
}

class _SocialLinkWithLabelState extends State<_SocialLinkWithLabel> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: MinimalistTheme.primaryWhite,
          border: Border.all(
            color: _isHovered 
                ? MinimalistTheme.lightGray 
                : MinimalistTheme.primaryWhite,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.icon != null
                ? Icon(
                    widget.icon,
                    size: 16,
                    color: MinimalistTheme.primaryBlack,
                  )
                : SvgPicture.asset(
                    widget.svgPath!,
                    width: 16,
                    height: 16,
                    colorFilter: const ColorFilter.mode(
                      MinimalistTheme.primaryBlack,
                      BlendMode.srcIn,
                    ),
                  ),
            const SizedBox(width: 12),
            Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: MinimalistTheme.primaryBlack,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}