import 'package:error_handler/presentation/home/bloc/get_articles/get_articles_bloc.dart';
import 'package:error_handler/presentation/home/view/widgets/item_article.dart';
import 'package:error_handler/presentation/util/widgets/generic_failure_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetArticlesBloc, GetArticlesState>(
      builder: (context, state) {
        if (state is GetArticlesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetArticlesSuccess) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ItemArticle(article: state.articles[index]);
            },
            itemCount: state.articles.length,
          );
        } else if (state is GetArticlesFailure) {
          return Center(
            child: GenericFailureMessage(
              message: state.message,
              onPress: () {
                BlocProvider.of<GetArticlesBloc>(context)
                    .add(GetArticlesEvent());
              },
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
