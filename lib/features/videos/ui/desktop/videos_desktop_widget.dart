import 'package:anuj_yadav/details/project_detail.dart';
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
  final dynamic image;
  final String name;
  final String url;
  final String shortDescription;
  final String longDescription;
  final String technologies;
  final bool isLandscape;
  final List<String> screenshots;
  final bool isVideo;
  final String videoId;
  Project({
    required this.image,
    required this.name,
    required this.url,
    required this.shortDescription,
    required this.longDescription,
    required this.screenshots,
    required this.isLandscape,
    required this.technologies,
    required this.isVideo,
    required this.videoId,
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
                  height: 320,
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
        image: 'assets/demos/diarify.png',
        name: 'Diarify',
        shortDescription:
            'A diary app which makes diary entries through speech, chat with your past diary entries all through the power of AI.',
        longDescription:
            '''—This is a solo app I am developing in my free time...\n—The user can chat with their previous diary entries going back as long as there is user's diary entries available.\n—Uses Pinecone vector database to store all the vector data for easy data retrieval.\n—A Diary app powered by LLMs, maintaining a diary can be tedious for some people, this app makes it easier to keep a diary; user just has to record themselves while speaking about anything, the app will transcribe it and the AI will rewrite it in any style you want.\n—After a diary entry is generated, the App gives each diary entry "Emotion Tags" to track the well being of the user.''',
        screenshots: [
          'assets/demos/diarify/diarify-ss1.jpg',
          'assets/demos/diarify/diarify-ss2.jpg',
          'assets/demos/diarify/diarify-ss4.jpg',
          'assets/demos/diarify/diarify-ss3.jpg',
          'assets/demos/diarify/diarify-ss5.jpg',
        ],
        url: 'https://github.com/anujyadav140/Diary-AI',
        isLandscape: false,
        technologies:
            'Flutter, OpenAI LLMs, Langchain, Provider State Management, Firebase & Pinecone DB.',
        isVideo: true,
        videoId: 'wC1tGSw9SE8',
      ),
      Project(
        image: 'assets/demos/poetry-ai.png',
        name: 'Poetry AI',
        shortDescription:
            'Published a poetry editor app that is powered by LLMs on the google playstore.',
        longDescription:
            '''—This is a solo app I developed and published in my free time...\n—A poetry editor app powered by AI (chatGPT), which gives you recommendations and guides you to enhance your poetry writing skills. Write, analyse, generate poetical responses from a pretty good AI assistant.\n—I used Flutter framework to make the front end of the app, the backend is written using Typescript and is built using firebase cloud functions.\n—For the AI part I used the openAI LLM model to generate responses for the user, I used the Langchain framework for prompt engineering.\n—All the data is stored on the user's device, nothing is stored in the cloud.''',
        screenshots: [
          'assets/demos/poetryai/poetry-ai-ss1.png',
          'assets/demos/poetryai/poetry-ai-ss2.png',
          'assets/demos/poetryai/poetry-ai-ss3.png',
          'assets/demos/poetryai/poetry-ai-ss4.png',
          'assets/demos/poetryai/poetry-ai-ss5.png',
          'assets/demos/poetryai/poetry-ai-ss6.png',
          'assets/demos/poetryai/poetry-ai-ss7.png',
          'assets/demos/poetryai/poetry-ai-ss8.png',
          'assets/demos/poetryai/poetry-ai-ss9.png',
        ],
        url:
            'https://play.google.com/store/apps/details?id=com.anujyadav.poetryai&pli=1',
        isLandscape: false,
        technologies:
            'Flutter, OpenAI LLMs, Langchain, Hive, Provider State Management, Typescript & Firebase.',
        isVideo: true,
        videoId: '3J-_KV70ZLc',
      ),
      Project(
        image: 'assets/demos/wiki-ai.png',
        name: 'Wiki-AI',
        shortDescription:
            'Wiki-AI uses OpenAI & Langchain to generate summaries of any Wikipedia article you want-',
        longDescription:
            '''—This is a solo app I developed in my free time...\n—I was excited about the possibilities of Large Language Models and wanted to use it for summarization purposes.\n—Wiki-AI is an LLM Project, Where in you can generate summaries of Wikipedia articles through invoking openAI APIs.\n— I used Langchain framework for prompt engineering and used vector search for slicing and generating relevant and accurate information.\n—I used Wikipedia API for extracting data for the summary generation.''',
        screenshots: [
          'assets/demos/wikiai/wiki-ai-ss1.png',
          'assets/demos/wikiai/wiki-ai.png',
          'assets/demos/wikiai/wiki-ai-ss2.png',
          'assets/demos/wikiai/wiki-ai-ss3.png',
          'assets/demos/wikiai/wiki-ai-ss4.png',
          'assets/demos/wikiai/wiki-ai-ss5.png',
          'assets/demos/wikiai/wiki-ai-ss6.png',
          'assets/demos/wikiai/wiki-ai-ss7.png',
        ],
        url: 'https://wiki-ai.vercel.app/',
        isLandscape: true,
        technologies:
            'React, Nextjs, Typescript, Express, OpenAI LLMs, Langchain & Pinecone',
        isVideo: true,
        videoId: 'OQ6zPnUIjXk',
      ),
      Project(
        image: 'assets/demos/poetry-analysis.png',
        name: 'Poetry Analysis',
        shortDescription:
            'A cross-platform project in which user can write up a poem in the editor and analyze the poem through Machine Learning.',
        longDescription:
            '''—Another one of my solo projects, It is a cross-platform project in which user can write up a poem in the editor and analyze the poem through Machine Learning.\n—Finds the metre, rhyme scheme and even the poetry type.\n—Using the CMUDict (Carnegie Mellon University Dict.) to find the stressed and unstressed syllables of a word.\n—Compared them against the common forms using Levenshtein distance.''',
        screenshots: [
          'assets/demos/poetry-analysis/poetry-analysis.png',
          'assets/demos/poetry-analysis/poetry-analysis-ss1.png',
          'assets/demos/poetry-analysis/poetry-analysis-ss2.png',
          'assets/demos/poetry-analysis/poetry-analysis-ss3.png',
          'assets/demos/poetry-analysis/poetry-analysis-ss4.png',
        ],
        url: 'https://poetry-analysis.web.app/#/',
        isLandscape: true,
        technologies:
            'Flutter, Python, Flask, Syllapy, NLTK, pronouncing, CMUDict',
        isVideo: true,
        videoId: 'opA6kChWWd0',
      ),
      Project(
        image: 'assets/demos/commentary-ai-ss1.png',
        name: 'Commentary AI',
        shortDescription:
            'An AI Project built on streamlit, upload a video add AI generated voiceover to it, using GPT-4 Vision, TTS and synchronisation.',
        longDescription:
            '''—Another one of my solo projects, It is a streamlit AI project where user uploads a short video and the AI generates voiceover for it and then TTS is generated and the voiceover is synchronised with the video.\n—It uses GPT-4 Vision where the video is converted into multiple images so that the GPT-4 Vision API can understand it, also the user can add their own custom prompt to change how the voiceover will be generated.\n—Text-to-Speech is used to convert the voiceover text and synchronised finally with the video.''',
        screenshots: [
          'assets/demos/commentaryai/commentary-ai-ss2.png',
          'assets/demos/commentaryai/commentary-ai-ss3.png',
          'assets/demos/commentaryai/commentary-ai-ss4.png',
          'assets/demos/commentaryai/commentary-ai-ss5.png',
        ],
        url: 'https://github.com/anujyadav140/commentary-ai',
        isLandscape: true,
        technologies: 'Python, Streamlit, numpy, opencv-python, OpenAI',
        isVideo: true,
        videoId: 'EfmhpX2SjN8',
      ),
      Project(
        image: 'assets/demos/artisan-ss1.png',
        name: 'Artisan',
        shortDescription:
            'Freelancing project I made for Artisan Business Ventures Pvt Ltd, to streamline their Salon Business.',
        longDescription:
            '''—This is the solo-freelancing work I did for Artisan Business Ventures.\n—It handles Bill Management, Attendance Management and Customer Database Management for Artisan' salon business.\n—In Customer Management, introduced features to enhance customer loyalty and increase returning customers by over 20% and implemented KPI indicators to track customer purchases.\n—Feature to generate the Billing pdf and share it easily with the user.\n—Attendance has location tracking enabled, added features to look at past attendance history of the employees.\n—It works on multiple devices such as: Web, Mobile App, Windows etc.''',
        screenshots: [
          'assets/demos/artisan/artisan-ss2.png',
          'assets/demos/artisan/artisan-ss3.png',
          'assets/demos/artisan/artisan-ss4.png',
          'assets/demos/artisan/artisan-ss5.png',
          'assets/demos/artisan/artisan-ss6.png',
          'assets/demos/artisan/artisan-ss7.png',
          'assets/demos/artisan/artisan-ss8.png',
          'assets/demos/artisan/artisan-ss9.png',
          'assets/demos/artisan/artisan-ss10.png',
          'assets/demos/artisan/artisan-ss11.png',
          'assets/demos/artisan/artisan-ss12.png',
          'assets/demos/artisan/artisan-ss13.png',
          'assets/demos/artisan/artisan-ss14.png',
        ],
        url: 'https://github.com/anujyadav140/Artisan',
        isLandscape: false,
        technologies: 'Flutter, Firebase & Provider State Management.',
        isVideo: false,
        videoId: '',
      ),
      Project(
          image: 'assets/demos/chatting-app-ss1.png',
          name: 'Chatting App',
          shortDescription:
              'A chatting app with multimedia support, voice texts and even voice commands, built using flutter and firebase.',
          longDescription:
              '''—Side project I did to get accustomed to Firebase and Native android app development and utilizing the Speech Recognition APIs in the OS.\n—This chatting app has multimedia support, voice texts and even voice commands.\n—Implemented voice command features to navigate between pages and logout (more voice commands can be added-), speech recognition was done with the help of native speech recognition api in android.\n—Even implemented chatGPT & Dall-E as one of the chatting options to get accustomed to these new technologies.''',
          screenshots: [
            'assets/demos/chatting/chatting-ss2.png',
            'assets/demos/chatting/chatting-ss3.png',
            'assets/demos/chatting/chatting-ss4.png',
            'assets/demos/chatting/chatting-ss5.png',
          ],
          url: 'https://github.com/anujyadav140/Chatting_App',
          isLandscape: false,
          technologies:
              'Flutter, Firebase, OpenAI LLMs, Langchain, Native Speech Recognition APIs (Android SpeechRecognizer API)',
          isVideo: false,
          videoId: ''),
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
                      isVideo: project.isVideo,
                      videoId: project.videoId,
                    );
                  },
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    // Image(image: project.image),
                    Image.asset(project.image),
                    // Image.network(project.image),
                    const SizedBox(height: 5),
                    Text(
                      project.name,
                      style: const TextStyle(fontSize: 25),
                    ),
                    Text(
                      project.shortDescription,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    GestureDetector(
                        onTap: () {
                          final Uri url = Uri.parse(project.url);
                          launchUrl(url);
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: project.url,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )),
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
          dotColor: Colors.white,
          activeDotColor: Color.fromRGBO(97, 97, 97, 1),
        ),
      );
}
