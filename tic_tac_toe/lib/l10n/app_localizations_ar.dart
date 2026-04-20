// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get title => 'إكس-أو';

  @override
  String get player_x => 'اللاعب 1';

  @override
  String get player_o => 'اللاعب 2';

  @override
  String get vs => 'ضد';

  @override
  String player_wins(Object player) {
    return 'فاز اللاعب $player!';
  }

  @override
  String get play_again => 'العب مرة أخرى';

  @override
  String get your_turn => 'دورك';

  @override
  String get hello => 'مرحبا!';
}
