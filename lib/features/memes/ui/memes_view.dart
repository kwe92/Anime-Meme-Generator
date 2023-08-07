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
      ),
    );
  }
}
