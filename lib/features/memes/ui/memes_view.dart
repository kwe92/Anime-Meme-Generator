import 'package:anime_meme_generator/app/resources/reuseables.dart';
import 'package:anime_meme_generator/features/memes/controllers/ani_meme_controller.dart';
import 'package:anime_meme_generator/features/memes/models/ani_memes_model.dart';
import 'package:anime_meme_generator/features/shared/services/get_it.dart';
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
                  if (visibleMeme != null)
                    FittedBox(
                      child: Text(visibleMeme!.title),
                    ),
                  if (visibleMeme != null) gap6,
                  if (visibleMeme != null)
                    SizedBox(
                      child: Image.network(visibleMeme!.imgUrl),
                    ),
                  if (visibleMeme == null)
                    const FittedBox(
                      child: Text('There is not a meme loaded yet'),
                    ),
                  gap12,
                  OutlinedButton(
                    // TODO: make button work
                    onPressed: () async {
                      // - from the list of registered objects pass
                      //   the one you want to access as a parameterized type
                      //   to your GetIt instance
                      // - instead of instantiating the object you call its method
                      //   through your locator
                      final AniMemesModel aniMeme = await locator<AniMemeModelController>().getNextMeme();

                      setState(() {
                        visibleMeme = aniMeme;
                      });
                    },
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
