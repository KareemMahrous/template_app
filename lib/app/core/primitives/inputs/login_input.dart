import 'package:equatable/equatable.dart';

class LoginInput extends Equatable {
  final String username;
  final String password;

  const LoginInput({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
        username,
        password,
      ];
}
