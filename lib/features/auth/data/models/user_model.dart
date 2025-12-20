class AuthResponseModel {
  final bool success;
  final AuthData data;

  AuthResponseModel({required this.success, required this.data});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      success: json['success'] ?? false,
      data: AuthData.fromJson(json['data']),
    );
  }
}

class AuthData {
  final UserModel user;
  final String accessToken;
  final String refreshToken;

  AuthData({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      user: UserModel.fromJson(json['user']),
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }
}

class UserModel {
  final String id;
  final String email;
  final String name;
  final String role;
  final String language;
  final String authProvider;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.language,
    required this.authProvider,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      language: json['language'] ?? '',
      authProvider: json['authProvider'] ?? '',
    );
  }
}
