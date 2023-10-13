part of 'change_language_bloc.dart';

@immutable
abstract class ChangeLanguageEvent {}

class ChangeLanguageToArabic extends ChangeLanguageEvent {}

class ChangeLanguageToEnglish extends ChangeLanguageEvent {}
