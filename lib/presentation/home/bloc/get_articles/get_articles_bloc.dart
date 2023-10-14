import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:error_handler/data/model/dto/response/article_response_dto.dart';
import 'package:error_handler/domain/use_case/get_articles_use_case.dart';
import 'package:meta/meta.dart';

part 'get_articles_event.dart';

part 'get_articles_state.dart';

class GetArticlesBloc extends Bloc<GetArticlesEvent, GetArticlesState> {
  final GetArticlesUseCase _getArticlesUseCase;

  GetArticlesBloc(this._getArticlesUseCase) : super(GetArticlesInitial()) {
    on<GetArticlesEvent>((event, emit) async {
      emit(GetArticlesLoading());
      final result = await _getArticlesUseCase.execute(unit);
      result.fold((l) => emit(GetArticlesFailure(l.message)),
          (r) => emit(GetArticlesSuccess(r)));
    });
  }
}
