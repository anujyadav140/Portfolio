import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetail extends StatefulWidget {
  final String projectTitle;
  final String projectUrl;
  final String projectShortDescription;
  final String projectLongDescription;
  final String tech;
  final bool isLandscape;
  final List<String> projectScreenshots;
  const ProjectDetail(
      {super.key,
      required this.projectTitle,
      required this.projectShortDescription,
      required this.projectScreenshots,
      required this.projectLongDescription,
      required this.projectUrl,
      required this.isLandscape,
      required this.tech});

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
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
                    fontSize: w / 80,
                    fontWeight: FontWeight.bold,
                  ),
                ))),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.8,
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
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: w / 40,
                        ),
                      ),
                      Text(
                        widget.projectLongDescription,
                        style: TextStyle(
                          fontSize: w / 80,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Technologies I Used",
                        style: TextStyle(
                          fontSize: w / 40,
                        ),
                      ),
                      Text(
                        widget.tech,
                        style: TextStyle(
                          fontSize: w / 80,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Text(
            "Demo Video:",
            style: TextStyle(
              fontSize: w / 40,
            ),
          ),
//           Html(
//             data: '''
// <iframe width="560" height="315" src="https://www.youtube.com/embed/wC1tGSw9SE8?si=Z2VzQfEG3QxU15ca" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
// ''',
//           )
        ]),
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
          dotWidth: 20,
          dotHeight: 20,
          dotColor: Colors.white,
          activeDotColor: Color.fromRGBO(97, 97, 97, 1),
        ),
      );
}
