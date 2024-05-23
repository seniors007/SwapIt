import 'package:equatable/equatable.dart';

class FinishedRequestModel extends Equatable {
  final int id;
  final String serviceName;
  final String serviceDescription;
  final int servicePrice;
  final String categoryName;
  final int totalRate;
  final String username;
  final String? profileImagePath;
  final String notes;
  final int serviceRequestId;

  const FinishedRequestModel({
    required this.id,
    required this.serviceName,
    required this.serviceDescription,
    required this.servicePrice,
    required this.categoryName,
    required this.totalRate,
    required this.username,
    this.profileImagePath,
    required this.notes,
    required this.serviceRequestId,
  });

  factory FinishedRequestModel.fromJson(Map<String, dynamic> json) {
    return FinishedRequestModel(
      id: json['id'],
      serviceName: json['serviceName'],
      serviceDescription: json['serviceDescription'],
      servicePrice: json['servicePrice'],
      categoryName: json['categoryName'],
      totalRate: json['totalRate'],
      username: json['username'],
      profileImagePath: json['profileImagePath'],
      notes: json['notes'] ?? '',
      serviceRequestId: json['serviceRequestId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'serviceName': serviceName,
      'serviceDescription': serviceDescription,
      'servicePrice': servicePrice,
      'categoryName': categoryName,
      'totalRate': totalRate,
      'username': username,
      'profileImagePath': profileImagePath,
      'notes': notes,
      'serviceRequestId': serviceRequestId,
    };
  }

  @override
  List<Object?> get props => [
        id,
        serviceName,
        serviceDescription,
        servicePrice,
        categoryName,
        totalRate,
        username,
        profileImagePath,
        notes,
        serviceRequestId,
      ];
}

class FinishedRequestContainer {
  final List<FinishedRequestModel> finishedRequests;

  FinishedRequestContainer({required this.finishedRequests});

  factory FinishedRequestContainer.fromJson(List<dynamic> json) {
    List<FinishedRequestModel> finishedRequests =
        json.map((e) => FinishedRequestModel.fromJson(e)).toList();
    return FinishedRequestContainer(finishedRequests: finishedRequests);
  }

  List<dynamic> toJson() => finishedRequests.map((e) => e.toJson()).toList();
}
