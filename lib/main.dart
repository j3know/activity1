import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_practice/help.dart';
import 'package:flutter_practice/history.dart';
import 'package:flutter_practice/mail.dart';
import 'package:flutter_practice/peronaldetails.dart';
import 'package:flutter_practice/shares.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Future<void> _showSignOutConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Sign Out"),
          content: const Text("Do you want to sign out?"),
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
                                  'https://i.pinimg.com/564x/b9/e0/e3/b9e0e30ac1ec95077b7e1d0abd250e5d.jpg',
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
                              _showSignOutConfirmationDialog(context);
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
                      leading: const Icon(Icons.person, color: Color.fromARGB(255, 255, 196, 0)),
                      title: const Text('Person Detail', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                      onTap: () {
                        // Navigate to PersonDetailPage on click
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Person()),
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
                      leading: const Icon(Icons.mail, color: Color.fromARGB(255, 255, 196, 0)),
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
                      leading: const Icon(Icons.help, color: Color.fromARGB(255, 255, 196, 0)),
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
                        child: const Text(
                          'Sign Out',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
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
