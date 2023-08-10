import 'package:anime_meme_generator/features/memes/models/ani_memes_model.dart';
import 'package:anime_meme_generator/features/shared/services/services.dart';
import 'package:flutter/material.dart';

class AniMemeModelController {
  const AniMemeModelController();

  Future<AniMemesModel> getNextMeme(BuildContext context) async => await aniMemesService.getMeme(context);
}
