class ProjectModel {
  final String name;
  final String shortDescription;
  final String longDescription;
  final String imageUrl;
  final String projectUrl;
  final List<String> technologies;
  final bool isVideo;
  final String? videoId;
  final List<String> screenshots;
  final bool isLandscape;

  ProjectModel({
    required this.name,
    required this.shortDescription,
    required this.longDescription,
    required this.imageUrl,
    required this.projectUrl,
    required this.technologies,
    this.isVideo = false,
    this.videoId,
    required this.screenshots,
    this.isLandscape = false,
  });

  static List<ProjectModel> getFeaturedProjects() {
    return [
      ProjectModel(
        name: 'Diarify',
        shortDescription: 'A diary app which makes diary entries through speech, chat with your past diary entries all through the power of AI.',
        longDescription: '''This is a solo app I am developing in my free time...
—The user can chat with their previous diary entries going back as long as there is user's diary entries available.
—Uses Pinecone vector database to store all the vector data for easy data retrieval.
—A Diary app powered by LLMs, maintaining a diary can be tedious for some people, this app makes it easier to keep a diary; user just has to record themselves while speaking about anything, the app will transcribe it and the AI will rewrite it in any style you want.
—After a diary entry is generated, the App gives each diary entry "Emotion Tags" to track the well being of the user.''',
        imageUrl: 'assets/demos/diarify.png',
        projectUrl: 'https://github.com/anujyadav140/Diary-AI',
        technologies: ['Flutter', 'OpenAI', 'Langchain', 'Firebase', 'Pinecone'],
        isVideo: true,
        videoId: 'wC1tGSw9SE8',
        screenshots: [
          'assets/demos/diarify/diarify-ss1.jpg',
          'assets/demos/diarify/diarify-ss2.jpg',
          'assets/demos/diarify/diarify-ss4.jpg',
        ],
      ),
      
      ProjectModel(
        name: 'Poetry AI',
        shortDescription: 'Published a poetry editor app that is powered by LLMs on the google playstore.',
        longDescription: '''This is a solo app I developed and published in my free time...
—A poetry editor app powered by AI (chatGPT), which gives you recommendations and guides you to enhance your poetry writing skills.
—I used Flutter framework to make the front end of the app, the backend is written using Typescript and is built using firebase cloud functions.
—For the AI part I used the openAI LLM model to generate responses for the user, I used the Langchain framework for prompt engineering.
—All the data is stored on the user's device, nothing is stored in the cloud.''',
        imageUrl: 'assets/demos/poetry-ai.png',
        projectUrl: 'https://play.google.com/store/apps/details?id=com.anujyadav.poetryai&pli=1',
        technologies: ['Flutter', 'OpenAI', 'Typescript', 'Firebase'],
        isVideo: true,
        videoId: '3J-_KV70ZLc',
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
      ),
      
      
      ProjectModel(
        name: 'Poetry Analysis',
        shortDescription: 'A cross-platform project in which user can write up a poem in the editor and analyze the poem through Machine Learning.',
        longDescription: '''Another one of my solo projects, It is a cross-platform project in which user can write up a poem in the editor and analyze the poem through Machine Learning.
—Finds the metre, rhyme scheme and even the poetry type.
—Using the CMUDict (Carnegie Mellon University Dict.) to find the stressed and unstressed syllables of a word.
—Compared them against the common forms using Levenshtein distance.''',
        imageUrl: 'assets/demos/poetry-analysis.png',
        projectUrl: 'https://poetry-analysis.web.app/#/',
        technologies: ['Flutter', 'Python', 'Flask', 'ML'],
        isVideo: true,
        videoId: 'opA6kChWWd0',
        isLandscape: true,
        screenshots: [
          'assets/demos/poetry-analysis/poetry-analysis.png',
          'assets/demos/poetry-analysis/poetry-analysis-ss1.png',
          'assets/demos/poetry-analysis/poetry-analysis-ss2.png',
          'assets/demos/poetry-analysis/poetry-analysis-ss3.png',
          'assets/demos/poetry-analysis/poetry-analysis-ss4.png',
          'assets/demos/poetry-analysis/poetry-analysis-ss5.png',
        ],
      ),
      
      
    ];
  }
}