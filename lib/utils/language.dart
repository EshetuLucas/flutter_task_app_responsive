import 'package:get/get.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'tasks': 'Tasks',
          'projects': 'Projects',
          'teams': 'Teams',
          'language': 'Language',
          'arabic': 'Arabic',
          'english': 'English',
          'description': 'Description',
        },
        'ar_AE': {
          'tasks': 'مهام',
          'projects': 'المشاريع',
          'teams': 'فرق',
          'language': 'لغة',
          'arabic': 'إنجليزي',
          'english': 'English',
          'description': 'وصف',
        }
      };
}
