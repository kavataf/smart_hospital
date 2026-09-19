import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://10.0.2.2:3000/user';
//   sign up
  Future<Map<String, dynamic>> signup({
    required String name,
    required String email,
    required String password
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password
      }),
    );
    // server response
    final data = jsonDecode(response.body);

    if (response.statusCode == 201) {
      return data;
    }

    throw Exception(data['message'] ?? 'Registration failed!');
  }
  
//   sign in
  Future<Map<String, dynamic>> signin({
    required String email,
    required String password,
  }) async {
      final response = await http.post(
        Uri.parse('$baseUrl/signin'),
        headers: {
          'content-type': 'application/json',
        },
      body: jsonEncode({
      'email': email,
      'password': password,
      }),
      );
  //     server response
  final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    }

    throw Exception(data['message'] ?? 'Login failed!');
  }

//   forgot password
  Future <Map<String, dynamic>> forgotpassword({
    required String email
  }) async{
      final response = await http.post(
        Uri.parse('$baseUrl/forgotpassword'),
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode({
          'email': email
        }),
      );
    //   server response
    final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data;
      }

      throw Exception(data['message'] ?? 'Something went wrong!');
    }

//     verify-reset-code
  Future <Map<String, dynamic>> verifycode({
    required String email,
    required String code
  }) async{
    print("email received: $email");
    print("code received: $code");
    final response = await http.post(
      Uri.parse('$baseUrl/verify-reset-code'),
      headers: {
        'content-type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'code': code
      }),
    );
    //   server response
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    }

    throw Exception(data['message'] ?? 'code verification failed!');
  }

//   reset password
  Future <Map<String, dynamic>> resetpassword({
    required String resetToken,
    required String newPassword,
    required String confirmPassword
  }) async{
    final response = await http.post(
      Uri.parse('$baseUrl/verify-reset-code'),
      headers: {
        'content-type': 'application/json',
      },
      body: jsonEncode({
        'resetToken': resetToken,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword
      }),
    );
    //   server response
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    }

    throw Exception(data['message'] ?? 'password reset failed!');
  }
  
}