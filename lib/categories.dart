import 'dart:math';
import 'package:flutter/material.dart';
import 'package:abc/dio/api_provider.dart';
import 'package:abc/category_items.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<String> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    try {
      categories = await ApiProvider().getCategories();
    } catch (e) {
      print("Error loading categories: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Color getRandomColor() {
    final random = Random();
    return Colors.primaries[random.nextInt(Colors.primaries.length)].withOpacity(0.2);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:  Scaffold(
    appBar: AppBar(
    title: const Text(
    'Categories',
    style: TextStyle(
    color: Colors.indigo,
    fontSize: 25,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
        body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) => buildCategoryItem(
              category: categories[index],
              context: context,
            ),
          ),
        ),
      ),
    ));
  }

  Widget buildCategoryItem({required String category, required BuildContext context}) {
    String imagePath = 'images/$category.jpg';
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductsPage(category: category),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: getRandomColor(),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Center(
              child: Text(
                category,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
