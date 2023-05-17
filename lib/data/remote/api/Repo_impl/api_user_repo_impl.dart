import 'dart:convert';
import 'dart:io';

import '../../../../application/cons/endpoint.dart';
import '../../model/user_model.dart';
import 'package:http/http.dart' as http;

import '../Repo/api_user_repo.dart';


class UserLocalAPIRepoImpl extends UserLocalAPIRepo {
  @override
  Future<UserModel> getUserByEmailAndPass(String email, String pass) async {
    try {
      final url =
          "${endpoint}getUserByEmailAndPassword?email=$email&password=$pass";
      final res = await http.get(Uri.parse(url), headers: requestHeaders);
      if (res.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel =
            GetUserByMailAndPassRes.fromJson(parsed).lItems!.first;
        // log(addressModel.predictions![1].description.toString());
        return userModel;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel =
            GetUserByMailAndPassRes.fromJson(parsed).lItems!.first;
        return userModel;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occured');
    }
  }

}
