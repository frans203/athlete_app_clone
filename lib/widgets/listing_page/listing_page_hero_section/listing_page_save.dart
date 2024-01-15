import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/login/login_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_hero_section/listing_page_hero_action.dart';

class ListingPageSave extends StatefulWidget {
  const ListingPageSave({super.key});

  @override
  State<ListingPageSave> createState() => _ListingPageSaveState();
}

class _ListingPageSaveState extends State<ListingPageSave> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) => state.user != null
          ? ListingPageHeroAction(
              color: Color(0xffB9C3FF),
              iconData: Icons.bookmark_border,
              text: "Save")
          : Container(),
    );
  }
}
