import 'dart:io';

import 'package:activity1/act_API.dart';
import 'package:activity1/help.dart';
import 'package:activity1/history.dart';
import 'package:activity1/mail.dart';
import 'package:activity1/peronaldetails.dart';
import 'package:activity1/shares.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

Future<void> _showSignOutConfirmationDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Warning!"),
        content: const Text("Are you sure you want to see my post on Facebook?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () async {
              // Close the dialog
              Navigator.of(context).pop();

              // Launch the Facebook link
              const facebookLink = "https://www.facebook.com/NouGie24/"; // Replace with your Facebook link
             try {
  if (await canLaunch(facebookLink)) {
    await launch(facebookLink);
  } else {
    throw 'Could not launch $facebookLink';
  }
} catch (e) {
  print('Error launching Facebook link: $e');
  // Handle the error or display a user-friendly message
}
            },
            child: const Text("Yes"),
          ),
        ],
      );
    },
  );
}
   Future<void> _showSignOutConfirmationDialogs(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Log Out"),
          content: const Text("Do you want to Log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                // Close the app when "Yes" is pressed
                exit(0);
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 1, 102),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Column
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        // Image in the center
                        Center(
                          child: Container(
                            width: 180.0,
                            height: 180.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://scontent.xx.fbcdn.net/v/t1.15752-9/423036602_913236663623690_1306220833665919715_n.png?stp=dst-png_p206x206&_nc_cat=111&ccb=1-7&_nc_sid=510075&_nc_ohc=-uvhysfEunAAX9pjxo8&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AdSonjGXfJbvxcqzAT-JUEQxDruISBTwgmKu-7VPEiC7MA&oe=65FDF572',
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Close button in the top-right corner
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: const Icon(Icons.logout_rounded, color: Colors.white),
                            onPressed: () {
                              _showSignOutConfirmationDialogs(context);
                            },
                          ),
                        ),
                      ],
                    ),

                    const Expanded(
                      child: OverflowBox(
                        maxWidth: double.infinity, // Adjust the maximum width as needed
                        maxHeight: double.infinity, // Adjust the maximum height as needed
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Geno Anthony',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 255, 196, 0),
                                          fontSize: 40.0,
                                          fontFamily: 'corp', // Use the font family specified in pubspec.yaml
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Employee Name',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Second Column
              // Second Column
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person_2_outlined, color: Color.fromARGB(255, 255, 196, 0)),
                      title: const Text('Person Detail', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                      onTap: () {
                        // Navigate to PersonDetailPage on click
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>   const Person()),
                        );
                      },
                    ),
                    const Divider(height: 0.1), // Add Divider here
                    ListTile(
                      leading: const Icon(Icons.phone_android_outlined, color: Color.fromARGB(255, 255, 196, 0)),
                      title: const Text('Contact', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                      onTap: () {
                        // Navigate to PersonDetailPage on click
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  const API()),
                        );
                      },
                    ),
                    const Divider(height: 0.1), // Add Divider here
                    ListTile(
                      leading: const Icon(Icons.history, color: Color.fromARGB(255, 255, 196, 0)),
                      title: const Text('History', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                      onTap: () {
                        // Navigate to PersonDetailPage on click
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => History()),
                        );
                      },
                    ),
                    const Divider(height: 0.1),
                    ListTile(
                      leading: const Icon(Icons.mail_lock_outlined , color: Color.fromARGB(255, 255, 196, 0)),
                      title: const Text('Mail', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                      onTap: () {
                        // Navigate to PersonDetailPage on click
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Mail()),
                        );
                      },
                    ),
                    const Divider(height: 0.1),
                    ListTile(
                      leading: const Icon(Icons.share, color: Color.fromARGB(255, 255, 196, 0)),
                      title: const Text('Shares', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                      onTap: () {
                        // Navigate to PersonDetailPage on click
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Shared()),
                        );
                      },
                    ),
                    const Divider(height: 0.1),
                    ListTile(
                      leading: const Icon(Icons.help_center_outlined, color: Color.fromARGB(255, 255, 196, 0)),
                      title: const Text('Help', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                      onTap: () {
                        // Navigate to PersonDetailPage on click
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  const Help()),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Third Column
           Expanded(
  flex: -1,
  child: Center(
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            _showSignOutConfirmationDialog(context);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, // Circle background color
                ),
                padding: const EdgeInsets.all(2.0), // Adjust padding as needed
                child: const Icon(
                  Icons.facebook,
                  color: Color.fromARGB(255, 30, 1, 102),// Icon color
                  size: 30.0, // Icon size
                ),
              ),
              const SizedBox(width: 8.0), // Adjust the width for spacing
              const Text(
                'See My Post on Facebook',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
),

            ],
          ),
        ),
      ),
    );
  }
}
