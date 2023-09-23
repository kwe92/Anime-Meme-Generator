// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:anime_meme_generator/features/memes/models/ani_memes_model.dart';
import 'package:anime_meme_generator/features/shared/services/api_service.dart';
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

class AniMemesService extends ApiService {
  AniMemesService();

  @override
  String get host => "https://vast-puce-mite-fez.cyclic.app";

  @override
  Map<String, String> get headers => {HttpHeaders.contentTypeHeader: "application/json"};

  late AniMemesModel meme;

  final _endpoint = "/animeme";

  Future<AniMemesModel> getMeme(BuildContext context) async {
    final http.Response response = await get(
      _endpoint,
    );

    if (response.statusCode != 200) {
      toastService.showSnackBar(context, message: 'There was an issue fetching the meme. Try again!');
      throw _FetchError('there was an issue getting your data.');
    }

    final Map<String, dynamic> responseBody = jsonDecode(response.body);

    meme = AniMemesModel.fromJSON(responseBody);

    return meme;
  }
}
