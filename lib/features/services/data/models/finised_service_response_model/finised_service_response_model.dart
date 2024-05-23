import 'package:equatable/equatable.dart';

class FinishedServiceResponseModel extends Equatable {
  final int id;
  final String serviceName;
  final String serviceDescription;
  final int servicePrice;
  final String categoryName;
  final int totalRate;
  final String username;
  final String? profileImagePath;
  final String? notes;
  final int serviceRequestId;

  const FinishedServiceResponseModel({
    required this.id,
    required this.serviceName,
    required this.serviceDescription,
    required this.servicePrice,
    required this.categoryName,
    required this.totalRate,
    required this.username,
    this.profileImagePath,
    this.notes,
    required this.serviceRequestId,
  });

  factory FinishedServiceResponseModel.fromJson(Map<String, dynamic> json) {
    return FinishedServiceResponseModel(
      id: json['id'],
      serviceName: json['serviceName'],
      serviceDescription: json['serviceDescription'],
      servicePrice: json['servicePrice'],
      categoryName: json['categoryName'],
      totalRate: json['totalRate'],
      username: json['username'],
      profileImagePath: json['profileImagePath'],
      notes: json['notes'],
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

class FinishedServiceResponseContainer {
  final List<FinishedServiceResponseModel> finishedServices;

  FinishedServiceResponseContainer({required this.finishedServices});

  factory FinishedServiceResponseContainer.fromJson(List<dynamic> json) {
    List<FinishedServiceResponseModel> finishedServices =
        json.map((e) => FinishedServiceResponseModel.fromJson(e)).toList();
    return FinishedServiceResponseContainer(finishedServices: finishedServices);
  }

  List<dynamic> toJson() => finishedServices.map((e) => e.toJson()).toList();
}
