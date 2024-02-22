# flutter_practice

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



<!-- Yes, the code meets the specified requirements:

ListView with Builder Constructor: The UserListScreen widget uses a ListView.builder to efficiently build a scrolling list of users.

Retrieve List of USERS from URL: The fetchUsers function uses an HTTP GET request to retrieve the list of users from the specified URL ('https://jsonplaceholder.typicode.com/users').

Each List Element Displays the Name of the User: In the ListView.builder within UserListScreen, each list item displays the name of the user along with other details.

Details Page for Tapped User: When a user is tapped, the code navigates to the UserDetailsScreen page, displaying detailed information about the selected user. The information is passed from the previous page (UserListScreen) to UserDetailsScreen.

Details Page Does Not Call an API: The UserDetailsScreen does not make a new API call. Instead, it uses the information passed to it through the constructor.

Back Button to Go Back to Users List: Both the UserListScreen and UserDetailsScreen have a back button (IconButton) that allows the user to navigate back to the previous screen. In UserDetailsScreen, the back button is implemented using Navigator.of(context).pop().

Overall, the code structure aligns with the specified requirements for creating an app with a user list, details page, and proper navigation. -->