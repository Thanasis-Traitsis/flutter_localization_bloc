import 'dart:ui';

enum Language {
  english(
    Locale('en', 'US'),
    'English',
  ),
  greek(
    Locale('el', 'EL'),
    'Ελληνικά',
  );

  const Language(
    this.value,
    this.text,
  );

  final Locale value;
  final String text;
}
