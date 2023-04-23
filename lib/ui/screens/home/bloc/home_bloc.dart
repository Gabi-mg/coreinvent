import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coreinvent/domain/usecase/login_usecase.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LoginUsecase _loginUsecase;

  HomeBloc(this._loginUsecase) : super(const HomeState()) {
    on<TokenFetched>(_onGetToken);
  }

  void _onGetToken(
    TokenFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    final result = await _loginUsecase.getToken();

    await result.when(
      failure: (error) {
        emit(state.copyWith(status: HomeStatus.error));
      },
      success: (token) async {
        emit(
          state.copyWith(status: HomeStatus.success, token: token),
        );
      },
    );
  }

}
