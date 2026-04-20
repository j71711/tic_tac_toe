// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Tic Tac Toe';

  @override
  String get player_x => 'Player 1';

  @override
  String get player_o => 'Player 2';

  @override
  String get vs => 'VS';

  @override
  String player_wins(Object player) {
    return 'Player $player Wins!';
  }

  @override
  String get play_again => 'Play Again';

  @override
  String get your_turn => 'Your Turn';

  @override
  String get hello => 'Hello!';
}
