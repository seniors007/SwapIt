class SearchResponse {
  final int? id;
  final String? serviceName;
  final String? serviceDescription;
  final int? servicePrice;
  final String? categoryName;
  final int? totalRate;
  final String? username;
  final dynamic profileImagePath;

  const SearchResponse({
    this.id,
    this.serviceName,
    this.serviceDescription,
    this.servicePrice,
    this.categoryName,
    this.totalRate,
    this.username,
    this.profileImagePath,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        id: json['id'] as int?,
        serviceName: json['serviceName'] as String?,
        serviceDescription: json['serviceDescription'] as String?,
        servicePrice: json['servicePrice'] as int?,
        categoryName: json['categoryName'] as String?,
        totalRate: json['totalRate'] as int?,
        username: json['username'] as String?,
        profileImagePath: json['profileImagePath'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'serviceName': serviceName,
        'serviceDescription': serviceDescription,
        'servicePrice': servicePrice,
        'categoryName': categoryName,
        'totalRate': totalRate,
        'username': username,
        'profileImagePath': profileImagePath,
      };
}
