part of 'anime_preview_cubit.dart';

@immutable
sealed class AnimePreviewState {}

final class AnimePreviewInitial extends AnimePreviewState {}

final class AnimePreviewLoading extends AnimePreviewState {
  List<Object> get props => [];
}

final class AnimePreviewLoaded extends AnimePreviewState {
  final List<MediaDataModel>? medias;
  AnimePreviewLoaded({
    this.medias,
  });
  List<Object?> get props => [medias];
}

final class AnimePreviewError extends AnimePreviewState {
  final String? message;
  AnimePreviewError({
    this.message,
  });
  List<Object?> get props => [message];
}
