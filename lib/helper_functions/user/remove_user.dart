import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/login/login_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> removeUser(BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.remove("user");
  Navigator.pushNamed(context, '/login');
  context.read<LoginCubit>().setIsLoading(loginStatus: LoginStatus.INITIAL);
  return;
}
