import 'package:flutter/material.dart';
import '../../constants.dart';
import 'contact_card.dart'; 


class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liên hệ'),
      ),
      body: Container(
        decoration: backgroundDecoration,
        child: const Column(
          children: [
            ContactCard(
              name: 'Dương Chí Quỳnh',
              id: 'B2014603',
              email: 'quynhb2014603@student.ctu.edu.vn',
            ),
            ContactCard(
              name: 'Trương Trí Ngoan',
              id: 'B2014590',
              email: 'ngoanb2014590@student.ctu.edu.vn',
            ),
          ],
        ),
      ),
    );
  }
}
