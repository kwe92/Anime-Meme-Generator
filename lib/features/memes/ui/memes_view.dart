import 'package:anime_meme_generator/app/resources/reuseables.dart';
import 'package:anime_meme_generator/features/memes/controllers/ani_meme_controller.dart';
import 'package:anime_meme_generator/features/memes/models/ani_memes_model.dart';
import 'package:anime_meme_generator/features/shared/services/get_it.dart';
import 'package:flutter/material.dart';

// TODO: use circular progress indicator instead of text
// TODO: maybe a loading screen?
// TODO: show user some information if there is a failure | snackbar popup on failure?
// TODO: turn into a stateless widget and use provider / change notifier
// TODO: Figure out how to not have so many if statements, there has to be a better way

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
                  if (visibleMeme != null) gap6,
                  if (visibleMeme != null)
                    // use ClipRRect to force rounding of child elements
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      child: Image.network(
                        visibleMeme!.imgUrl,
                      ),
                    ),
                  if (visibleMeme == null)
                    const FittedBox(
                      child: Text('There is not a meme loaded yet'),
                    ),
                  gap12,
                  OutlinedButton(
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
