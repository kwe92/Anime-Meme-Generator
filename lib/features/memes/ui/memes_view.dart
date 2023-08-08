import 'package:anime_meme_generator/app/resources/reuseables.dart';
import 'package:anime_meme_generator/features/memes/models/ani_memes_model.dart';
import 'package:flutter/material.dart';

class MemesView extends StatefulWidget {
  const MemesView({super.key});

  @override
  State<MemesView> createState() => _MemesViewState();
}

class _MemesViewState extends State<MemesView> {
  AniMemesModel? visibleMeme;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AniMemes'),
        ),
        body: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 24.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Meme Title Goes Here!'),
                  gap6,
                  SizedBox(
                    child: Image.network('https://pm1.aminoapps.com/7598/06fd473e24ce1bd4594c6a69f37642ae4b91b04dr1-800-800v2_hq.jpg'),
                  ),
                  gap12,
                  OutlinedButton(
                    // TODO: make button work
                    onPressed: () {},
                    child: const Text('Get Next Meme'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
