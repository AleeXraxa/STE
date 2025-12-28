import 'package:get/get.dart';
import '../bindings/app_bindings.dart';
import '../views/home/splash_view.dart';
import '../views/home/onboarding_view.dart';
import '../views/home/home_view.dart';
import '../views/mode_selection/mode_selection_view.dart';
import '../views/translator/translator_view.dart';
import '../views/free_talk/free_talk_view.dart';
import '../views/earbud_phone/earbud_phone_view.dart';
import '../views/photo_translation/photo_translation_view.dart';
import '../views/ai_dialogue/ai_dialogue_view.dart';
import '../views/ai_assistant/ai_assistant_view.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String onboarding2 = '/onboarding2';
  static const String home = '/home';
  static const String modeSelection = '/mode_selection';
  static const String translator = '/translator';
  static const String freeTalk = '/free_talk';
  static const String earbudPhone = '/earbud_phone';
  static const String photoTranslation = '/photo_translation';
  static const String aiDialogue = '/ai_dialogue';
  static const String aiAssistant = '/ai-assistant';

  static List<GetPage> pages = [
    GetPage(name: splash, page: () => SplashView()),
    GetPage(
      name: onboarding,
      page: () => OnboardingView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: onboarding2,
      page: () => HomeView(),
      binding: AppBindings(),
    ), // Placeholder for onboarding2
    GetPage(name: home, page: () => HomeView(), binding: AppBindings()),
    GetPage(
      name: modeSelection,
      page: () => ModeSelectionView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: translator,
      page: () => TranslatorView(),
      binding: AppBindings(),
    ),
    GetPage(name: freeTalk, page: () => FreeTalkView(), binding: AppBindings()),
    GetPage(
      name: earbudPhone,
      page: () => EarbudPhoneView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: photoTranslation,
      page: () => PhotoTranslationView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: aiDialogue,
      page: () => AiAssistantView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: aiAssistant,
      page: () => AiAssistantView(),
      binding: AppBindings(),
    ),
  ];
}
