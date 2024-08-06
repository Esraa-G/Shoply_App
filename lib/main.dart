import 'package:flutter/material.dart';
import 'package:abc/category_items.dart';
import 'package:abc/login.dart';
import 'package:abc/register.dart';
import 'package:abc/logo.dart';
import 'package:abc/onboarding.dart';
import 'package:abc/aboutapp.dart';
import 'package:abc/aboutme.dart';
import 'package:abc/cart.dart';
import 'package:abc/dio/api_provider.dart';
import 'package:abc/home.dart';
import 'package:abc/profile.dart';
import 'package:abc/categories.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.yellow,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.indigo,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Logo(),
    );
  }
}

class MainPage extends StatefulWidget {
  final String userId;

  const MainPage({super.key, required this.userId});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const HomePage(userId: '1',),
          const CategoriesPage(),
          CartPage(userId: widget.userId),
          ProfilePage(userId: widget.userId),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
