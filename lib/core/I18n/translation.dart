import 'package:get/get.dart';
import 'package:whats_app_clone/core/I18n/en.dart';
import 'package:whats_app_clone/core/I18n/fa.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnglishLanguage().keys,
        'fa': PersianLanguage().keys,
      };
}

abstract class AppTranslationKeys {
  Map<String, String> get keys;
}
