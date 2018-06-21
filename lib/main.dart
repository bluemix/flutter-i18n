import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_playground/scoped_model_wrapper.dart';
import 'package:i18n_playground/translations.dart';
import 'package:i18n_playground/translations_delegate.dart';
import 'package:scoped_model/scoped_model.dart';

class I18nDemoBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(Translations.of(context).title),
      ),
      body: new Center(
        child: ScopedModelDescendant<AppModel>(
            builder: (context, child, model) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: new Text(Translations.of(context).message,
                          style: new TextStyle(
                            fontSize: 18.0,
                          )),
                    ),
                    RaisedButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        model.chagneLanguge();
                      },
                      child: new Text(
                        Translations.of(context).changeLanguage,
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )),
      ),
    );
  }
}

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => new MaterialApp(
              onGenerateTitle: (BuildContext context) =>
                  Translations.of(context).title,
              localizationsDelegates: [
                const TranslationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              locale: model.appLocal,
              supportedLocales: model.supportedLocales,
              home: new I18nDemoBody(),
            ));
  }
}

void main() {
  runApp(new ScopeModelWrapper());
}
