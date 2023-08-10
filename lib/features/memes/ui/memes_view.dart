import 'package:anime_meme_generator/app/resources/reuseables.dart';
import 'package:anime_meme_generator/features/memes/models/ani_memes_model.dart';
import 'package:anime_meme_generator/features/shared/services/services.dart';
import 'package:flutter/material.dart';

// TODO: use circular progress indicator instead of text
// TODO: maybe a loading screen?
// TODO: turn into a stateless widget and use provider / change notifier
// TODO: Figure out how to not have so many if statements, there has to be a better way
// TODO: maybe use the global key instead of passing the BuildContext around?

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
                    Text(
                      visibleMeme!.title,
                      textAlign: TextAlign.center,
                    ),
                  if (visibleMeme != null) gap10,
                  if (visibleMeme != null)
                    // use ClipRRect to force rounding of child elements
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 500),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: Image.network(
                          visibleMeme!.imgUrl,
                        ),
                      ),
                    ),
                  if (visibleMeme == null)
                    const FittedBox(
                      child: Text('There is not a meme loaded yet'),
                    ),
                  gap12,
                  OutlinedButton(
                    onPressed: () async {
                      final AniMemesModel aniMeme = await aniMemeModelController.getNextMeme(context);

                      setState(() {
                        visibleMeme = aniMeme;
                      });
                    },
                    child: const Text('Get Next Meme'),
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
