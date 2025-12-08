import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ProjectDetailMobile extends StatefulWidget {
  final String projectTitle;
  final String projectUrl;
  final String projectShortDescription;
  final String projectLongDescription;
  final String tech;
  final bool isLandscape;
  final List<String> projectScreenshots;
  final bool isVideo;
  final String videoId;
  const ProjectDetailMobile({
    super.key,
    required this.projectTitle,
    required this.projectShortDescription,
    required this.projectScreenshots,
    required this.projectLongDescription,
    required this.projectUrl,
    required this.isLandscape,
    required this.tech,
    required this.isVideo,
    required this.videoId,
  });

  @override
  State<ProjectDetailMobile> createState() => _ProjectDetailMobileState();
}

class _ProjectDetailMobileState extends State<ProjectDetailMobile> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            onTap: () {
              final Uri url = Uri.parse(widget.projectUrl);
              launchUrl(url);
            },
            child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  "${widget.projectTitle} - ${widget.projectUrl}",
                  style: TextStyle(
                    fontSize: w / 40,
                  ),
                ))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.5,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlay: true,
                viewportFraction: !widget.isLandscape ? 0.33 : 1,
                aspectRatio: 16 / 9,
                initialPage: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              items: _buildCarouselItems(),
            ),
            buildIndicator(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: w / 20,
                    ),
                  ),
                  Text(
                    widget.projectLongDescription,
                    style: TextStyle(
                      fontSize: w / 40,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Technologies I Used",
                    style: TextStyle(
                      fontSize: w / 20,
                    ),
                  ),
                  Text(
                    widget.tech,
                    style: TextStyle(
                      fontSize: w / 40,
                    ),
                  )
                ],
              ),
            ),
            widget.isVideo
                ? Column(
                    children: [
                      Text(
                        "Demo Video:",
                        style: TextStyle(
                          fontSize: w / 20,
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: w * 0.7,
                        height: h * 0.5,
                        child: YoutubePlayer(
                          controller: _controller,
                          aspectRatio: 16 / 9,
                        ),
                      ),
                      SizedBox(height: h * 0.1),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCarouselItems() {
    return widget.projectScreenshots.map((screenshot) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            // height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Image.network(
              screenshot,
              fit: BoxFit.fitWidth,
            ),
          );
        },
      );
    }).toList();
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: widget.projectScreenshots.length,
        effect: const JumpingDotEffect(
          dotWidth: 10,
          dotHeight: 10,
          dotColor: Colors.white,
          activeDotColor: Color.fromRGBO(97, 97, 97, 1),
        ),
      );
}
