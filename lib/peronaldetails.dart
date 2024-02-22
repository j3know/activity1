import 'package:activity1/main.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Person(),
    );
  }
}

class Person extends StatelessWidget {
  const Person({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 1, 102),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 1, 102),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Main()),
            );
          },
        ),
        title: const Text('Personal Details', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Adding the image
            Center(
              child: SizedBox(
                child: Image.network(
                  'https://scontent.xx.fbcdn.net/v/t1.15752-9/423036602_913236663623690_1306220833665919715_n.png?stp=dst-png_p206x206&_nc_cat=111&ccb=1-7&_nc_sid=510075&_nc_ohc=-uvhysfEunAAX9pjxo8&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AdSonjGXfJbvxcqzAT-JUEQxDruISBTwgmKu-7VPEiC7MA&oe=65FDF572',
                  fit: BoxFit.fitHeight,
                  errorBuilder: (context, error, stackTrace) => const Text('Image not available'),
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 20),
            // Displaying details using a custom widget
            const DetailItem(label: 'Name', value: 'Geno Anthony M. Tombiga'),
            const DetailItem(label: 'Age', value: '24'),
            const DetailItem(label: 'Occupation', value: 'Software Developer'),
            const DetailItem(label: 'Location', value: '11 Jasmin St, Lapu-Lapu City, Cebu, Philippines'),
            const DetailItem(label: 'Email', value: 'Anthonymanagase17@gmail.com'),
            const DetailItem(label: 'Phone', value: '+63 906-675-3449'),
            const DetailItem(label: 'Interests', value: 'Flutter, Mobile Development'),
            const DetailItem(
                label: 'Education', value: 'Bachelor\'s in Information Technology'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final String label;
  final String value;

  const DetailItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label:',
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 196, 0),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Transform.translate(
          offset: const Offset(1, -3), // Adjust the offset as needed
          child: Text(
            '| $value',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 1),
      ],
    );
  }
}