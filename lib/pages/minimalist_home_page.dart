import 'package:flutter/material.dart';
import 'package:anuj_yadav/design/theme/minimalist_theme.dart';
import 'package:anuj_yadav/pages/sections/hero_section.dart';
import 'package:anuj_yadav/pages/sections/about_section.dart';
import 'package:anuj_yadav/pages/sections/projects_section.dart';
import 'package:anuj_yadav/pages/sections/contact_section.dart';
import 'package:anuj_yadav/widgets/custom_scroll_indicator.dart';
import 'package:anuj_yadav/widgets/navigation_bar.dart';

class MinimalistHomePage extends StatefulWidget {
  const MinimalistHomePage({super.key});

  @override
  State<MinimalistHomePage> createState() => _MinimalistHomePageState();
}

class _MinimalistHomePageState extends State<MinimalistHomePage>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  
  double _scrollProgress = 0.0;
  int _currentSection = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_updateScrollProgress);
    
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    ));
    
    _fadeController.forward();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _updateScrollProgress() {
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;
      setState(() {
        _scrollProgress = maxScroll > 0 ? currentScroll / maxScroll : 0;
        _currentSection = (_scrollProgress * 4).floor().clamp(0, 3);
      });
    }
  }

  void _scrollToSection(int section) {
    final keys = [_heroKey, _aboutKey, _projectsKey, _contactKey];
    if (section < keys.length) {
      final context = keys[section].currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MinimalistTheme.primaryBlack,
      body: Stack(
        children: [
          // Main content
          FadeTransition(
            opacity: _fadeAnimation,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  key: _heroKey,
                  child: const HeroSection(),
                ),
                SliverToBoxAdapter(
                  key: _aboutKey,
                  child: const AboutSection(),
                ),
                SliverToBoxAdapter(
                  key: _projectsKey,
                  child: const ProjectsSection(),
                ),
                SliverToBoxAdapter(
                  key: _contactKey,
                  child: const ContactSection(),
                ),
              ],
            ),
          ),
          
          // Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomNavigationBar(
              currentSection: _currentSection,
              onSectionTap: _scrollToSection,
            ),
          ),
          
          // Custom scroll indicator
          Positioned(
            right: 24,
            top: MediaQuery.of(context).size.height * 0.3,
            child: CustomScrollIndicator(
              progress: _scrollProgress,
              currentSection: _currentSection,
              onSectionTap: _scrollToSection,
            ),
          ),
        ],
      ),
    );
  }
}