import 'package:flutter/material.dart';
import 'package:flutter_practice/main.dart';

class JobEntry {
  final String position;
  final String company;
  final String duration;

  JobEntry({
    required this.position,
    required this.company,
    required this.duration,
  });
}

class History extends StatelessWidget {
  final List<JobEntry> jobHistory = [
    JobEntry(position: "Software Developer", company: "ABC Corp", duration: "2018 - 2021"),
    JobEntry(position: "Mobile App Developer", company: "XYZ Tech", duration: "2016 - 2018"),
    JobEntry(position: "Web Developer", company: "Tech Solutions", duration: "2014 - 2016"),
    JobEntry(position: "Software Engineer", company: "Innovate Inc.", duration: "2012 - 2014"),
    JobEntry(position: "Frontend Developer", company: "Web Designs Ltd.", duration: "2010 - 2012"),
    JobEntry(position: "Junior Developer", company: "Coding Co.", duration: "2008 - 2010"),
    JobEntry(position: "Intern Developer", company: "Tech Innovators", duration: "2007 - 2008"),
    JobEntry(position: "Assistant Programmer", company: "Programming Solutions", duration: "2005 - 2007"),
    JobEntry(position: "IT Support Specialist", company: "Tech Support Inc.", duration: "2003 - 2005"),
    JobEntry(position: "Systems Analyst", company: "Data Systems Ltd.", duration: "2001 - 2003"),
    // Add more job entries as needed
  ];

   History({Key? key}) : super(key: key);

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
        title: const Text('History', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Job History',
              style: TextStyle(color: Colors.white, fontSize: 30,fontFamily:'corp'),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: jobHistory.length,
                itemBuilder: (context, index) {
                  final job = jobHistory[index];
                  return ListTile(
                    title: Text(job.position,style: const TextStyle(color: Color.fromARGB(255, 255, 255, 0),fontWeight: FontWeight.bold,fontSize: 20),),
                    subtitle: Text('${job.company} (${job.duration})',style: const TextStyle(color: Color.fromARGB(255, 221, 221, 221))),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
