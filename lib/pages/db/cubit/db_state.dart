part of 'db_cubit.dart';

@immutable
sealed class DbState {}

final class DbInitial extends DbState {}

final class DbFetching extends DbState {}

final class DbLoaded extends DbState {}
