import 'package:anime_meme_generator/app/resources/reuseables.dart';
import 'package:anime_meme_generator/features/memes/ui/memes_view_model.dart';
import 'package:anime_meme_generator/features/shared/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO: use circular progress indicator instead of text?
// TODO: maybe a loading screen?
// TODO: maybe use the global key instead of passing the BuildContext around?

class MemesView extends StatelessWidget {
  const MemesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AniMemes'),
        ),
        body: FutureBuilder(
          future: aniMemesService.getMeme(context),
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("error"),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              final visibleMeme = context.watch<MemesViewModel>().aniMeme;

              return Center(
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
                        Text(
                          visibleMeme.title,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                        ),
                        gap10,
                        // use ClipRRect to force rounding of child elements
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 500),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            child: Image.network(
                              visibleMeme.imgUrl,
                            ),
                          ),
                        ),

                        gap24,
                        OutlinedButton(
                          onPressed: () async {
                            await aniMemesService.getMeme(context);
                            context.read<MemesViewModel>().refresh();
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text('Get Next Meme'),
                          ),
                        ),
                        gap12
                      ],
                    ),
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ),
      ),
    );
  }
}
