import 'package:anime_meme_generator/app/themes/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ToastService {
  const ToastService();
  void showSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(
          message,
          style: baseTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
