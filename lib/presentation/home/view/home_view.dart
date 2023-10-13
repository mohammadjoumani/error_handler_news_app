import 'package:error_handler/core/app/app_prefs.dart';
import 'package:error_handler/core/app/di.dart';
import 'package:error_handler/domain/use_case/get_articles_use_case.dart';
import 'package:error_handler/presentation/home/bloc/change_language/change_language_bloc.dart';
import 'package:error_handler/presentation/home/bloc/get_articles/get_articles_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final AppPreferences _appPref = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetArticlesBloc(instance<GetArticlesUseCase>())
          ..add(GetArticlesEvent()),
        lazy: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Home"),
            actions: [
              IconButton(
                  onPressed: () {
                    if(_appPref.isEnglish()) {
                      BlocProvider.of<ChangeLanguageBloc>(context).add(ChangeLanguageToArabic());
                    } else {
                      BlocProvider.of<ChangeLanguageBloc>(context).add(ChangeLanguageToEnglish());
                    }
                    _appPref.changeAppLanguage();
                  },
                  icon: const Icon(Icons.language))
            ],
          ),
          body: HomeViewBody(),
        ));
  }
}