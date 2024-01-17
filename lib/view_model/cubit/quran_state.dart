part of 'quran_cubit.dart';

@immutable
sealed class QuranState {}

final class QuranInitial extends QuranState {}

final class QuranLoading extends QuranInitial {}

final class QuranLoaded extends QuranInitial {
  List<QuranModel> quranResult;

  QuranLoaded({required this.quranResult});
}

final class QuranError extends QuranInitial {}
