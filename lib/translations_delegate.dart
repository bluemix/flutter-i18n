import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:i18n_playground/translations.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class TranslationsDelegate
    extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return new SynchronousFuture<Translations>(
        new Translations(locale));
  }

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}