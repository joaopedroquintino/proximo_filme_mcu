part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {}

class HomeSuccess extends HomeState {
  HomeSuccess({
    required this.proximoFilme,
  });
  final ProximoFilmeEntity proximoFilme;
}
