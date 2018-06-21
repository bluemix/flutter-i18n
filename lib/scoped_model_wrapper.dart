import 'package:flutter/material.dart';
import 'package:i18n_playground/main.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopeModelWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(model: AppModel(), child: I18nDemo());
  }
}

class AppModel extends Model {
  static const Locale arLocale = Locale('ar');
  static const Locale enLocale = Locale('en');

  Locale _appLocale = arLocale;
  Locale get appLocal => _appLocale ?? arLocale;

  List<Locale> get supportedLocales => [
                enLocale,
                arLocale,
              ];

  void chagneLanguge() {
    if (_appLocale == arLocale) {
      _appLocale = enLocale;
    } else {
      _appLocale = arLocale;
    }
    notifyListeners();
  }
}
