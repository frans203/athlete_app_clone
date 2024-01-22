import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/login/login_cubit.dart';
import 'package:pod1um_flutter_clone/routing/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> removeUser(BuildContext context) async {
  var router = AutoRouter.of(context);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.remove("user");
  router.replace(Login());
  context.read<LoginCubit>().setIsLoading(loginStatus: LoginStatus.INITIAL);
  return;
}
