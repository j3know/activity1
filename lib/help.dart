import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void _openHelpScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Help()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.help),
            onPressed: () {
              _openHelpScreen(context);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 1, 102),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 1, 102),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Help', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
       HelpTopic(title: 'Understanding My Strengths', description: 'Discover and leverage your unique strengths for personal growth.'),
HelpTopic(title: 'Navigating Social Situations', description: 'Tips and insights on effectively engaging in social interactions.'),
HelpTopic(title: 'Emotional Intelligence Mastery', description: 'Developing emotional intelligence for better self-awareness and relationship building.'),
HelpTopic(title: 'Mindfulness Practices', description: 'Incorporate mindfulness into your daily routine for enhanced well-being.'),
HelpTopic(title: 'Building Resilience', description: 'Strategies to bounce back from setbacks and navigate challenges with resilience.'),
HelpTopic(title: 'Effective Communication Skills', description: 'Enhance your communication abilities for better understanding and connection.'),
HelpTopic(title: 'Personality Types Demystified', description: 'Explore various personality types and understand their characteristics.'),
HelpTopic(title: 'Setting Boundaries', description: 'Learn the importance of setting healthy boundaries for personal and professional relationships.'),
HelpTopic(title: 'Time Management Techniques', description: 'Optimize your time to maximize productivity and work-life balance.'),
HelpTopic(title: 'Exploring Hobbies for Self-Discovery', description: 'Discovering new hobbies to enhance personal fulfillment and self-discovery.'),
HelpTopic(title: 'Goal Setting Strategies', description: 'Effective methods for setting and achieving meaningful personal and professional goals.'),
HelpTopic(title: 'Coping with Stress', description: 'Strategies to manage and alleviate stress in various aspects of life.'),
HelpTopic(title: 'Understanding Personal Values', description: 'Identifying and aligning your actions with your core values for a more fulfilling life.'),
HelpTopic(title: 'Leadership Qualities in Everyday Life', description: 'Incorporating leadership qualities into daily activities for personal development.'),
HelpTopic(title: 'Cultivating a Growth Mindset', description: 'Embrace a growth mindset for continuous learning and improvement.'),
HelpTopic(title: 'Building Positive Habits', description: 'Tips on forming and maintaining positive habits for personal development.'),
HelpTopic(title: 'Enhancing Creativity', description: 'Unlocking your creative potential through various techniques and exercises.'),
HelpTopic(title: 'Balancing Work and Personal Life', description: 'Strategies for maintaining a healthy balance between professional and personal responsibilities.'),
HelpTopic(title: 'Conflict Resolution Skills', description: 'Developing skills to navigate and resolve conflicts in various settings.'),
HelpTopic(title: 'Financial Wellness', description: 'Tips for managing finances and achieving financial well-being for peace of mind.'),


          ],
        ),
      ),
    );
  }
}

class HelpTopic extends StatelessWidget {
  final String title;
  final String description;

  const HelpTopic({required this.title, required this.description, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }
}
