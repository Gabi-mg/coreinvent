part of 'home_bloc.dart';

enum HomeStatus { initial, success, error, loading }

extension HomeStatusX on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;

  bool get isSuccess => this == HomeStatus.success;

  bool get isError => this == HomeStatus.error;

  bool get isLoading => this == HomeStatus.loading;
}

class HomeState extends Equatable {
  final HomeStatus status;
  final String token;

  const HomeState({
    this.status = HomeStatus.initial,
    this.token = '',
  });

  @override
  List<Object?> get props => [status, token];

  HomeState copyWith({
    HomeStatus? status,
    String? token,
  }) {
    return HomeState(
      status: status ?? this.status,
      token: token ?? this.token,
    );
  }
}
