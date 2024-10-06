import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/src/core/network/api_exception.dart';
import 'package:flutter_practice/src/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_practice/src/features/auth/domain/use_cases/login_use_case.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      await _mapEventToState(event, emit);
    });
  }

  Future _mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginUsernameChanged) {
      emit(state.copyWith(username: event.username));
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWith(password: event.password));
    } else if (event is LoginSubmitted) {
      emit(state.copyWith(loginStateStatus: LoginStateStatus.loading));
      final response = await loginUseCase.execute(
        username: state.username,
        password: state.password,
      );

      response.fold(
        (ApiException error) {
          print(error.message);
          emit(state.copyWith(
            loginStateStatus: LoginStateStatus.failed,
            loginFailedMessage: error.message,
          ));
        },
        (UserEntity entity) {
          emit(state.copyWith(loginStateStatus: LoginStateStatus.success));
        },
      );
    }
  }
}
