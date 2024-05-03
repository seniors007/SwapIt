import 'package:flutter/material.dart';
import 'package:swapit/features/search/presentation/views/widgets/search_page_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchPageBody(),
    );
  }
}
