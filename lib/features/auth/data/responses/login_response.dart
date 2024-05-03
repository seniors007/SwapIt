class LoginResponse {
  final String token;
  final String refreshToken;
  final String userName;
  final int userId;
  final List<String> roles;

  LoginResponse({
    required this.token,
    required this.refreshToken,
    required this.userName,
    required this.userId,
    required this.roles,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json['token'],
        refreshToken: json['refreshToken'],
        userName: json['userName'],
        userId: json['userId'],
        roles: json['roles'].cast<String>(),
      );
}
