import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  final String userId;

  const ProfilePage({super.key, required this.userId});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/users/${widget.userId}'));
    if (response.statusCode == 200) {
      setState(() {
        userData = json.decode(response.body);
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(
              color: Colors.indigo,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : userData == null
            ? const Center(child: Text('No user data available'))
            : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  userData!['image'] ?? 'https://www.freeiconspng.com/uploads/no-image-icon-11.PNG',
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.yellow.withOpacity(0.4),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonalDataPage(userData: userData!),
                        ),
                      );
                    },
                    child: const Text('Personal Data', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18)),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.yellow.withOpacity(0.4),
                    ),
                    onPressed: () {

                    },
                    child: const Text('Security', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18)),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.yellow.withOpacity(0.4),
                    ),
                    onPressed: () {

                    },
                    child: const Text('Privacy', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18)),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.yellow.withOpacity(0.4),
                    ),
                    onPressed: () {

                    },
                    child: const Text('Logout', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18)),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.yellow.withOpacity(0.4),
                    ),
                    onPressed: () {

                    },
                    child: const Text('Terms and Conditions', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalDataPage extends StatelessWidget {
  final Map<String, dynamic> userData;

  const PersonalDataPage({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'Personal Data',
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  userData['image'] ?? 'https://www.freeiconspng.com/uploads/no-image-icon-11.PNG',
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Name: ${userData['firstName']} ${userData['lastName']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 8),
            Text(
              'Username: ${userData['username']}',
              style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: ${userData['email']}',
              style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
            ),
            const SizedBox(height: 8),
            Text(
              'Gender: ${userData['gender']}',
              style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
            ),
            const SizedBox(height: 8),
            Text(
              'Age: ${userData['age']}',
              style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
            ),
            const SizedBox(height: 8),
            Text(
              'Phone: ${userData['phone']}',
              style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
            ),
            const SizedBox(height: 8),
            Text(
              'Date of Birth: ${userData['birthDate'] ?? 'Not available'}',
              style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
            ),
          ],
        ),
      ),
    );
  }
}
