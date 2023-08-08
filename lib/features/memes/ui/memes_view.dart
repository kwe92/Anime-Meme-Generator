import 'package:flutter/material.dart';

class MemesView extends StatelessWidget {
  const MemesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AniMemes'),
        ),
        body: const Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                children: [
                  Text(''),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
