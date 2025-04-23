import 'package:csen268_s25/model/user.dart';
import 'package:csen268_s25/repositories/authentication/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authenticationRepository) : super(LoginInitial());
  User? user;

  final AuthenticationRepository authenticationRepository;

  void init() async {}

  void reset() {
    user == null;
    emit(LoginInitial());
  }

  void error() {
    emit(LoginError(errorText: "Some unknown error."));
  }

  void loginUser({required String email, required String password}) async {
    emit(LoginWaiting());
    user = await authenticationRepository.signIn(
      email: email,
      password: password,
    );
    emit(LoggedIn());
  }
}
