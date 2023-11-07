import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailMobile extends StatefulWidget {
  final String projectTitle;
  final String projectUrl;
  final String projectShortDescription;
  final String projectLongDescription;
  final String tech;
  final bool isLandscape;
  final List<String> projectScreenshots;

  const ProjectDetailMobile(
      {super.key,
      required this.projectTitle,
      required this.projectShortDescription,
      required this.projectScreenshots,
      required this.projectLongDescription,
      required this.projectUrl,
      required this.isLandscape,
      required this.tech});

  @override
  State<ProjectDetailMobile> createState() => _ProjectDetailMobileState();
}

class _ProjectDetailMobileState extends State<ProjectDetailMobile> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
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
            child: Image.asset(
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
