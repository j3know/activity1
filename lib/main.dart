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
      home: Scaffold(
        
  backgroundColor: const Color.fromARGB(255, 0, 46, 98),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
              //  const SizedBox(
              //   height: 100,
              //   width: 100,
              //   child: Placeholder()),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Align( alignment: Alignment.topRight,child: Icon(Icons.close,color:Color.fromARGB(255, 255, 255, 255))),
              ),
              const CircleAvatar(radius: 90.0,backgroundImage:NetworkImage('https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-600nw-1714666150.jpg'),),
               const Text(
                'Chris Montgonery',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,color: Color.fromARGB(255, 187, 193, 2),
                ),
              ),
              const Text('New York' ,style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 255, 255, 255)),),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {},
                       leading: const Icon(Icons.person_3_outlined,color: Color.fromARGB(255, 226, 234, 0)),
                        title: const Text('User Details',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 255, 255, 255)),), 
                      ),
                         const Divider( 
                                height: 1, 
                                color: Color.fromARGB(255, 211, 211, 211), 
                                thickness: 1, 
                                 
                              ),
                           ListTile(
                             onTap: () {},
                       leading: const Icon(Icons.history_rounded,color: Color.fromARGB(255, 226, 234, 0)),
                        title: const Text('History',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 255, 255, 255)),), 
                      ),
                         const Divider( 
                                height: 1, 
                                color: Color.fromARGB(255, 211, 211, 211), 
                                thickness: 1, 
                                 
                              ),  
                                 ListTile(
                                   onTap: () {},
                       leading: const Icon(Icons.book_online_rounded,color: Color.fromARGB(255, 226, 234, 0)),
                        title: const Text('Booking Details',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 255, 255, 255)),), 
                      ),
                         const Divider( 
                                height: 1, 
                                color: Color.fromARGB(255, 211, 211, 211), 
                                thickness: 1, 
                                 
                              ),    
                               ListTile(
                                 onTap: () {},
                       leading: const Icon(Icons.mail_outline_rounded,color: Color.fromARGB(255, 226, 234, 0)),
                        title: const Text('Contact Us',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 255, 255, 255)),), 
                      ),
                         const Divider( 
                                height: 1, 
                                color: Color.fromARGB(255, 211, 211, 211), 
                                thickness: 1, 
                                 
                              ),    
                               ListTile(
                                 onTap: () {},
                       leading: const Icon(Icons.share,color: Color.fromARGB(255, 226, 234, 0)),
                        title: const Text('Share This App',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 255, 255, 255)),), 
                      ),
                         const Divider( 
                                height: 1, 
                                color: Color.fromARGB(255, 211, 211, 211), 
                                thickness: 1, 
                                 
                              ),    
                               ListTile(
                                 onTap: () {},
                       leading: const Icon(Icons.help_outline_rounded,color: Color.fromARGB(255, 226, 234, 0)),
                        title: const Text('Help',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 255, 255, 255)),), 
                      ),
                      // Add more ListTiles as needed
                    ],
                  ),
                ),
              ),
               const Padding(
                
                 padding: EdgeInsets.all(15.0),
                 child: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255),
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
