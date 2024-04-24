import 'package:flutter/material.dart';
import 'package:swapit/features/search/presentation/views/widgets/search_page_body.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  static String id = 'SearchPage';

  @override
  State<SearchPage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchPageBody(),
    );
  }
}
