import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'language/language_bloc/language_bloc.dart';
import 'language/model/language_model.dart';
import 'language_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Map isSelected = {
      Language.greek.text: AppLocalizations.of(context)!.localeName == 'el',
      Language.english.text: AppLocalizations.of(context)!.localeName == 'en',
    };

    void toggleLanguage(String lang) {
      if (isSelected[lang]) return;

      isSelected.forEach((key, value) {
        setState(() {
          isSelected[key] = !value;
        });
      });

      BlocProvider.of<LanguageBloc>(context).add(
        ChangeLanguage(
          selectedLanguage:
              lang == 'Ελληνικά' ? Language.greek : Language.english,
        ),
      );
    }

    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 60,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                            child: Image.asset(
                              AppLocalizations.of(context)!.langIcon,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          BlocBuilder<LanguageBloc, LanguageState>(
                            builder: (context, state) {
                              return Text(
                                '${state.selectedLanguage.text} :',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Divider(),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.textTitle} : ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          BlocBuilder<LanguageBloc, LanguageState>(
                            builder: (context, state) {
                              return Text(
                                AppLocalizations.of(context)!
                                    .textContent(state.selectedLanguage.text),
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    LanguageButton(
                      function: toggleLanguage,
                      context: context,
                      text: Language.greek.text,
                      isActive: isSelected[Language.greek.text],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    LanguageButton(
                      function: toggleLanguage,
                      context: context,
                      text: Language.english.text,
                      isActive: isSelected[Language.english.text],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
