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
        image:
            'https://cdn.discordapp.com/attachments/1170323444458594416/1170372521112113203/diarify.png?ex=6558cd59&is=65465859&hm=923a610ffe41a4a4ea7b47ba0e09735c772139c20ca71c178ed1bd0cee7a8597&',
        name: 'Diarify',
        shortDescription:
            'A diary app which makes diary entries through speech, chat with your past diary entries all through the power of AI.',
        longDescription:
            '''—This is a solo app I am developing in my free time...\n—The user can chat with their previous diary entries going back as long as there is user's diary entries available.\n—Uses Pinecone vector database to store all the vector data for easy data retrieval.\n—A Diary app powered by LLMs, maintaining a diary can be tedious for some people, this app makes it easier to keep a diary; user just has to record themselves while speaking about anything, the app will transcribe it and the AI will rewrite it in any style you want.\n—After a diary entry is generated, the App gives each diary entry "Emotion Tags" to track the well being of the user.''',
        screenshots: [
          'https://cdn.discordapp.com/attachments/1170323444458594416/1170324193808748615/photo_6208268788944713798_y.jpg?ex=6558a057&is=65462b57&hm=0aa6ba1a94578a8e6f5952adeef86ee2ade77198628e0717d59755cbb79d4a17&',
          'https://cdn.discordapp.com/attachments/1170323444458594416/1170324194555338762/photo_6206016989131029831_y.jpg?ex=6558a057&is=65462b57&hm=f9be7fdb1f7713981d01e82eaaf140b255b618c2404eac2ef37f92c7157d9649&',
          'https://cdn.discordapp.com/attachments/1170323444458594416/1170324194156884048/photo_6206016989131029832_y.jpg?ex=6558a057&is=65462b57&hm=22f89c00f6677fdee2827dd42dc4c2154cd059f0e4e2083edeb2968f33e55a82&',
          'https://cdn.discordapp.com/attachments/1170323444458594416/1170324193083129946/photo_6208268788944713800_y.jpg?ex=6558a057&is=65462b57&hm=edb9a9f62591e24f398eb355e11fbbefbc2bf6edc6ae0b6eb46a32936c6aad0f&',
          'https://cdn.discordapp.com/attachments/1170323444458594416/1170324193422880848/photo_6208268788944713799_y.jpg?ex=6558a057&is=65462b57&hm=eaad520fcbb35d8db70549c6a09577cc5d40b98411b7bf9b61452658bd5f9044&',
        ],
        url: 'https://github.com/anujyadav140/Diary-AI',
        isLandscape: false,
        technologies:
            'Flutter, OpenAI LLMs, Langchain, Provider State Management, Firebase & Pinecone DB.',
        isVideo: true,
        videoId: 'wC1tGSw9SE8',
      ),
      Project(
        image:
            'https://cdn.discordapp.com/attachments/1170323495369052200/1170324029236838420/poetry-ai.png?ex=6558a030&is=65462b30&hm=be1d918fa21234eb2fe3f6c78ef3df958284cd6e33d4f7964015df640d5f6df7&',
        name: 'Poetry AI',
        shortDescription:
            'Published a poetry editor app that is powered by LLMs on the google playstore.',
        longDescription:
            '''—This is a solo app I developed and published in my free time...\n—A poetry editor app powered by AI (chatGPT), which gives you recommendations and guides you to enhance your poetry writing skills. Write, analyse, generate poetical responses from a pretty good AI assistant.\n—I used Flutter framework to make the front end of the app, the backend is written using Typescript and is built using firebase cloud functions.\n—For the AI part I used the openAI LLM model to generate responses for the user, I used the Langchain framework for prompt engineering.\n—All the data is stored on the user's device, nothing is stored in the cloud.''',
        screenshots: [
          'https://cdn.discordapp.com/attachments/1170323495369052200/1170324029614329936/poetry-ai-ss1.png?ex=6558a030&is=65462b30&hm=9ca87fe248489f51f660c444c2cf5129661d26f584d20576c735c5acebffb13b&',
          'https://cdn.discordapp.com/attachments/1170323495369052200/1170324029975052308/poetry-ai-ss2.png?ex=6558a030&is=65462b30&hm=a1d4e3c62fb2cb6dc06cfd07350d3dbdbac85ab17e6a4c248ba4710c541eb016&',
          'https://cdn.discordapp.com/attachments/1170323495369052200/1170324030335746120/poetry-ai-ss3.png?ex=6558a030&is=65462b30&hm=265afb880e7e4dab766fefaef8a89be8f039e91e514a4ad5953c60c01378385f&',
          'https://cdn.discordapp.com/attachments/1170323495369052200/1170324030717431808/poetry-ai-ss4.png?ex=6558a030&is=65462b30&hm=2c38ca4a3d065ea77f52d61853524b52d79da45a03ac65e048f6a71789039ee9&',
          'https://cdn.discordapp.com/attachments/1170323495369052200/1170324031099125820/poetry-ai-ss5.png?ex=6558a030&is=65462b30&hm=5de5f6a49b0e28abb52f86da7e8ccb8b4e1fa33b24f7f9b056052c22ca7f641e&',
          'https://cdn.discordapp.com/attachments/1170323495369052200/1170324031464013854/poetry-ai-ss6.png?ex=6558a030&is=65462b30&hm=956e4d58fb3b5d2ef0cd042c68a24a145badd0c67a7269dce49599cb3bf4f1f4&',
          'https://cdn.discordapp.com/attachments/1170323495369052200/1170324031845699584/poetry-ai-ss7.png?ex=6558a030&is=65462b30&hm=af2c9e8c9df0adfa62efd0e093af3f46d1b47673e941adc9958fb07671ae6d77&',
          'https://cdn.discordapp.com/attachments/1170323495369052200/1170324032206422026/poetry-ai-ss8.png?ex=6558a030&is=65462b30&hm=228b7e4e30545b4f19767f4d6f900f524bc4c2745597d1949510088ae927b722&',
        ],
        url:
            'https://play.google.com/store/apps/details?id=com.anujyadav.poetryai&pli=1',
        isLandscape: false,
        technologies:
            'Flutter, OpenAI LLMs, Langchain, Hive, Provider State Management, Typescript & Firebase.',
        isVideo: false,
        videoId: '',
      ),
      Project(
        image:
            'https://cdn.discordapp.com/attachments/1170312411874611233/1170315870405394503/Screenshot_2023-11-03_075111.png?ex=65589896&is=65462396&hm=941d55097c91dece413c6bd6e3063b0d87b9f79c78309350774c093a2d3485e2&',
        name: 'Artisan',
        shortDescription:
            'Freelancing project I made for Artisan Business Ventures Pvt Ltd, to streamline their Salon Business.',
        longDescription:
            '''—This is the solo-freelancing work I did for Artisan Business Ventures.\n—It handles Bill Management, Attendance Management and Customer Database Management for Artisan' salon business.\n—In Customer Management, introduced features to enhance customer loyalty and increase returning customers by over 20% and implemented KPI indicators to track customer purchases.\n—Feature to generate the Billing pdf and share it easily with the user.\n—Attendance has location tracking enabled, added features to look at past attendance history of the employees.\n—It works on multiple devices such as: Web, Mobile App, Windows etc.''',
        screenshots: [
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312548621504582/photo_6205976436049820288_y.jpg?ex=6558957e&is=6546207e&hm=419c1187548ec782f471dfe42b09090a6aaa67d1aebaa0490b00956f3eaa812d&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312615092834416/photo_6205976436049820297_y.jpg?ex=6558958e&is=6546208e&hm=bab2a4121c9522ce794acf4989cf6730a78f4c366dfd6825d58b703674bd65d5&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312614446907472/photo_6205976436049820299_y.jpg?ex=6558958e&is=6546208e&hm=a5879ea238355f6f630be9dc6bd61593ee8bf4146af91fea760c2f7e4458fc82&',
          // 'https://cdn.discordapp.com/attachments/1170312411874611233/1170312613679345694/photo_6205976436049820301_y.jpg?ex=6558958e&is=6546208e&hm=2c48975684a58f2d91146ee41d13b8c1427a21ed9af79e5139c0138871c6dfa9&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312614061035621/photo_6205976436049820300_y.jpg?ex=6558958e&is=6546208e&hm=da60ac2e6d09004a911f2448647b6fae2ef024c714ac25f90ceb71fb23de34d3&',
          // 'https://cdn.discordapp.com/attachments/1170312411874611233/1170312614790836334/photo_6205976436049820298_y.jpg?ex=6558958e&is=6546208e&hm=88c72647b073a5976a7de4e588f4aa0287a54f24671bf146453b995fae4547f9&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312615910715492/photo_6205976436049820295_y.jpg?ex=6558958e&is=6546208e&hm=329302571a5426f296bfb9f5ccbac570586a1355444130643e6439c5f9cf1cc4&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312613347999804/photo_6205976436049820302_y.jpg?ex=6558958e&is=6546208e&hm=666d400c6357fd623c10668728a96ce56a00ee777776e8a79252ce713de6c162&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312547208011868/photo_6205976436049820294_y.jpg?ex=6558957e&is=6546207e&hm=bf15a0ec064a5421af86a313bd39d92d1d711b531ba4f89b31ae70a5a52e01fc&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312548067844217/photo_6205976436049820291_y.jpg?ex=6558957e&is=6546207e&hm=1195a78d330492bd8766f99ecf7042a2fa1cad40ae4e3fe26d4b37a244592ac1&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312612567855155/photo_6205976436049820304_y.jpg?ex=6558958e&is=6546208e&hm=0ee0721daf838e3c340d7f0d18ebd92e3cbfa8940423b8e8cd8835e72d4623d6&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312622197972992/photo_6205976436049820305_y.jpg?ex=65589590&is=65462090&hm=0052fa6ce38e555d3f4d275744cf0dab5a148e4d43080500ade7acaf5d91410c&',
        ],
        url: 'https://github.com/anujyadav140/Artisan',
        isLandscape: false,
        technologies: 'Flutter, Firebase & Provider State Management.',
        isVideo: false,
        videoId: '',
      ),
      Project(
        image:
            'https://cdn.discordapp.com/attachments/1170324044185350164/1170324113055821844/wiki-ai.png?ex=6558a044&is=65462b44&hm=61099f3102408f3ad76e42df6cd0d4836e34e740ab130488194a18b0e7597feb&',
        name: 'Wiki-AI',
        shortDescription:
            'Wiki-AI uses OpenAI & Langchain to generate summaries of any Wikipedia article you want-',
        longDescription:
            '''—This is a solo app I developed in my free time...\n—I was excited about the possibilities of Large Language Models and wanted to use it for summarization purposes.\n—Wiki-AI is an LLM Project, Where in you can generate summaries of Wikipedia articles through invoking openAI APIs.\n— I used Langchain framework for prompt engineering and used vector search for slicing and generating relevant and accurate information.\n—I used Wikipedia API for extracting data for the summary generation.''',
        screenshots: [
          'https://cdn.discordapp.com/attachments/1170324044185350164/1170324113513005137/wiki-ai-ss1.png?ex=6558a044&is=65462b44&hm=5495f5293894e1b0ddf7b95025647cd92664839ce12e2a2585672194c6c507a6&',
          'https://cdn.discordapp.com/attachments/1170324044185350164/1170324113953411072/wiki-ai-ss2.png?ex=6558a044&is=65462b44&hm=8251e377f89ba2eea4e5513d7819f2811ae546eaad988b794fcff76f848ad40d&',
          'https://cdn.discordapp.com/attachments/1170324044185350164/1170324114351861850/wiki-ai-ss3.png?ex=6558a044&is=65462b44&hm=6c479a0bfd980c325b7901d215e4d488016475e609edae50ab7dda10d4644206&',
          'https://cdn.discordapp.com/attachments/1170324044185350164/1170324114771296337/wiki-ai-ss4.png?ex=6558a044&is=65462b44&hm=95c73017f07e162b483d66607e5aa2e3c771f44854d290428f60d78d42870e5b&',
          'https://cdn.discordapp.com/attachments/1170324044185350164/1170324115127816223/wiki-ai-ss5.png?ex=6558a044&is=65462b44&hm=d68c4a7bedc5e5dc3278784c96f6e59500ebc6e0655977918bcaa4520f464ef9&',
          'https://cdn.discordapp.com/attachments/1170324044185350164/1170324115538849814/wiki-ai-ss6.png?ex=6558a044&is=65462b44&hm=306a977780a266b948dfaa74e156ca47d98195a077a80df038662f4cd3af8687&',
          'https://cdn.discordapp.com/attachments/1170324044185350164/1170324115933118504/wiki-ai-ss7.png?ex=6558a044&is=65462b44&hm=563f0ea42f7164409048be14cd761e682e6d79796015b250129adad16a2c675e&',
        ],
        url: 'https://wiki-ai.vercel.app/',
        isLandscape: true,
        technologies:
            'React, Nextjs, Typescript, Express, OpenAI LLMs, Langchain & Pinecone',
        isVideo: false,
        videoId: '',
      ),
      Project(
        image:
            'https://cdn.discordapp.com/attachments/1170324219461120120/1170324301216485506/poetry-analysis.png?ex=6558a070&is=65462b70&hm=4745c61a2fd5534424e705a79ad6950cce77d03729f32207af66ca9c05f4b6c4&',
        name: 'Poetry Analysis',
        shortDescription:
            'A cross-platform project in which user can write up a poem in the editor and analyze the poem through Machine Learning.',
        longDescription:
            '''—Another one of my solo projects, It is a cross-platform project in which user can write up a poem in the editor and analyze the poem through Machine Learning.\n—Finds the metre, rhyme scheme and even the poetry type.\n—Using the CMUDict (Carnegie Mellon University Dict.) to find the stressed and unstressed syllables of a word.\n—Compared them against the common forms using Levenshtein distance.''',
        screenshots: [
          'https://cdn.discordapp.com/attachments/1170324219461120120/1170324301593989210/poetry-analysis-ss1.png?ex=6558a071&is=65462b71&hm=4d4bd10c49a9f6e83b63103c6fb5f8c17f18c30a90d5168e84a50db839c7c6d6&',
          'https://cdn.discordapp.com/attachments/1170324219461120120/1170324301963079680/poetry-analysis-ss2.png?ex=6558a071&is=65462b71&hm=04cb05b96cc82faff31ae8b42af9f2a6f43ec90f9cb9fdb59998e0dc3ffc9f2f&',
          'https://cdn.discordapp.com/attachments/1170324219461120120/1170324302361530460/poetry-analysis-ss3.png?ex=6558a071&is=65462b71&hm=cdb61a44f644fd5847bab20f556525581043ef7305bad4caad4603c3b906624e&',
          'https://cdn.discordapp.com/attachments/1170324219461120120/1170324302856466492/poetry-analysis-ss4.png?ex=6558a071&is=65462b71&hm=015aa1ae50cbe6850fd6002b9b85d1ca2b1a90e6b3d0e0d3f4fca56afe735a8f&',
          'https://cdn.discordapp.com/attachments/1170324219461120120/1170324303212974141/poetry-analysis-ss5.png?ex=6558a071&is=65462b71&hm=dcc8699aa8b7ed461202bd3f3ff1b7792fcc432dc62e401cbd66087c7d934f51&',
        ],
        url: 'https://poetry-analysis.web.app/#/',
        isLandscape: true,
        technologies:
            'Flutter, Python, Flask, Syllapy, NLTK, pronouncing, CMUDict',
        isVideo: false,
        videoId: '',
      ),
      Project(
          image:
              'https://cdn.discordapp.com/attachments/1170323730220716083/1170323788416692314/chatting-app.png?ex=65589ff6&is=65462af6&hm=28887465327649922ab882012073e12d9a86a2e49a9b027009000ea658abc344&',
          name: 'Chatting App',
          shortDescription:
              'A cross-platform real time chatting app with multimedia support, voice texts and even voice commands, built using flutter and firebase.',
          longDescription:
              '''—Side project I did to get accustomed to Firebase and Native android app development and utilizing the Speech Recognition APIs in the OS.\n—This chatting app has multimedia support, voice texts and even voice commands.\n—Implemented voice command features to navigate between pages and logout (more voice commands can be added-), speech recognition was done with the help of native speech recognition api in android.\n—Even implemented chatGPT & Dall-E as one of the chatting options to get accustomed to these new technologies.''',
          screenshots: [
            'https://cdn.discordapp.com/attachments/1170323730220716083/1170323788844503120/chatting-ss1.png?ex=65589ff6&is=65462af6&hm=cf80bf90b6f02b1f7d0b1cabed7f607a9f1348e20ac630cb6a73548b09c8ec62&',
            'https://cdn.discordapp.com/attachments/1170323730220716083/1170323789192626207/chatting-ss2.png?ex=65589ff6&is=65462af6&hm=7b364314611c46b399108a1c87880311dec7378b2e47a57eccfa9d76a43c7237&',
            'https://cdn.discordapp.com/attachments/1170323730220716083/1170323789540765706/chatting-ss3.png?ex=65589ff6&is=65462af6&hm=ed936d5535c2d21eb8ecf2b39358ecdc12b477170d2d977d18d6df2d2ec4be29&',
            'https://cdn.discordapp.com/attachments/1170323730220716083/1170323790216040508/chatting-ss4.png?ex=65589ff7&is=65462af7&hm=86e4dbc869b75aa71a927d6235e7662ba614418786023c48fcc352cf080f6fe5&',
            'https://cdn.discordapp.com/attachments/1170323730220716083/1170323790622883881/chatting-ss5.png?ex=65589ff7&is=65462af7&hm=2d52c0db1790aa40f629dcd86f004adf2db32c88e560eac61a4a208b69ad453d&',
          ],
          url: 'https://chatting-app-cf41d.web.app/#/',
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
                    Image.network(project.image),
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
          dotColor: Colors.white,
          activeDotColor: Color.fromRGBO(97, 97, 97, 1),
        ),
      );
}
