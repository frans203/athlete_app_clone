import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/repositories/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;
  LoginCubit({required this.loginRepository}) : super(LoginState.initial());

  Future<void> singIn({required String email, required String password}) async {
    emit(state.copyWith(status: LoginStatus.LOADING));
    try {
      final user =
          await loginRepository.login(email: email, password: password);
      emit(state.copyWith(user: user, status: LoginStatus.LOADING));
    } catch (error) {
      print(error);
      emit(state.copyWith(status: LoginStatus.ERROR));
    }
  }

  void setIsLoading({LoginStatus? loginStatus}) {
    emit(state.copyWith(status: loginStatus));
  }

  void setUser({dynamic user}) {
    emit(state.copyWith(user: user));
  }

  void removeUser() {
    emit(state.copyWith(user: null, status: LoginStatus.INITIAL));
  }
}
