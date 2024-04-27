import 'package:flutter/material.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/features/search/presentation/views/widgets/custom_group_button.dart';
import 'package:swapit/features/search/presentation/views/widgets/custom_title.dart';
import 'package:swapit/features/search/presentation/views/widgets/search_bar.dart';
import 'package:swapit/features/search/presentation/views/widgets/service_post_in_search.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchBar(),
          kDivider,
          CustomTitle(),
          CustomGroupButton(),
          SizedBox(
            height: 5,
          ),
          ServicePostInSearch(),
        ],
      ),
    );
  }
}
