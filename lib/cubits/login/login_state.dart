part of 'login_cubit.dart';

enum LoginStatus {
  INITIAL,
  LOADING,
  ERROR,
}

class LoginState extends Equatable {
  LoginStatus status;
  dynamic user;
  LoginState({required this.status, required this.user});
  factory LoginState.initial() {
    return LoginState(
      status: LoginStatus.INITIAL,
      user: null,
    );
  }

  List<Object?> get props => [status, user];

  LoginState copyWith({LoginStatus? status, Object? user}) {
    return LoginState(
        status: status ?? this.status, user: user != null ? user : null);
  }

  @override
  String toString() {
    return 'LoginState{status: $status}';
  }
}
