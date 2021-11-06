import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:persistence_example/data/ProfileDataSource.dart';
import 'package:persistence_example/model/Profile.dart';
import 'package:sqflite/sqflite.dart';

class HttpProfileDataSource implements ProfileDataSource {

  static const String _PROFILE_HTTP_API = "https://profile.free.beeceptor.com";

  @override
  Future<bool> deleteProfile() async {
    return false;
  }

  @override
  Future<bool> editProfile(Profile profile) async {
    return false;
  }

  @override
  Future<Profile?> getProfile() async {
    final Response res = await get(Uri.parse(_PROFILE_HTTP_API));

    if (res.statusCode == 200) {
      return Profile.fromJson(jsonDecode(res.body));
    }
  }

  @override
  Future<bool> setProfile(Profile profile) async {
    getProfile();
    return false;
  }
}
