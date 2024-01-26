import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/login/login_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/user/user_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_hero_section/listing_page_hero_action.dart';

class ListingPageSave extends StatefulWidget {
  const ListingPageSave({super.key});

  @override
  State<ListingPageSave> createState() => _ListingPageSaveState();
}

class _ListingPageSaveState extends State<ListingPageSave> {
  @override
  Widget build(BuildContext context) {
    if (context.read<LoginCubit>().state.user != null) {
      String token = context.read<LoginCubit>().state.user['token'];

      int listingId =
          context.read<SingleListingCubit>().state.currentListing['id'];

      return FutureBuilder(
        future: context
            .read<UserCubit>()
            .isSavedWhishlist(listingId: listingId, token: token),
        builder: (context, snapshot) => BlocBuilder<UserCubit, UserState>(
          builder: (context, userState) {
            if (userState.saveWishlistBtnStatus ==
                SaveWishlistBtnStatus.LOADED) {
              return ListingPageHeroAction(
                  action: () {
                    if (userState.isSavedWhishlist) {
                      context
                          .read<UserCubit>()
                          .unSaveWhishlist(listingId: listingId, token: token);
                    }
                    if (!userState.isSavedWhishlist) {
                      context
                          .read<UserCubit>()
                          .saveWhishlist(listingId: listingId, token: token);
                    }
                  },
                  color: Color(0xffB9C3FF),
                  iconData: userState.isSavedWhishlist
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  text: userState.isSavedWhishlist ? "Unsave" : "Save");
            }

            return Container();
          },
        ),
      );
    }
    return Container();
  }
}
