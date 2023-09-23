import 'package:anime_meme_generator/features/memes/services/memes_service.dart';
import 'package:anime_meme_generator/features/shared/services/get_it.dart';
import 'package:anime_meme_generator/features/shared/utilities/toast_service.dart';
import 'package:http/http.dart' as http;

ToastService get toastService => locator.get<ToastService>();

AniMemesService get aniMemesService => locator.get<AniMemesService>();

http.Client get client => locator.get<http.Client>();

// Retrieving Registered Singletons

// - use the GetIt.get method of your instantiated GetIt instance
//   to retrieve or create an instance of a registered type <T>
// - instead of instantiating the object you call its method
//   through your locator