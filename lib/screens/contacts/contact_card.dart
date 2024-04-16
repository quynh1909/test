import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String id;
  final String email;

  const ContactCard({
    required this.name,
    required this.id,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(id),
            Text(email),
          ],
        ),
      ),
    );
  }
}
