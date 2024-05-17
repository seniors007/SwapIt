import 'package:swapit/features/profile/data/models/search_response/search_response.dart';

class SearchResponseContainer {
  final List<SearchResponse> results;

  SearchResponseContainer({required this.results});

  factory SearchResponseContainer.fromJson(List<dynamic> json) {
    List<SearchResponse> results =
        json.map((e) => SearchResponse.fromJson(e)).toList();
    return SearchResponseContainer(results: results);
  }

  List<dynamic> toJson() => results.map((e) => e.toJson()).toList();
}
