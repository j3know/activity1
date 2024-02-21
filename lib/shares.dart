import 'package:flutter/material.dart';
import 'package:flutter_practice/main.dart';

class SharedDocument {
  final String name;
  final String owner;
  final DateTime date;

  SharedDocument({
    required this.name,
    required this.owner,
    required this.date,
  });
}

class Shared extends StatelessWidget {
   Shared({Key? key}) : super(key: key);

  final List<SharedDocument> sharedDocuments = [
    SharedDocument(name: 'Document 1', owner: 'User A', date: DateTime.now()),
    SharedDocument(name: 'Document 2', owner: 'User B', date: DateTime.now()),
    SharedDocument(name: 'Document 3', owner: 'User C', date: DateTime.now()),
    SharedDocument(name: 'Document 4', owner: 'User D', date: DateTime.now()),
    SharedDocument(name: 'Document 5', owner: 'User E', date: DateTime.now()),
    SharedDocument(name: 'Document 6', owner: 'User F', date: DateTime.now()),
    SharedDocument(name: 'Document 7', owner: 'User G', date: DateTime.now()),
    SharedDocument(name: 'Document 8', owner: 'User H', date: DateTime.now()),
    SharedDocument(name: 'Document 9', owner: 'User I', date: DateTime.now()),
    SharedDocument(name: 'Document 10', owner: 'User J', date: DateTime.now()),
    SharedDocument(name: 'Document 11', owner: 'User A', date: DateTime.now()),
    SharedDocument(name: 'Document 12', owner: 'User B', date: DateTime.now()),
    SharedDocument(name: 'Document 13', owner: 'User C', date: DateTime.now()),
    SharedDocument(name: 'Document 14', owner: 'User D', date: DateTime.now()),
    SharedDocument(name: 'Document 15', owner: 'User E', date: DateTime.now()),
    SharedDocument(name: 'Document 16', owner: 'User F', date: DateTime.now()),
    SharedDocument(name: 'Document 17', owner: 'User G', date: DateTime.now()),
    SharedDocument(name: 'Document 18', owner: 'User H', date: DateTime.now()),
    SharedDocument(name: 'Document 19', owner: 'User I', date: DateTime.now()),
    SharedDocument(name: 'Document 20', owner: 'User J', date: DateTime.now()),
    SharedDocument(name: 'Document 21', owner: 'User A', date: DateTime.now()),
    SharedDocument(name: 'Document 22', owner: 'User B', date: DateTime.now()),
    SharedDocument(name: 'Document 23', owner: 'User C', date: DateTime.now()),
    SharedDocument(name: 'Document 24', owner: 'User D', date: DateTime.now()),
    SharedDocument(name: 'Document 25', owner: 'User E', date: DateTime.now()),
    SharedDocument(name: 'Document 26', owner: 'User F', date: DateTime.now()),
    SharedDocument(name: 'Document 27', owner: 'User G', date: DateTime.now()),
    SharedDocument(name: 'Document 28', owner: 'User H', date: DateTime.now()),
    SharedDocument(name: 'Document 29', owner: 'User I', date: DateTime.now()),
    SharedDocument(name: 'Document 30', owner: 'User J', date: DateTime.now())
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
        title: const Text('Shares', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: sharedDocuments.length * 2 - 1,
          itemBuilder: (context, index) {
            if (index.isOdd) {
              return const Divider(
                height: 0.1,
                color: Color.fromARGB(255, 157, 157, 157),
              );
            }
        
            final documentIndex = index ~/ 2;
            final document = sharedDocuments[documentIndex];
        
            return ListTile(
              title: Text(document.name, style: const TextStyle(color: Colors.white)),
              subtitle: Text('Owner: ${document.owner}, Date: ${document.date}', style: const TextStyle(color: Colors.white)),
              // Add other ListTile properties as needed
            );
          },
        ),
      ),
    );
  }
}
