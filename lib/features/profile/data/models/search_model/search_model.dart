class SearchModel {
  final String serviceName;
  final int servicePrice;
  final int serviceProviderId;
  final int categoryId;

  SearchModel({
    required this.serviceName,
    required this.servicePrice,
    required this.serviceProviderId,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'serviceName': serviceName,
      'servicePrice': servicePrice,
      'serviceProviderId': serviceProviderId,
      'categoryId': categoryId,
    };
  }
}
