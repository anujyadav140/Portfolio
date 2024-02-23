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
        image:
            'https://cdn.discordapp.com/attachments/1170323444458594416/1170372521112113203/diarify.png?ex=65e33ad9&is=65d0c5d9&hm=9a6432394d1b1046381b3a052d2a90d2b4756792ebc5f1c0619f8f4a1b2f3a44&',
        name: 'Diarify',
        shortDescription:
            'A diary app which makes diary entries through speech, chat with your past diary entries all through the power of AI.',
        longDescription:
            '''—This is a solo app I am developing in my free time...\n—The user can chat with their previous diary entries going back as long as there is user's diary entries available.\n—Uses Pinecone vector database to store all the vector data for easy data retrieval.\n—A Diary app powered by LLMs, maintaining a diary can be tedious for some people, this app makes it easier to keep a diary; user just has to record themselves while speaking about anything, the app will transcribe it and the AI will rewrite it in any style you want.\n—After a diary entry is generated, the App gives each diary entry "Emotion Tags" to track the well being of the user.''',
        screenshots: [
          'https://cdn.discordapp.com/attachments/1170323444458594416/1170324193808748615/photo_6208268788944713798_y.jpg?ex=65e30dd7&is=65d098d7&hm=b80c86ea1018bd0d3ca283cbc334ef50ec4709c03cf013655f3272932e5de08c&',
          'https://cdn.discordapp.com/attachments/1170323444458594416/1170324194555338762/photo_6206016989131029831_y.jpg?ex=65e30dd7&is=65d098d7&hm=bc9b2038876bf19e652054facdf61038259fee33b3a7cd0254c91c61386a55b7&',
          'https://cdn.discordapp.com/attachments/1170323444458594416/1170324194156884048/photo_6206016989131029832_y.jpg?ex=65e30dd7&is=65d098d7&hm=348bde879dcf3bc97fca71b896889e16a572f50718511e1b82a1fa56e143acf5&',
          'https://cdn.discordapp.com/attachments/1170323444458594416/1170324193083129946/photo_6208268788944713800_y.jpg?ex=65e30dd7&is=65d098d7&hm=066fd99ed3dcbd4b555f726739fbe4944fe09dfb80a9ed800edd0e402cbe04d6&',
          'https://cdn.discordapp.com/attachments/1170323444458594416/1170324193422880848/photo_6208268788944713799_y.jpg?ex=65e30dd7&is=65d098d7&hm=ebce87084321d5d8a7da8339795a6e7cc7fc30083ed7e75b2c9d61cc0f06bb45&',
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
            'https://cdn.discordapp.com/attachments/1170323495369052200/1170324029236838420/poetry-ai.png?ex=65e30db0&is=65d098b0&hm=dd967593a7a2daaaa5c0d1605aca48f558e76bedadaa07e685fd9ca5a16e01e9&',
        name: 'Poetry AI',
        shortDescription:
            'Published a poetry editor app that is powered by LLMs on the google playstore.',
        longDescription:
            '''—This is a solo app I developed and published in my free time...\n—A poetry editor app powered by AI (chatGPT), which gives you recommendations and guides you to enhance your poetry writing skills. Write, analyse, generate poetical responses from a pretty good AI assistant.\n—I used Flutter framework to make the front end of the app, the backend is written using Typescript and is built using firebase cloud functions.\n—For the AI part I used the openAI LLM model to generate responses for the user, I used the Langchain framework for prompt engineering.\n—All the data is stored on the user's device, nothing is stored in the cloud.''',
        screenshots: [
          'https://cdn.discordapp.com/attachments/1170323495369052200/1170324029614329936/poetry-ai-ss1.png?ex=65e30db0&is=65d098b0&hm=ba8e33376e051d2b31cf816e3315fc022720cd3be85bb96f02fcf90916935d01&',
          'https://cdn.discordapp.com/attachments/1170323495369052200/1170324029975052308/poetry-ai-ss2.png?ex=65e30db0&is=65d098b0&hm=c7ba398d3995312601a7281e1885fb72bf3629aea3e80e7065bcdfe5d9b8d93c&',
          'https://cdn.discordapp.com/attachments/1170323495369052200/1170324030335746120/poetry-ai-ss3.png?ex=65e30db0&is=65d098b0&hm=b0dcca5e31c238347e12ccc9e65c605d2227e15cefb5b2b0a7193d1b4bb2527f&',
          'https://cdn.discordapp.com/attachments/1170323495369052200/1170324030717431808/poetry-ai-ss4.png?ex=65e30db0&is=65d098b0&hm=b36f8f67ff5e2367a1263636a1901e1c379b059de8111dbdc0ca3ad85e3ac97f&',
          'https://cdn.discordapp.com/attachments/1170323495369052200/1170324031099125820/poetry-ai-ss5.png?ex=65e30db0&is=65d098b0&hm=fac73d522e061603099a6954e9110ac0319b21654ecff63d3b281fc51cad03ff&',
          'https://cdn.discordapp.com/attachments/1170323495369052200/1170324031464013854/poetry-ai-ss6.png?ex=65e30db0&is=65d098b0&hm=ef3355927489f68b764ccb659754fc4f6a1ca5d0ac385e9ebb32db92645227a1&',
          'https://cdn.discordapp.com/attachments/1170323495369052200/1170324031845699584/poetry-ai-ss7.png?ex=65e30db0&is=65d098b0&hm=660b72af9b01a1cf8eafcfff760e604b84a6fc3aefffc7954238a64803c0fc48&',
          'https://cdn.discordapp.com/attachments/1170323495369052200/1170324032206422026/poetry-ai-ss8.png?ex=65e30db0&is=65d098b0&hm=c456edb13bd69bee37a835c2ace004c99b3e2c80566b86ac6f9cee070146f4f6&',
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
        image:
            'https://cdn.discordapp.com/attachments/1170324044185350164/1170324113513005137/wiki-ai-ss1.png?ex=65e30dc4&is=65d098c4&hm=1c7416acad8a2085a2d48ec1e7b7a93d8db0e45005b3d0afa8b3b96e0e447031&',
        name: 'Wiki-AI',
        shortDescription:
            'Wiki-AI uses OpenAI & Langchain to generate summaries of any Wikipedia article you want-',
        longDescription:
            '''—This is a solo app I developed in my free time...\n—I was excited about the possibilities of Large Language Models and wanted to use it for summarization purposes.\n—Wiki-AI is an LLM Project, Where in you can generate summaries of Wikipedia articles through invoking openAI APIs.\n— I used Langchain framework for prompt engineering and used vector search for slicing and generating relevant and accurate information.\n—I used Wikipedia API for extracting data for the summary generation.''',
        screenshots: [
          'https://cdn.discordapp.com/attachments/1170324044185350164/1170324113513005137/wiki-ai-ss1.png?ex=65e30dc4&is=65d098c4&hm=1c7416acad8a2085a2d48ec1e7b7a93d8db0e45005b3d0afa8b3b96e0e447031&',
          'https://cdn.discordapp.com/attachments/1170324044185350164/1170324113055821844/wiki-ai.png?ex=65e30dc4&is=65d098c4&hm=3fd348be35b18fd55c0c747395be4fdcd47a5627eeb88adffcd21c82b87a90b4&',
          'https://cdn.discordapp.com/attachments/1170324044185350164/1170324113953411072/wiki-ai-ss2.png?ex=65e30dc4&is=65d098c4&hm=5ec7bddee5976e0ceab715185406b0e451ab85485e3ad6bd303ae2cdddd12b5c&',
          'https://cdn.discordapp.com/attachments/1170324044185350164/1170324114351861850/wiki-ai-ss3.png?ex=65e30dc4&is=65d098c4&hm=6af6299ff443b7f789db55b1a0c58b8efeab08dd83b949689de123efa70106de&',
          'https://cdn.discordapp.com/attachments/1170324044185350164/1170324114771296337/wiki-ai-ss4.png?ex=65e30dc4&is=65d098c4&hm=7a1160f357c149517ca63611988b688cf89ea01b450034384de489823c2f9a91&',
          'https://cdn.discordapp.com/attachments/1170324044185350164/1170324115127816223/wiki-ai-ss5.png?ex=65e30dc4&is=65d098c4&hm=b2984cbdd919c278715a4fb88d67c3b644bd016e3d27af6e0f73a10ac7ec0a6a&',
          'https://cdn.discordapp.com/attachments/1170324044185350164/1170324115538849814/wiki-ai-ss6.png?ex=65e30dc4&is=65d098c4&hm=0a0a1b5b37fec5d38154664b0056bf19411c6e44f6a9bfd2a0c8d838d0d977e8&',
          'https://cdn.discordapp.com/attachments/1170324044185350164/1170324115933118504/wiki-ai-ss7.png?ex=65e30dc4&is=65d098c4&hm=62f308c30256bf33772138c74a17f7a6ad333eb36a78577c98ea90c2365b728c&',
        ],
        url: 'https://wiki-ai.vercel.app/',
        isLandscape: true,
        technologies:
            'React, Nextjs, Typescript, Express, OpenAI LLMs, Langchain & Pinecone',
        isVideo: true,
        videoId: 'OQ6zPnUIjXk',
      ),
      Project(
        image:
            'https://cdn.discordapp.com/attachments/1170324219461120120/1170324301216485506/poetry-analysis.png?ex=65e30df0&is=65d098f0&hm=134a9a733a66b376f786ab2c999db96f725c50656c8776f4eab5186948c42e72&',
        name: 'Poetry Analysis',
        shortDescription:
            'A cross-platform project in which user can write up a poem in the editor and analyze the poem through Machine Learning.',
        longDescription:
            '''—Another one of my solo projects, It is a cross-platform project in which user can write up a poem in the editor and analyze the poem through Machine Learning.\n—Finds the metre, rhyme scheme and even the poetry type.\n—Using the CMUDict (Carnegie Mellon University Dict.) to find the stressed and unstressed syllables of a word.\n—Compared them against the common forms using Levenshtein distance.''',
        screenshots: [
          'https://cdn.discordapp.com/attachments/1170324219461120120/1170324301593989210/poetry-analysis-ss1.png?ex=65e30df1&is=65d098f1&hm=c353c9d36d15e02042906a8a86945e106dd2f5094e014f19c73000880cea8da5&',
          'https://cdn.discordapp.com/attachments/1170324219461120120/1170324301963079680/poetry-analysis-ss2.png?ex=65e30df1&is=65d098f1&hm=f81a57d82621bd9ba992ee777b380090fa397a398cd062b3d5abab768423ce0a&',
          'https://cdn.discordapp.com/attachments/1170324219461120120/1170324302361530460/poetry-analysis-ss3.png?ex=65e30df1&is=65d098f1&hm=050f69b80b6629cb2f835917fb98a67c1d299ed5658b153860d99c95d819c86f&',
          'https://cdn.discordapp.com/attachments/1170324219461120120/1170324302856466492/poetry-analysis-ss4.png?ex=65e30df1&is=65d098f1&hm=8db75d0b57680264150383d78b8e590ae338ee734f812d104addf9bf9d59acf9&',
          'https://cdn.discordapp.com/attachments/1170324219461120120/1170324303212974141/poetry-analysis-ss5.png?ex=65e30df1&is=65d098f1&hm=b84541459407e81f73e3bc55bb24efc516ab3a402ea66a6eef839c7f37336b3d&',
        ],
        url: 'https://poetry-analysis.web.app/#/',
        isLandscape: true,
        technologies:
            'Flutter, Python, Flask, Syllapy, NLTK, pronouncing, CMUDict',
        isVideo: true,
        videoId: 'opA6kChWWd0',
      ),
      Project(
        image:
            'https://cdn.discordapp.com/attachments/1174645973570568283/1174678345749901352/Screenshot_2023-11-16_095457.png?ex=65e9aa76&is=65d73576&hm=cfe26688058f04173c95b954dbf5004709b455e41e2e3517f4813c1e7b55d9b8&',
        name: 'Commentary AI',
        shortDescription:
            'An AI Project built on streamlit, upload a video add AI generated voiceover to it, using GPT-4 Vision, TTS and synchronisation.',
        longDescription:
            '''—Another one of my solo projects, It is a streamlit AI project where user uploads a short video and the AI generates voiceover for it and then TTS is generated and the voiceover is synchronised with the video.\n—It uses GPT-4 Vision where the video is converted into multiple images so that the GPT-4 Vision API can understand it, also the user can add their own custom prompt to change how the voiceover will be generated.\n—Text-to-Speech is used to convert the voiceover text and synchronised finally with the video.''',
        screenshots: [
          'https://cdn.discordapp.com/attachments/1174645973570568283/1174646100192399370/Screenshot_2023-11-16_095457.png?ex=65e98c6e&is=65d7176e&hm=6631de5342442e5c4ae3efb21ec7cb9d807db765c0e5abeb006ba66fcb7e4e23&',
          'https://cdn.discordapp.com/attachments/1174645973570568283/1174646104814530622/Screenshot_2023-11-16_095534.png?ex=65e98c6f&is=65d7176f&hm=258b301af8003e4c387db859664411f863f91f44dc912e5e671e3d630eff38a1&',
          'https://cdn.discordapp.com/attachments/1174645973570568283/1174646105271717918/Screenshot_2023-11-16_095603.png?ex=65e98c6f&is=65d7176f&hm=8da91898e06bc49722e3d2a02d28fb7d052c85b2d551b3641a5930842dc7d00b&',
          'https://cdn.discordapp.com/attachments/1174645973570568283/1174646105825349652/Screenshot_2023-11-16_095637.png?ex=65e98c6f&is=65d7176f&hm=da40fb24892c7bdaf883a4de61bcb2edc44bf36d87e5a0d7d54e485b58bb4ca7&',
        ],
        url: 'https://github.com/anujyadav140/commentary-ai',
        isLandscape: true,
        technologies: 'Python, Streamlit, numpy, opencv-python, OpenAI',
        isVideo: true,
        videoId: 'EfmhpX2SjN8',
      ),
      Project(
        image:
            'https://cdn.discordapp.com/attachments/1170312411874611233/1170315870405394503/Screenshot_2023-11-03_075111.png?ex=65e30616&is=65d09116&hm=f2d4f4eba78de34c3b7dd0980a0b5de00a36c390bb3df3d202ad7eaeebb55722&',
        name: 'Artisan',
        shortDescription:
            'Freelancing project I made for Artisan Business Ventures Pvt Ltd, to streamline their Salon Business.',
        longDescription:
            '''—This is the solo-freelancing work I did for Artisan Business Ventures.\n—It handles Bill Management, Attendance Management and Customer Database Management for Artisan' salon business.\n—In Customer Management, introduced features to enhance customer loyalty and increase returning customers by over 20% and implemented KPI indicators to track customer purchases.\n—Feature to generate the Billing pdf and share it easily with the user.\n—Attendance has location tracking enabled, added features to look at past attendance history of the employees.\n—It works on multiple devices such as: Web, Mobile App, Windows etc.''',
        screenshots: [
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312548621504582/photo_6205976436049820288_y.jpg?ex=65e302fe&is=65d08dfe&hm=c7dee1f5b51f454edd7791e2ee8fd1e555c60b629e6fdfd0538210189bfda72d&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312615503872091/photo_6205976436049820296_y.jpg?ex=65e3030e&is=65d08e0e&hm=7ae0c1c88ff5f33b6fbcb0ddaca3ca9693150f883f0f5146e8ca9085b126c45b&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1210596576439836672/FIXED1.png?ex=65eb22eb&is=65d8adeb&hm=59eb60c9780c2d7f3d33e1a4161ed53bd5b2aac3157a5f1e52392899c6525f90&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312613679345694/photo_6205976436049820301_y.jpg?ex=65e3030e&is=65d08e0e&hm=51970ce93cd428cfaa5c5b9ba6cb254255fc7423dfaf4e216842ac8558471bda&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312614061035621/photo_6205976436049820300_y.jpg?ex=65e3030e&is=65d08e0e&hm=7dcff96de59120a8fdcb3fd2efb39cb4234e7ab6410e975ee8d7a1363905d175&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312614790836334/photo_6205976436049820298_y.jpg?ex=65e3030e&is=65d08e0e&hm=f58ffd2d16633543eb706ee14328091697f1b51ba1f0d110115dd2610b94afee&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312548873150546/photo_6205976436049820289_y.jpg?ex=65e302ff&is=65d08dff&hm=5523c5dbe979a386c44142374574190088f547c9fe1072098812fcb70bc2b5f9&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312548067844217/photo_6205976436049820291_y.jpg?ex=65e302fe&is=65d08dfe&hm=c06ab0257f01e1c31b4676b9d1abdaee6d4760abafe82933f7b08dfbb974a697&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312547728117771/photo_6205976436049820292_y.jpg?ex=65e302fe&is=65d08dfe&hm=75071e2d16d0b23b524ae3eeaadefd16983b3f697016dbeb4f8a3d78660b4a1f&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312547463860314/photo_6205976436049820293_y.jpg?ex=65e302fe&is=65d08dfe&hm=276f493d8100927f0aaa704b6a1f568c3765e12d67a9e8246cbedb08cee45af9&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312613347999804/photo_6205976436049820302_y.jpg?ex=65e3030e&is=65d08e0e&hm=ff7989cdecb1bea7e2d78264f1f1a4dc189abda650aafaf1234e97adcfe43be9&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312547208011868/photo_6205976436049820294_y.jpg?ex=65e302fe&is=65d08dfe&hm=5b80280c9fdf93c75c94fb2086a55d19b0812738afa1d0b27eedc206a8143157&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312612567855155/photo_6205976436049820304_y.jpg?ex=65e3030e&is=65d08e0e&hm=1eddcd4ecb7da21221e73707904447877f8cb6022e43bb6965b75b2f77765a1f&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312621350735933/photo_6205976436049820307_y.jpg?ex=65e30310&is=65d08e10&hm=74821d5cfcc866f680d60432e8178042702bc34cd9fe81612ea6773e88e195f3&',
          'https://cdn.discordapp.com/attachments/1170312411874611233/1170312622197972992/photo_6205976436049820305_y.jpg?ex=65e30310&is=65d08e10&hm=c652c7a65f860903a45e241c34b3e624d46100e3b2a90d27f9877b4d75af75c9&',
        ],
        url: 'https://github.com/anujyadav140/Artisan',
        isLandscape: false,
        technologies: 'Flutter, Firebase & Provider State Management.',
        isVideo: false,
        videoId: '',
      ),
      Project(
          image:
              'https://cdn.discordapp.com/attachments/1170323730220716083/1170323788416692314/chatting-app.png?ex=65e30d76&is=65d09876&hm=6a9d4538a4bfa944eda79dded29ebf8c68f92225826012fdeae31d5aa105b742&',
          name: 'Chatting App',
          shortDescription:
              'A chatting app with multimedia support, voice texts and even voice commands, built using flutter and firebase.',
          longDescription:
              '''—Side project I did to get accustomed to Firebase and Native android app development and utilizing the Speech Recognition APIs in the OS.\n—This chatting app has multimedia support, voice texts and even voice commands.\n—Implemented voice command features to navigate between pages and logout (more voice commands can be added-), speech recognition was done with the help of native speech recognition api in android.\n—Even implemented chatGPT & Dall-E as one of the chatting options to get accustomed to these new technologies.''',
          screenshots: [
            'https://cdn.discordapp.com/attachments/1170323730220716083/1170323788844503120/chatting-ss1.png?ex=65e30d76&is=65d09876&hm=186f7c7cff91498380ffd3c3572f9ac751f528a9f77c60e7d81808e3d287890c&',
            'https://cdn.discordapp.com/attachments/1170323730220716083/1170323789192626207/chatting-ss2.png?ex=65e30d76&is=65d09876&hm=a2a061f0f6101ac931522ea3d5a7eb1fbff2f405894994cd5963c1ad214cdefa&',
            'https://cdn.discordapp.com/attachments/1170323730220716083/1170323789540765706/chatting-ss3.png?ex=65e30d76&is=65d09876&hm=d29b0fd8268ccf1d413611d2e4a2d72016564eb71183f319f6e59e809c3635b4&',
            'https://cdn.discordapp.com/attachments/1170323730220716083/1170323790216040508/chatting-ss4.png?ex=65e30d77&is=65d09877&hm=612cbf098a29be0f9bd408d38ab7d43aee041588720528757ec3f17423dbc196&',
            'https://cdn.discordapp.com/attachments/1170323730220716083/1170323790622883881/chatting-ss5.png?ex=65e30d77&is=65d09877&hm=70467930b34515f0a8f50b85946155267e4ed590c1f52b9d4e87d83ee2309e0a&',
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
                    Image.network(project.image),
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
