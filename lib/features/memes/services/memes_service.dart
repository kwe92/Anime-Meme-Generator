// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:anime_meme_generator/features/memes/models/ani_memes_model.dart';
import 'package:anime_meme_generator/features/shared/services/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class _FetchError extends Error {
  final String _message;
  _FetchError(this._message);

  @override
  String toString() => _message;
}

// TODO: make a minimum of 5 attemps before throwing
// TODO: Should fail gracefully with try / catch

class AniMemesService {
  const AniMemesService();

  static const _baseUrl = 'https://vast-puce-mite-fez.cyclic.app/animeme';

  Future<AniMemesModel> getMeme(BuildContext context) async {
    final Uri url = Uri.parse(_baseUrl);
    final http.Response response = await http.get(url);

    if (response.statusCode != 200) {
      toastService.showSnackBar(context, message: 'There was an issue fetching the meme. Try again!');
      throw _FetchError('there was an issue getting your data.');
    }

    final Map<String, dynamic> responseBody = jsonDecode(response.body);

    final AniMemesModel meme = AniMemesModel.fromJSON(responseBody);

    return meme;
  }
}
