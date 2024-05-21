import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapit/features/profile/presentation/manager/search_cubit/search_cubit.dart';
import 'package:swapit/features/search/presentation/views/widgets/search_page_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchCubit(),
        child: const SearchPageBody(),
      ),
    );
  }
}
