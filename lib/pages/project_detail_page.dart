import 'package:flutter/material.dart';
import 'package:anuj_yadav/design/theme/minimalist_theme.dart';
import 'package:anuj_yadav/models/project_model.dart';
import 'package:anuj_yadav/widgets/fade_in_up.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProjectDetailPage extends StatefulWidget {
  final ProjectModel project;

  const ProjectDetailPage({
    super.key,
    required this.project,
  });

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  YoutubePlayerController? _youtubeController;
  int _currentImageIndex = 0;
  int _heroImageIndex = 0;

  @override
  void initState() {
    super.initState();
    
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
    
    if (widget.project.isVideo && widget.project.videoId != null) {
      _youtubeController = YoutubePlayerController.fromVideoId(
        videoId: widget.project.videoId!,
        autoPlay: false,
        params: const YoutubePlayerParams(
          showFullscreenButton: true,
          mute: false,
          showControls: true,
        ),
      );
    }
    
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _youtubeController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 1200;
    final isMediumScreen = size.width > 768;

    return Scaffold(
      backgroundColor: MinimalistTheme.primaryBlack,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: CustomScrollView(
          slivers: [
            // Custom App Bar
            SliverAppBar(
              backgroundColor: MinimalistTheme.primaryBlack,
              elevation: 0,
              pinned: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: MinimalistTheme.primaryWhite,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.open_in_new,
                    color: MinimalistTheme.primaryWhite,
                  ),
                  onPressed: () => _launchUrl(widget.project.projectUrl),
                ),
              ],
            ),
            
            // Content
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLargeScreen ? 120 : (isMediumScreen ? 60 : 24),
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero section
                    _buildHeroSection(isLargeScreen, isMediumScreen),
                    
                    const SizedBox(height: 80),
                    
                    // Screenshots/Video section
                    if (widget.project.isVideo && _youtubeController != null) ...[
                      _buildVideoSection(isLargeScreen),
                      const SizedBox(height: 80),
                    ],
                    
                    
                    // Technologies section
                    _buildTechnologiesSection(isLargeScreen),
                    
                    const SizedBox(height: 80),
                    
                    // Actions section
                    _buildActionsSection(isLargeScreen),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(bool isLargeScreen, bool isMediumScreen) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - Screenshots Gallery
        if (isMediumScreen && widget.project.screenshots.isNotEmpty) ...[
          Expanded(
            flex: 1,
            child: _buildHeroScreenshotsGallery(isLargeScreen),
          ),
          
          const SizedBox(width: 60),
        ],
        
        // Right side - Project info
        Expanded(
          flex: isLargeScreen ? 1 : 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInUp(
                delay: const Duration(milliseconds: 400),
                child: Text(
                  widget.project.name,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: isLargeScreen ? 48 : 32,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              FadeInUp(
                delay: const Duration(milliseconds: 600),
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
                    widget.project.shortDescription,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: isLargeScreen ? 18 : 16,
                      height: 1.6,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Project Details section - moved here to be directly below subtitle
              _buildProjectDetailsSection(isLargeScreen),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeroScreenshotsGallery(bool isLargeScreen) {
    return FadeInUp(
      delay: const Duration(milliseconds: 200),
      child: Column(
        children: [
          // Main screenshot display
          Container(
            height: isLargeScreen ? 400 : 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                color: MinimalistTheme.borderGray,
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1),
              child: Image.asset(
                widget.project.screenshots[_heroImageIndex],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: MinimalistTheme.accentGray,
                    child: const Center(
                      child: Icon(
                        Icons.image,
                        size: 64,
                        color: MinimalistTheme.lightGray,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          
          if (widget.project.screenshots.length > 1) ...[
            const SizedBox(height: 16),
            
            // Carousel slider for gallery navigation
            CarouselSlider.builder(
              itemCount: widget.project.screenshots.length,
              itemBuilder: (context, index, realIndex) {
                final isSelected = index == _heroImageIndex;
                return GestureDetector(
                  onTap: () => setState(() => _heroImageIndex = index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(
                        color: isSelected 
                            ? MinimalistTheme.primaryWhite 
                            : MinimalistTheme.borderGray,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1),
                      child: Image.asset(
                        widget.project.screenshots[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: MinimalistTheme.accentGray,
                            child: const Center(
                              child: Icon(
                                Icons.image,
                                size: 24,
                                color: MinimalistTheme.lightGray,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 80,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                enableInfiniteScroll: false,
                viewportFraction: 0.3,
                onPageChanged: (index, reason) {
                  setState(() => _heroImageIndex = index);
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildProjectDetailsSection(bool isLargeScreen) {
    // Parse the long description to convert em dashes to bullet points
    final descriptionLines = widget.project.longDescription
        .split('\n')
        .where((line) => line.trim().isNotEmpty)
        .map((line) {
          if (line.trim().startsWith('—')) {
            return '• ${line.trim().substring(1)}';
          }
          return line.trim();
        })
        .toList();

    return FadeInUp(
      delay: const Duration(milliseconds: 800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Project Details",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: isLargeScreen ? 20 : 18,
              fontWeight: FontWeight.w300,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                color: MinimalistTheme.borderGray,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: descriptionLines.map((line) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    line,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: isLargeScreen ? 14 : 13,
                      height: 1.5,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(bool isLargeScreen) {
    // Parse the long description to convert em dashes to bullet points
    final descriptionLines = widget.project.longDescription
        .split('\n')
        .where((line) => line.trim().isNotEmpty)
        .map((line) {
          if (line.trim().startsWith('—')) {
            return '• ${line.trim().substring(1)}';
          }
          return line.trim();
        })
        .toList();

    return FadeInUp(
      delay: const Duration(milliseconds: 800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Project Details",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: isLargeScreen ? 24 : 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          
          const SizedBox(height: 24),
          
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              border: Border.all(
                color: MinimalistTheme.borderGray,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: descriptionLines.map((line) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    line,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: isLargeScreen ? 16 : 14,
                      height: 1.6,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoSection(bool isLargeScreen) {
    return FadeInUp(
      delay: const Duration(milliseconds: 1000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Project Demo",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: isLargeScreen ? 32 : 24,
              fontWeight: FontWeight.w300,
            ),
          ),
          
          const SizedBox(height: 32),
          
          Container(
            height: isLargeScreen ? 400 : 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                color: MinimalistTheme.borderGray,
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1),
              child: YoutubePlayer(
                controller: _youtubeController!,
                aspectRatio: 16 / 9,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScreenshotsSection(bool isLargeScreen, bool isMediumScreen) {
    return FadeInUp(
      delay: const Duration(milliseconds: 1200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Screenshots",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: isLargeScreen ? 32 : 24,
              fontWeight: FontWeight.w300,
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Main screenshot
          Container(
            height: isLargeScreen ? 400 : 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                color: MinimalistTheme.borderGray,
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1),
              child: Image.asset(
                widget.project.screenshots[_currentImageIndex],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: MinimalistTheme.accentGray,
                    child: const Center(
                      child: Icon(
                        Icons.image,
                        size: 64,
                        color: MinimalistTheme.lightGray,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          
          if (widget.project.screenshots.length > 1) ...[
            const SizedBox(height: 32),
            
            // Auto-scrolling horizontal gallery
            SizedBox(
              height: isLargeScreen ? 200 : 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: widget.project.screenshots.length,
                itemBuilder: (context, index) {
                  final isSelected = index == _currentImageIndex;
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () => setState(() => _currentImageIndex = index),
                      child: Container(
                        width: isLargeScreen ? 280 : 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(
                            color: isSelected 
                                ? MinimalistTheme.primaryWhite 
                                : MinimalistTheme.borderGray,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1),
                          child: Image.asset(
                            widget.project.screenshots[index],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: MinimalistTheme.accentGray,
                                child: const Center(
                                  child: Icon(
                                    Icons.image,
                                    size: 48,
                                    color: MinimalistTheme.lightGray,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTechnologiesSection(bool isLargeScreen) {
    return FadeInUp(
      delay: const Duration(milliseconds: 1400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Technologies Used",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: isLargeScreen ? 32 : 24,
              fontWeight: FontWeight.w300,
            ),
          ),
          
          const SizedBox(height: 32),
          
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: widget.project.technologies.map((tech) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: MinimalistTheme.primaryWhite,
                  border: Border.all(
                    color: MinimalistTheme.primaryWhite,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Text(
                  tech,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: MinimalistTheme.primaryBlack,
                      ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildActionsSection(bool isLargeScreen) {
    return FadeInUp(
      delay: const Duration(milliseconds: 1600),
      child: Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => _launchUrl(widget.project.projectUrl),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: BoxDecoration(
                  color: MinimalistTheme.primaryWhite,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "VIEW PROJECT",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 12,
                        color: MinimalistTheme.primaryBlack,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.arrow_outward,
                      size: 16,
                      color: MinimalistTheme.primaryBlack,
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          const SizedBox(width: 24),
          
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: MinimalistTheme.borderGray,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Text(
                  "BACK TO PORTFOLIO",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
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
