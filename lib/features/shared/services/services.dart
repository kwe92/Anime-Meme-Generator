import 'package:anime_meme_generator/features/memes/controllers/ani_meme_controller.dart';
import 'package:anime_meme_generator/features/memes/services/memes_service.dart';
import 'package:anime_meme_generator/features/shared/services/get_it.dart';
import 'package:anime_meme_generator/features/shared/utilities/toast_service.dart';

get toastService => locator.get<ToastService>();

get aniMemesService => locator.get<AniMemesService>();

get aniMemeModelController => locator.get<AniMemeModelController>();
