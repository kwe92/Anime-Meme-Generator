import 'package:anime_meme_generator/app/themes/styles/colors.dart';
import 'package:anime_meme_generator/features/memes/ui/memes_view.dart';
import 'package:anime_meme_generator/features/shared/utilities/images.dart';
import 'package:flutter/material.dart';

// TODO: Finish implementation of error screen
class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(Images.error1),
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CenteredText(
                text: "The page you requested could not be found.",
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ErrorButton(),
              SizedBox(
                height: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CenteredText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  const CenteredText({
    required this.text,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ErrorButton extends StatelessWidget {
  const ErrorButton({super.key});

  @override
  Widget build(BuildContext context) => CustomButton(
      onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const MemesView(),
          )),
      text: "Try Again",
      textStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ));
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSecondary;
  final TextStyle? textStyle;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.isSecondary = false,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height / 14,
        child: OutlinedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith(
              (states) => const StadiumBorder(
                side: BorderSide.none,
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => AppColors.secondary,
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      );
}
