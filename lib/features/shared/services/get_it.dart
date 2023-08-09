import 'package:anime_meme_generator/features/memes/controllers/ani_meme_controller.dart';
import 'package:anime_meme_generator/features/memes/services/memes_service.dart';
import 'package:anime_meme_generator/features/shared/utilities/toast_service.dart';
import 'package:get_it/get_it.dart';

// Used to access a singleton instance of getit
final locator = GetIt.instance;

void configureDependencies() {
  // Lazy

  //   - When something is marked "Lazy"
  //     it is only called needed necessary and will
  //     be removed when it is no longer being uttilized
  //  - Lazy objects do not persist unnecessarily

  locator.registerLazySingleton<AniMemesService>(
    () => const AniMemesService(),
  );

  locator.registerLazySingleton<AniMemeModelController>(
    () => const AniMemeModelController(),
  );

  locator.registerLazySingleton(
    () => const ToastService(),
  );
}

// parameterized registration

//   - it is better to explicitly pass the parameterized generic type
//     to whatever register you choose to use