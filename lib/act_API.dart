// Import necessary libraries
import 'dart:convert';

import 'package:activity1/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Define the Geo class for geographical coordinates
class Geo {
  final String lat;
  final String lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}

// Define the Address class
class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: Geo.fromJson(json['geo']),
    );
  }
}

// Define the Company class
class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}

// Define the User class
class User {
  final int id;
  final String name;
  final String email;
  final String username;
  final String phone;
  final String website;
  final Address address;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      phone: json['phone'],
      website: json['website'],
      address: Address.fromJson(json['address']),
      company: Company.fromJson(json['company']),
    );
  }
}

// Define the main API widget
class API extends StatelessWidget {
  const API({super.key});

  @override
  Widget build(BuildContext context) {
    // Return a MaterialApp with UserListScreen as the home
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User List App',
      home: UserListScreen(),
    );
  }
}

// Define the UserListScreen widget
class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  // Declare a Future to hold the list of users
  late Future<List<User>> users;

  @override
  void initState() {
    super.initState();
    // Initialize the Future by calling the fetchUsers function
    users = fetchUsers();
  }

  // Asynchronous function to fetch users from a web API
  Future<List<User>> fetchUsers() async {
    // Make an HTTP GET request to retrieve user data
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    // Check if the response status code is 200 (OK)
    if (response.statusCode == 200) {
      // Decode the response body from JSON and map it to a list of User objects
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      // If the response status code is not 200, throw an exception
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 30, 1, 102),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            // Navigate to Main screen when the back button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  const Main()),
            );
          },
        ),
        title: const Text(
          'My Contact',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 30, 1, 102),
        child: FutureBuilder<List<User>>(
          future: users,
          builder: (context, snapshot) {
            // Check the connection state of the Future
            if (snapshot.connectionState == ConnectionState.waiting) {
              // If the Future is still waiting for data, show a CircularProgressIndicator
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // If there's an error in fetching data, display an error message
              return Text('Error: ${snapshot.error}');
            } else {
              // If data is successfully fetched, display a ListView of users
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  // Create a user card for each user in the list
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              backgroundColor: const Color.fromARGB(255, 255, 196, 0),
                              radius: 30,
                              child: Text(
                                snapshot.data![index].name.isNotEmpty
                                    ? snapshot.data![index].name[0].toUpperCase()
                                    : '',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 30, 1, 102),
                                  fontFamily: 'corp',
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                snapshot.data![index].name,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 196, 0),
                                  fontFamily: 'corp',
                                  fontSize: 20
                                ),
                              ),
                              onTap: () {
                                // Navigate to UserDetailsScreen when a user is tapped
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UserDetailsScreen(user: snapshot.data![index]),
                                  ),
                                );
                              },
                              subtitle: Text(
                                snapshot.data![index].email,
                                style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 227, 227, 227)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

// Define the UserDetailsScreen widget
class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 30, 1, 102),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Contact Details',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 30, 1, 102),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 255, 196, 0),
                  radius: 90,
                  child: Text(
                    user.name.isNotEmpty ? user.name[0].toUpperCase() : '',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 30, 1, 102),
                      fontFamily: 'corp',
                      fontSize: 120,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              SizedBox(
                
                height: 500,
                child: ListView(
                  
                  padding: const EdgeInsets.all(20),
                  
                  children: [
                    // Display various details of the selected user
                    buildDetailItem('Name', user.name, Icons.person_2_outlined),
                    const Divider(),
                    buildDetailItem('Email', user.email, Icons.email_outlined),
                    const Divider(),
                    buildDetailItem('Username', user.username, Icons.verified_user_outlined),
                    const Divider(),
                    buildDetailItem('Phone', user.phone, Icons.phone_outlined),
                    const Divider(),
                    buildDetailItem('Website', user.website, Icons.web),
                    const Divider(),
                    buildDetailItem(
                      'Address',
                      '${user.address.street}, ${user.address.suite}, ${user.address.city}, ${user.address.zipcode}',
                      Icons.location_on_outlined,
                    ),
                    const Divider(),
                    buildDetailItem(
                      'Geo',
                      '${user.address.geo.lat}, ${user.address.geo.lng}',
                      Icons.map_outlined,
                    ),
                    const Divider(),
                    buildDetailItem(
                      'Company',
                      '${user.company.name}, ${user.company.catchPhrase}, ${user.company.bs}',
                      Icons.business,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build a row with an icon, label, and value
  Widget buildDetailItem(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color.fromARGB(255, 255, 196, 0),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 196, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Define the DetailItem widget for displaying individual details
class DetailItem extends StatelessWidget {
  final String label;
  final String value;

  const DetailItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
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
          const SizedBox(width: 5), // Add some spacing between label and value
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: const Offset(1, -3), // Adjust the offset as needed
                  child: Text(
                    '| $value',
                    textAlign: TextAlign.left, // Align the value text
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
