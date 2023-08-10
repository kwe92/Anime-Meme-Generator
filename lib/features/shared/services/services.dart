import 'package:anime_meme_generator/features/memes/controllers/ani_meme_controller.dart';
import 'package:anime_meme_generator/features/memes/services/memes_service.dart';
import 'package:anime_meme_generator/features/shared/services/get_it.dart';
import 'package:anime_meme_generator/features/shared/utilities/toast_service.dart';

// TODO: refactor notes

// - from the list of registered objects pass
//   the one you want to access as a parameterized type
//   to your GetIt instance
// - instead of instantiating the object you call its method
//   through your locator

ToastService get toastService => locator.get<ToastService>();

AniMemesService get aniMemesService => locator.get<AniMemesService>();

AniMemeModelController get aniMemeModelController => locator.get<AniMemeModelController>();
