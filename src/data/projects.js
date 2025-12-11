export const projects = [
    {
        name: 'Swift Speak',
        shortDescription: 'AI-powered voice-to-text productivity tool with style and customizations.',
        longDescription: `An advanced voice-to-speech productivity tool designed to enhance communication speed and accuracy. Swift Speak goes beyond simple transcription by integrating AI to adapt to your personal style and workflow.
—Personal Dictionary: Manage a custom vocabulary to ensure accurate recognition of names, jargon, and unique terms.
—Smart Snippets: Create voice shortcuts that expand into full text (e.g., say "email" -> inserts your email signature), saving time on repetitive typing.
—Style Customization: Tailor the tone of your text, giving you control over how your voice is presented.
—Seamless Integration: Operates as an intuitive overlay and keyboard connector, working across personal messengers and work apps.`,
        imageUrl: '/demos/swift-speak/swift-speak-main.png',
        projectUrl: 'https://github.com/anujyadav140/swift_speak',
        technologies: ['Flutter', 'Android Native', 'Gemini AI', 'Firebase'],
        videoId: '1IMsgJWu8gM',
        isLandscape: false,
        screenshots: [
            '/demos/swift-speak/swift-speak-chat.jpg',
            '/demos/swift-speak/swift-speak-style.jpg',
            '/demos/swift-speak/swift-speak-snippets.jpg',
            '/demos/swift-speak/swift-speak-dict.jpg',
            '/demos/swift-speak/swift-speak-gemini.jpg',
            '/demos/swift-speak/swift-speak-languages.jpg',
            '/demos/swift-speak/swift-speak-overlay.jpg',
            '/demos/swift-speak/swift-speak-stats.jpg',
            '/demos/swift-speak/swift-speak-event.png',
        ],
    },
    {
        name: 'Nike Case Study - AI Features',
        shortDescription: 'Reimagining the Nike app with AI-driven sustainability and engagement.',
        longDescription: `This project addresses the "Closing the Loop" challenge to improve the sustainability of Nike as a business.
A comprehensive update to the Nike App leveraging AI to drive sustainability and deeper user engagement.
—Run, Return & Recycle: Tracks the lifecycle of your shoes (e.g., Pegasus 41). Log your runs to hit the 300-mile mark, unlocking an "Eco benefit" for your next purchase while guiding you to recycle the old pair. tracking progress towards a sustainable future.
—AI Shoe Snap: Utilizing Gemini AI and computer vision to instantly identify your shoe model and assess its condition, ensuring it qualifies for the recycling program with a simple photo.
—Smart Route Generation: Integrated Google Maps API to create dynamic, personalized running paths based on your location and distance goals, encouraging you to explore while you close the loop.`,
        imageUrl: '/demos/nike-case-study/nike-tile.png',
        projectUrl: 'https://github.com/anujyadav140/nike_try_it',
        caseStudyUrl: 'https://drive.google.com/file/d/120q3kARMZqcujQ_dYMb-MhtALMIhB4tU/view?usp=sharing',
        technologies: ['Flutter', 'Firebase', 'Gemini AI', 'Google Maps API', 'Next.js'],
        videoId: 'EDO85Rocti8',
        isLandscape: false,
        screenshots: [
            '/demos/nike-case-study/nike-main.png',
            '/demos/nike-case-study/nike-recycle.png',
            '/demos/nike-case-study/nike-snap.png',
            '/demos/nike-case-study/nike-map.png',
        ],
    },
    {
        name: 'Beemo',
        shortDescription: 'AI-powered equitable task division for roommates.',
        longDescription: `Beemo reimagines household harmony by intelligently orchestrating task distribution among roommates. Leveraging the power of Gemini AI, it analyzes chore complexity and user availability to ensure an equitable and conflict-free living environment.
—Intelligent task arbitration using Gemini AI to prevent disputes.
—Real-time synchronization and management built on Flutter and Firebase.
—A modern, intuitive interface that brings transparency to household contributions.`,
        imageUrl: '/demos/beemo/beemo-tile.png',
        projectUrl: 'https://github.com/anujyadav140/beemo',
        technologies: ['Flutter', 'Firebase', 'Next.js', 'Gemini AI'],
        videoId: '',
        isLandscape: false,
        screenshots: [
            '/demos/beemo/beemo-ss4.jpg',
            '/demos/beemo/beemo-ss1.jpg',
            '/demos/beemo/beemo-ss2.jpg',
            '/demos/beemo/beemo-ss3.jpg',
            '/demos/beemo/beemo-ss5.jpg',
            '/demos/beemo/beemo-ss6.jpg',
            '/demos/beemo/beemo-ss7.jpg',
            '/demos/beemo/beemo-ss8.jpg',
        ],
    },
    {
        name: 'Mono Moments',
        shortDescription: 'AI itinerary builder.',
        longDescription: `An AI-powered itinerary builder that helps you plan your trips with ease.
—Group planning with real-time collaboration
—Voting system for recommended places
—AI-generated itinerary suggestions
—Seamless trip coordination`,
        imageUrl: '/demos/mono-moments-tile.png',
        projectUrl: 'https://github.com/anujyadav140/mono',
        caseStudyUrl: 'https://drive.google.com/file/d/1Zxsedkf2tZyrkq4BXjQP_D_5aGzA9Gv2/view?usp=sharing',
        technologies: ['Flutter', 'Dart', 'Google Generative AI', 'Firebase'],
        videoId: 'ecpIJp2QiKI',
        isLandscape: false,
        screenshots: [
            '/demos/mono-moments.png',
            '/demos/mono-moments-ss1.jpg',
            '/demos/mono-moments-ss2.jpg',
            '/demos/mono-moments-ss3.jpg',
            '/demos/mono-moments-ss4.jpg',
            '/demos/mono-moments-ss5.jpg',
        ],
    },
    {
        name: 'Diarify',
        shortDescription: 'AI-powered diary app with voice entries and chat.',
        longDescription: `This is a solo app I am developing in my free time...
—The user can chat with their previous diary entries going back as long as there is user's diary entries available.
—Uses Pinecone vector database to store all the vector data for easy data retrieval.
—A Diary app powered by LLMs, maintaining a diary can be tedious for some people, this app makes it easier to keep a diary; user just has to record themselves while speaking about anything, the app will transcribe it and the AI will rewrite it in any style you want.
—After a diary entry is generated, the App gives each diary entry "Emotion Tags" to track the well being of the user.`,
        imageUrl: '/demos/diarify.png',
        projectUrl: 'https://github.com/anujyadav140/Diary-AI',
        technologies: ['Flutter', 'OpenAI', 'Langchain', 'Firebase', 'Pinecone'],
        videoId: 'wC1tGSw9SE8',
        isLandscape: false,
        screenshots: [
            '/demos/diarify/diarify-ss1.jpg',
            '/demos/diarify/diarify-ss2.jpg',
            '/demos/diarify/diarify-ss3.jpg',
            '/demos/diarify/diarify-ss4.jpg',
            '/demos/diarify/diarify-ss5.jpg',
        ],
    },
    {
        name: 'Poetry AI',
        shortDescription: 'Published poetry editor app powered by LLMs.',
        longDescription: `This is a solo app I developed and published in my free time...
—A poetry editor app powered by AI (chatGPT), which gives you recommendations and guides you to enhance your poetry writing skills.
—I used Flutter framework to make the front end of the app, the backend is written using Typescript and is built using firebase cloud functions.
—For the AI part I used the openAI LLM model to generate responses for the user, I used the Langchain framework for prompt engineering.
—All the data is stored on the user's device, nothing is stored in the cloud.`,
        imageUrl: '/demos/poetry-ai.png',
        projectUrl: 'https://play.google.com/store/apps/details?id=com.anujyadav.poetryai&pli=1',
        technologies: ['Flutter', 'OpenAI', 'Typescript', 'Firebase'],
        videoId: '3J-_KV70ZLc',
        isLandscape: false,
        screenshots: [
            '/demos/poetryai/poetry-ai-ss1.png',
            '/demos/poetryai/poetry-ai-ss2.png',
            '/demos/poetryai/poetry-ai-ss3.png',
            '/demos/poetryai/poetry-ai-ss4.png',
            '/demos/poetryai/poetry-ai-ss5.png',
            '/demos/poetryai/poetry-ai-ss6.png',
            '/demos/poetryai/poetry-ai-ss7.png',
            '/demos/poetryai/poetry-ai-ss8.png',
            '/demos/poetryai/poetry-ai-ss9.png',
        ],
    },
    {
        name: 'Poetry Analysis',
        shortDescription: 'ML-based poem analyzer for metre and rhyme.',
        longDescription: `Another one of my solo projects, It is a cross-platform project in which user can write up a poem in the editor and analyze the poem through Machine Learning.
—Finds the metre, rhyme scheme and even the poetry type.
—Using the CMUDict (Carnegie Mellon University Dict.) to find the stressed and unstressed syllables of a word.
—Compared them against the common forms using Levenshtein distance.`,
        imageUrl: '/demos/poetry-analysis.png',
        projectUrl: 'https://poetry-analysis.web.app/#/',
        technologies: ['Flutter', 'Python', 'Flask', 'ML'],
        videoId: 'opA6kChWWd0',
        isLandscape: true,
        screenshots: [
            '/demos/poetry-analysis/poetry-analysis.png',
            '/demos/poetry-analysis/poetry-analysis-ss1.png',
            '/demos/poetry-analysis/poetry-analysis-ss2.png',
            '/demos/poetry-analysis/poetry-analysis-ss3.png',
            '/demos/poetry-analysis/poetry-analysis-ss4.png',
            '/demos/poetry-analysis/poetry-analysis-ss5.png',
        ],
    },
];
