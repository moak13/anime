import 'package:anime/app/app.dart';
import 'package:anime/data_model/data_model.dart';
import 'package:anime/data_model/media_data_model.dart';
import 'package:anime/exceptions/anime_exception.dart';
import 'package:anime/services/graphql_service.dart';
import 'package:anime/utils/fixtures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'anime_preview_state.dart';

class AnimePreviewCubit extends Cubit<AnimePreviewState> {
  final _graphqlService = locator.get<GraphQlService>();
  AnimePreviewCubit() : super(AnimePreviewInitial());

  Future<void> fetchAnimes() async {
    try {
      emit(AnimePreviewLoading());
      final json = await _graphqlService.performQuery(
        query: Fixtures.fetchAllAnimes,
      );

      final response = AnimeDataModel.fromJson(json);
      emit(AnimePreviewLoaded(
        medias: response.page?.medias,
      ));
    } on AnimeException catch (e) {
      emit(AnimePreviewError(
        message: e.message,
      ));
    } catch (e) {
      emit(AnimePreviewError(
        message: 'Something went wrong',
      ));
    }
  }
}
