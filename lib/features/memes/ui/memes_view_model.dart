// ignore_for_file: prefer_final_fields

import 'package:anime_meme_generator/features/memes/models/ani_memes_model.dart';
import 'package:anime_meme_generator/features/shared/services/services.dart';
import 'package:flutter/material.dart';

class MemesViewModel extends ChangeNotifier {
  AniMemesModel _aniMeme = aniMemesService.meme;

  AniMemesModel get aniMeme => _aniMeme;

  void refresh() async {
    debugPrint("\nfrom refresh: ${aniMemesService.meme}");
    _aniMeme = aniMemesService.meme;
    notifyListeners();
  }
}
