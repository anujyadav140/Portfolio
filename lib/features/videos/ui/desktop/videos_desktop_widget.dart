import 'package:akshit_madan/details/project_detail.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

class VideosDesktopWidget extends StatefulWidget {
  const VideosDesktopWidget({super.key});

  @override
  State<VideosDesktopWidget> createState() => _VideosDesktopWidgetState();
}

class Project {
  final AssetImage image;
  final String name;
  final String url;
  final String shortDescription;
  final String longDescription;
  final String technologies;
  final bool isLandscape;
  final List<String> screenshots;
  Project({
    required this.image,
    required this.name,
    required this.url,
    required this.shortDescription,
    required this.longDescription,
    required this.screenshots,
    required this.isLandscape,
    required this.technologies,
  });
}

class _VideosDesktopWidgetState extends State<VideosDesktopWidget> {
  int activeIndex = 0;
  List<Project> projects = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 40),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Solo Projects (Click on any of the projects to know more about them)',
                style: TextStyle(fontSize: w / 40),
              ),
              const SizedBox(height: 40),
              CarouselSlider(
                options: CarouselOptions(
                  height: 400,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: false,
                  autoPlay: false,
                  viewportFraction: 0.33,
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
            ])),
        buildIndicator(),
      ],
    );
  }

  List<Widget> _buildCarouselItems() {
    projects = [
      Project(
          image: const AssetImage('assets/screenshots/poetry-ai.png'),
          name: 'Poetry AI',
          shortDescription:
              'Published a poetry editor app that is powered by LLMs on the google playstore.',
          longDescription:
              '''—This is a solo app I developed and published in my free time...\n—A poetry editor app powered by AI (chatGPT), which gives you recommendations and guides you to enhance your poetry writing skills. Write, analyse, generate poetical responses from a pretty good AI assistant.\n—I used Flutter framework to make the front end of the app, the backend is written using Typescript and is built using firebase cloud functions.\n—For the AI part I used the openAI LLM model to generate responses for the user, I used the Langchain framework for prompt engineering.\n—All the data is stored on the user's device, nothing is stored in the cloud.''',
          screenshots: [
            'assets/screenshots/poetry-ai-ss1.png',
            'assets/screenshots/poetry-ai-ss2.png',
            'assets/screenshots/poetry-ai-ss3.png',
            'assets/screenshots/poetry-ai-ss4.png',
            'assets/screenshots/poetry-ai-ss5.png',
            'assets/screenshots/poetry-ai-ss6.png',
            'assets/screenshots/poetry-ai-ss7.png',
            'assets/screenshots/poetry-ai-ss8.png',
          ],
          url:
              'https://play.google.com/store/apps/details?id=com.anujyadav.poetryai&pli=1',
          isLandscape: false,
          technologies:
              'Flutter, OpenAI LLMs, Langchain, Hive, Provider State Management, Typescript & Firebase.'),
      Project(
          image: const AssetImage('assets/screenshots/wiki-ai.png'),
          name: 'Wiki-AI',
          shortDescription:
              'Wiki-AI uses OpenAI & Langchain to generate summaries of any Wikipedia article you want-',
          longDescription:
              '''—This is a solo app I developed in my free time...\n—I was excited about the possibilities of Large Language Models and wanted to use it for summarization purposes.\n—Wiki-AI is an LLM Project, Where in you can generate summaries of Wikipedia articles through invoking openAI APIs.\n— I used Langchain framework for prompt engineering and used vector search for slicing and generating relevant and accurate information.\n—I used Wikipedia API for extracting data for the summary generation.''',
          screenshots: [
            'assets/screenshots/wiki-ai-ss1.png',
            'assets/screenshots/wiki-ai-ss2.png',
            'assets/screenshots/wiki-ai-ss3.png',
            'assets/screenshots/wiki-ai-ss4.png',
            'assets/screenshots/wiki-ai-ss5.png',
            'assets/screenshots/wiki-ai-ss6.png',
            'assets/screenshots/wiki-ai-ss7.png',
          ],
          url: 'https://wiki-ai.vercel.app/',
          isLandscape: true,
          technologies:
              'React, Nextjs, Typescript, Express, OpenAI LLMs, Langchain & Pinecone'),
      Project(
          image: const AssetImage('assets/screenshots/poetry-analysis.png'),
          name: 'Poetry Analysis',
          shortDescription:
              'A cross-platform project in which user can write up a poem in the editor and analyze the poem through Machine Learning.',
          longDescription:
              '''—Another one of my solo projects, It is a cross-platform project in which user can write up a poem in the editor and analyze the poem through Machine Learning.\n—Finds the metre, rhyme scheme and even the poetry type.\n—Using the CMUDict (Carnegie Mellon University Dict.) to find the stressed and unstressed syllables of a word.\n—Compared them against the common forms using Levenshtein distance.''',
          screenshots: [
            'assets/screenshots/poetry-analysis-ss1.png',
            'assets/screenshots/poetry-analysis-ss2.png',
            'assets/screenshots/poetry-analysis-ss3.png',
            'assets/screenshots/poetry-analysis-ss4.png',
            'assets/screenshots/poetry-analysis-ss5.png',
          ],
          url: 'https://poetry-analysis.web.app/#/',
          isLandscape: true,
          technologies:
              'Flutter, Python, Flask, Syllapy, NLTK, pronouncing, CMUDict'),
      Project(
          image: const AssetImage('assets/screenshots/chatting-app.png'),
          name: 'Chatting App',
          shortDescription:
              'A cross-platform real time chatting app with multimedia support, voice texts and even voice commands, built using flutter and firebase.',
          longDescription:
              '''—Side project I did to get accustomed to Firebase and Native android app development and utilizing the Speech Recognition APIs in the OS.\n—This chatting app has multimedia support, voice texts and even voice commands.\n—Implemented voice command features to navigate between pages and logout (more voice commands can be added-), speech recognition was done with the help of native speech recognition api in android.\n—Even implemented chatGPT & Dall-E as one of the chatting options to get accustomed to these new technologies.''',
          screenshots: [
            'assets/screenshots/chatting-ss1.png',
            'assets/screenshots/chatting-ss2.png',
            'assets/screenshots/chatting-ss3.png',
            'assets/screenshots/chatting-ss4.png',
            'assets/screenshots/chatting-ss5.png',
          ],
          url: 'https://chatting-app-cf41d.web.app/#/',
          isLandscape: false,
          technologies:
              'Flutter, Firebase, OpenAI LLMs, Langchain, Native Speech Recognition APIs (Android SpeechRecognizer API)'),
    ];

    return projects.map((project) {
      return Builder(
        builder: (BuildContext context) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ProjectDetail(
                      projectTitle: project.name,
                      projectShortDescription: project.shortDescription,
                      projectScreenshots: project.screenshots,
                      projectLongDescription: project.longDescription,
                      projectUrl: project.url,
                      isLandscape: project.isLandscape,
                      tech: project.technologies,
                    );
                  },
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    Image(image: project.image),
                    const SizedBox(height: 10),
                    Text(
                      project.name,
                      style: const TextStyle(fontSize: 25),
                    ),
                    const SizedBox(height: 5),
                    Text(project.shortDescription),
                    GestureDetector(
                      onTap: () {
                        final Uri url = Uri.parse(project.url);
                        launchUrl(url);
                      },
                      child: Text(
                        "url: ${project.url}",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: projects.length,
        effect: const JumpingDotEffect(
          dotWidth: 20,
          dotHeight: 20,
          dotColor: Colors.greenAccent,
          activeDotColor: Color.fromARGB(255, 42, 97, 44),
        ),
      );
}
