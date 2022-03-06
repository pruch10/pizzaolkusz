import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

var pizzaName = '';
var restaurantName = '';

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Podaj nazwę pizzy'),
            onChanged: (newValue) {
              setState(() {
                pizzaName = newValue;
              });
            },
          ),
          TextField(
            decoration:
                const InputDecoration(hintText: 'Podaj nazwę restauracji'),
            onChanged: (newValue) {
              setState(() {
                restaurantName = newValue;
              });
            },
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseFirestore.instance.collection('restaurants').add(
                  {'name': restaurantName, 'pizza': pizzaName, 'rating': 3.0});
            },
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }
}
