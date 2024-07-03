import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity({
    this.userName,
    this.firsrName,
    this.id,
    this.roles,
    this.fullName,
    this.token,
  });
  final String? userName;
  final String? firsrName;
  final String? id;
  final List<String>? roles;
  final String? fullName;
  final String? token;

  @override
  List<Object?> get props => [userName, firsrName, id, roles, fullName, token];

  factory LoginEntity.fromJson(Map<String, dynamic> json) {
    return LoginEntity(
      userName: json['userName'],
      firsrName: json['firsrName'],
      id: json['id'],
      roles: json['roles'],
      fullName: json['fullName'],
      token: json['token'],
    );
  }
}
