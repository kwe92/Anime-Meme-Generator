import 'package:anime_meme_generator/features/memes/models/ani_memes_model.dart';
import 'package:anime_meme_generator/features/memes/services/memes_service.dart';
import 'package:anime_meme_generator/features/shared/services/get_it.dart';
import 'package:flutter/material.dart';

class AniMemeModelController {
  const AniMemeModelController();

  Future<AniMemesModel> getNextMeme(BuildContext context) async => await locator<AniMemesService>().getMeme(context);
}
