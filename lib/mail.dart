import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home:  Mail(),
    );
  }
}

class Mail extends StatelessWidget {
   Mail({Key? key}) : super(key: key);

  final List<Map<String, String>> emailList = [
    {
      'sender': 'user1@example.com',
      'subject': 'Meeting tomorrow',
      'body': 'Hello, let\'s meet tomorrow at 2 PM.'
    },
    {
      'sender': 'user2@example.com',
      'subject': 'Project update',
      'body': 'The project is progressing well. Here\'s a quick update.'
    },
    {
      'sender': 'user3@example.com',
      'subject': 'Important announcement',
      'body': 'We have an important announcement to make. Please read below.'
    },
    {
      'sender': 'user4@example.com',
      'subject': 'Request for feedback',
      'body': 'We value your opinion. Please provide feedback on the latest features.'
    },
    {
      'sender': 'user5@example.com',
      'subject': 'Reminder: Deadline approaching',
      'body': 'Just a friendly reminder that the deadline is approaching. Please complete your tasks on time.'
    },
    {
      'sender': 'user6@example.com',
      'subject': 'Invitation to a webinar',
      'body': 'You are invited to our upcoming webinar on the latest industry trends.'
    },
    {
      'sender': 'user7@example.com',
      'subject': 'Job opportunity',
      'body': 'Exciting job opportunity available in our company. Apply now!'
    },
    {
      'sender': 'user8@example.com',
      'subject': 'Weekly report',
      'body': 'Attached is the weekly progress report. Please review and provide feedback.'
    },
    {
      'sender': 'user9@example.com',
      'subject': 'Holiday greetings',
      'body': 'Wishing you and your family a joyful holiday season.'
    },
    {
      'sender': 'user10@example.com',
      'subject': 'New product launch',
      'body': 'We are thrilled to announce the launch of our latest product. Check it out!'
    },
  ];

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
        title: const Text(
          'Mail',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: emailList.length,
          itemBuilder: (context, index) {
            final email = emailList[index];
            return Column(
              children: [
                ListTile(
                  title: Text(email['subject'] ?? '',
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    '${email['sender']} - ${email['body']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Handle email selection
                  },
                ),
                const Divider(
                  height: 0.1,
                  color: Color.fromARGB(255, 157, 157, 157),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
