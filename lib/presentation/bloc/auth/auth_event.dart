// part of 'auth_event.dart';

// sealed class AuthEvent extends Equatable {
//   const AuthEvent();
// }

// class LoginEvent extends AuthEvent {
//   final String username;
//   final String password;
//   const LoginEvent({
//     required this.username,
//     required this.password,
//   });

//   @override
//   List<Object> get props => [username, password];
// }

// class RegisterEvent extends AuthEvent {
//   final String firstName;
//   final String lastName;
//   final String username;
//   final String email;
//   final String phone;
//   final String password;
//   const RegisterEvent({
//     required this.firstName,
//     required this.lastName,
//     required this.username,
//     required this.email,
//     required this.phone,
//     required this.password,
//   });

//   @override
//   List<Object> get props =>
//       [firstName, lastName, username, email, phone, password];
// }
