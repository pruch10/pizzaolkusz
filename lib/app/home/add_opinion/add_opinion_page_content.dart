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
var rating = 3.0;

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
          Slider(
            value: rating,
            onChanged: (newValue) {
              setState(() {
                rating = newValue;
              });
            },
            min: 0,
            max: 5.0,
            divisions: 10,
            label: rating.toString(),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () async {
              await FirebaseFirestore.instance.collection('restaurants').add({
                'name': restaurantName,
                'pizza': pizzaName,
                'rating': rating,
              });
            },
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }
}
