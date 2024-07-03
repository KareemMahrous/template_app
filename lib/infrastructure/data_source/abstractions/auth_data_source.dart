abstract class AuthDataSource {
  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  });
  Future<Map<String, dynamic>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
  Future<Map<String, dynamic>> register({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phone,
    required String password,
  });
}
