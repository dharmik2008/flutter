import 'package:flutter/material.dart';

class ContactListPage extends StatelessWidget {
  ContactListPage({super.key});
  final List<Map<String, String>> contacts = [
    {'name': 'Dharmik', 'initial': 'D'},
    {'name': 'Nirav', 'initial': 'N'},
    {'name': 'Heet', 'initial': 'H'},
    {'name': 'Shivam', 'initial': 'S'},
    {'name': 'Devanshu', 'initial': 'D'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact List')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          var contact = contacts[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(contact['initial']!),
              ),
              title: Text(contact['name']!),
              trailing: Icon(Icons.person),
            ),
          );
        },
      ),
    );
  }
}