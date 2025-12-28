import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../controllers/onboarding_controller.dart';
import '../controllers/translator_controller.dart';
import '../controllers/free_talk_controller.dart';
import '../controllers/earbud_phone_controller.dart';
import '../controllers/photo_translation_controller.dart';
import '../controllers/ai_dialogue_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<OnboardingController>(() => OnboardingController());
    Get.lazyPut<TranslatorController>(() => TranslatorController());
    Get.lazyPut<FreeTalkController>(() => FreeTalkController());
    Get.lazyPut<EarbudPhoneController>(() => EarbudPhoneController());
    Get.lazyPut<PhotoTranslationController>(() => PhotoTranslationController());
    Get.lazyPut<AiDialogueController>(() => AiDialogueController());
  }
}
