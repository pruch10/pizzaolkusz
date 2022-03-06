import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizzaolkusz/app/home/restaurants/restaurants__page_content.dart';

import 'add_opinion/add_opinion_page_content.dart';
import 'my_account/my_account_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

var currentIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Najlepsza Pizza w Olkuszu'),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const RestaurantPageContent();
        }
        if (currentIndex == 1) {
          return const AddOpinionPageContent();
        }

        return MyAccountPageContent(
          email: widget.user.email,
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
            label: 'opinie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Dodaj',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'moje konto',
          ),
        ],
      ),
    );
  }
}
