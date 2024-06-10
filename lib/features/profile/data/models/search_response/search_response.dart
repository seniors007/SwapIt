class SearchResponse {
  final int? id;
  final String? serviceName;
  final String? serviceDescription;
  final int? servicePrice;
  final String? categoryName;
  final int? totalRate;
  final String? username;
  final dynamic profileImagePath;
  final String? notes;
  final String? feedback;
  final int? serviceRequestId;
  final int? serviceProviderId;
  final dynamic requestImage;
  final String? userImage;

  const SearchResponse({
    this.id,
    this.serviceName,
    this.serviceDescription,
    this.servicePrice,
    this.categoryName,
    this.totalRate,
    this.username,
    this.profileImagePath,
    this.notes,
    this.feedback,
    this.serviceRequestId,
    this.serviceProviderId,
    this.requestImage,
    this.userImage,
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
        notes: json['notes'] as String?,
        feedback: json['feedback'] as String?,
        serviceRequestId: json['serviceRequestId'] as int?,
        serviceProviderId: json['serviceProviderId'] as int?,
        requestImage: json['requestImage'] as dynamic,
        userImage: json['userImage'] as String?,
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
        'notes': notes,
        'feedback': feedback,
        'serviceRequestId': serviceRequestId,
        'serviceProviderId': serviceProviderId,
        'requestImage': requestImage,
        'userImage': userImage,
      };
}
