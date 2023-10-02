import 'package:anime_meme_generator/app/resources/reuseables.dart';
import 'package:anime_meme_generator/features/error/ui/error_view.dart';
import 'package:anime_meme_generator/features/memes/ui/memes_view_model.dart';
import 'package:anime_meme_generator/features/shared/services/services.dart';
import 'package:anime_meme_generator/features/splash/ui/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO: use circular progress indicator instead of text?
// TODO: maybe use the global key instead of passing the BuildContext around?

class MemesView extends StatelessWidget {
  const MemesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: aniMemesService.getMeme(context),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return const ErrorView();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashView();
          } else if (snapshot.hasData) {
            final visibleMeme = context.watch<MemesViewModel>().aniMeme;

            return Scaffold(
              appBar: AppBar(
                title: const Text('AniMemes'),
              ),
              body: Center(
                child: Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
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
                          constraints: const BoxConstraints(
                            maxHeight: 500,
                          ),
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
                        MainButton(
                          onPressed: () async {
                            await aniMemesService.getMeme(context);
                            context.read<MemesViewModel>().refresh();
                          },
                          text: 'Get Next Meme',
                        ),
                        gap12,
                      ],
                    ),
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
    );
  }
}

class MainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const MainButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(text),
        ),
      ),
    );
  }
}

// TODO: work on neumorphic button

// class MainButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String text;
//   const MainButton({
//     required this.onPressed,
//     required this.text,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       decoration: const BoxDecoration(
//           color: AppColors.secondary,
//           borderRadius: BorderRadius.all(
//             Radius.circular(50),
//           ),
//           boxShadow: [
//             BoxShadow(
//               offset: Offset(-4, 0),
//               color: Colors.white,
//               blurRadius: 4,
//               spreadRadius: 4,
//             ),
//             BoxShadow(
//               offset: Offset(4, 0),
//               color: AppColors.secondary,
//               blurRadius: 4,
//               spreadRadius: 4,
//             ),
//           ]),
//       child: OutlinedButton(
//         onPressed: onPressed,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16.0),
//           child: Text(text),
//         ),
//       ),
//     );
//   }
// }
