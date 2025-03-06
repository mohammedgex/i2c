import 'package:flutter/material.dart';

class GLobalErrorPage extends StatelessWidget {
  const GLobalErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Something went wrong'),
          ],
        ),
    ));
  }
}