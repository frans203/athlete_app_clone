import 'package:auto_route/auto_route.dart';
import 'package:pod1um_flutter_clone/helper_functions/user/get_user.dart';
import 'package:pod1um_flutter_clone/routing/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    dynamic user = await getUser();
    if (user != null) {
      resolver.next(true);
    } else {
      resolver.redirect(Login());
    }
  }
}
