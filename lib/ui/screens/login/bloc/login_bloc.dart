import 'package:bloc/bloc.dart';
import 'package:coreinvent/domain/model/login.dart';
import 'package:coreinvent/domain/usecase/login_usecase.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase _loginUsecase;

  LoginBloc(this._loginUsecase) : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<AuthenticationChanged>(_onLogin);
  }

  void _onLogin(
    AuthenticationChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));

    final result = await _loginUsecase.login(state.email, state.password);

    await result.when(
      failure: (error) {
        emit(state.copyWith(status: LoginStatus.error));
      },
      success: (login) async{
        await _loginUsecase.setToken(login.token);
        emit(
          state.copyWith(status: LoginStatus.success, login: login),
        );
      },
    );
  }

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        status: LoginStatus.data,
        email: event.email,
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        status: LoginStatus.data,
        password: event.password,
      ),
    );
  }
}
