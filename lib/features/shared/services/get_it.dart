import 'package:anime_meme_generator/features/memes/services/memes_service.dart';
import 'package:anime_meme_generator/features/shared/utilities/toast_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

/// Used to access a singleton instance of getit
final locator = GetIt.instance;

void configureDependencies() {
  locator.registerLazySingleton<AniMemesService>(
    () => AniMemesService(),
  );

  locator.registerLazySingleton(
    () => const ToastService(),
  );

  locator.registerLazySingleton(
    () => http.Client(),
  );
}

// parameterized registration

//   - it is better to explicitly pass the parameterized generic type
//     to whatever register you choose to use

 // Lazy Objects

  //   - When an object is marked "Lazy"
  //     it will not be initialized until it is used for the first time
  //     and maybe removed when it is no longer being uttilized
  //   - Lazy objects do not persist unnecessarily