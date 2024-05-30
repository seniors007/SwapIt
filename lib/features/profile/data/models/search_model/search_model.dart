class SearchModel {
  final String serviceName;
  final int servicePrice;
  final int serviceProviderId;
  final int categoryId;
  final int userId;

  SearchModel({
    required this.serviceName,
    required this.servicePrice,
    required this.serviceProviderId,
    required this.categoryId,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'serviceName': serviceName,
      'servicePrice': servicePrice,
      'serviceProviderId': serviceProviderId,
      'categoryId': categoryId,
      'userId': userId,
    };
  }
}
