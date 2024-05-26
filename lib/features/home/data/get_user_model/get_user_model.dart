class GetUserModel {
  final int userId;
  final String username;
  final String email;
  final DateTime dateOfBirth;
  final String address;
  final String phoneNumber;
  final String jobTitle;
  final String profileImagePath;
  final int totalRate;

  GetUserModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.dateOfBirth,
    required this.address,
    required this.phoneNumber,
    required this.jobTitle,
    required this.profileImagePath,
    required this.totalRate,
  });

  factory GetUserModel.fromJson(Map<String, dynamic> json) {
    return GetUserModel(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      jobTitle: json['jobTitle'],
      profileImagePath: json['profileImagePath'],
      totalRate: json['totalRate'],
    );
  }
}
