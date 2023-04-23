part of 'home_bloc.dart';


abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class TokenFetched extends HomeEvent {
  const TokenFetched();

  @override
  List<Object?> get props => [];
}
