// import 'package:bloc/bloc.dart';
// import 'package:clinic_package/clinic_package.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../../app/app.dart';
// import '../../../core/core.dart';

// part 'auth_bloc.freezed.dart';
// part 'auth_event.dart';
// part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final LoginQuery loginQuery;
//   final RegisterQuery registerQuery;
//   AuthBloc({
//     required this.loginQuery,
//     required this.registerQuery,
//   }) : super(AuthState.initial()) {
//     on<AuthEvent>((event, emit) async {
//       await event.maybeMap(
//         orElse: () {},
//         login: (value) async {
//           emit(
//             AuthState.loadInProgress(),
//           );
//           final result = await loginQuery(
//             LoginInput(
//               username: value.username,
//               password: value.password,
//             ),
//           );
//           await result.fold(
//             (l) async {
//               emit(AuthState.failure(message: l.message));
//             },
//             (r) async {
//               if (r.isSuccess == true) {
//                 emit(
//                   AuthState.success(
//                     username: r.value?.userName ?? "",
//                   ),
//                 );
//                 preferences.setString(
//                     SharedKeys.userName, r.value?.userName ?? "");
//                 preferences.setString(
//                     SharedKeys.password, r.value?.userName ?? "");
//                 preferences.setString(SharedKeys.id, r.value?.id ?? "");
//               } else {
//                 emit(
//                   AuthState.failure(
//                     message: r.errors?[0] ?? "",
//                   ),
//                 );
//               }
//             },
//           );
//         },
//         register: (value) async {
//           emit(
//             AuthState.loadInProgress(),
//           );
//           final result = await registerQuery(
//             RegisterInput(
//               username: value.username,
//               password: value.password,
//               firstName: value.firstName,
//               lastName: value.lastName,
//               email: value.email,
//               phone: value.phone,
//             ),
//           );
//           await result.fold(
//             (l) {
//               emit(AuthState.failure(message: l.message));
//             },
//             (r) async {
//               if (r.isSuccess == true) {
//                 emit(AuthState.success(username: r.value?.userName ?? ""));
//                 preferences.setString(
//                     SharedKeys.userName, r.value?.userName ?? "");
//               } else {
//                 emit(AuthState.failure(message: r.errors?[0] ?? ""));
//               }
//             },
//           );
//         },
//       );
//     });
//   }
// }
