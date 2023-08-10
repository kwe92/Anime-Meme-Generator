// ignore_for_file: prefer_final_fields

import 'package:anime_meme_generator/features/memes/models/ani_memes_model.dart';
import 'package:anime_meme_generator/features/shared/services/services.dart';
import 'package:flutter/material.dart';

class MemesViewModel extends ChangeNotifier {
  AniMemesModel? _aniMeme;

  AniMemesModel? get aniMeme => _aniMeme;

  Future<void> getMeme(BuildContext context) async {
    _aniMeme = await aniMemeModelController.getNextMeme(context);
    notifyListeners();
  }
}
