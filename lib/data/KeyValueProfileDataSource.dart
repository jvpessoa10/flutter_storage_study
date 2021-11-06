import 'dart:convert';
import 'package:persistence_example/data/ProfileDataSource.dart';
import 'package:persistence_example/model/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueProfileDataSource implements ProfileDataSource {

  static const String _PROFILE_SHARED_PREF_KEY_NAME = "profile_name";
  static const String _PROFILE_SHARED_PREF_KEY_ADDR= "profile_addr";

  Future<SharedPreferences> _getPreferences() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<bool> deleteProfile() async {
    final prefs = await _getPreferences();
    prefs.remove(_PROFILE_SHARED_PREF_KEY_NAME);
    prefs.remove(_PROFILE_SHARED_PREF_KEY_ADDR);

    return true;
  }

  @override
  Future<Profile?> getProfile() async {
    final prefs = await _getPreferences();

    String? name = prefs.getString(_PROFILE_SHARED_PREF_KEY_NAME);
    String? address = prefs.getString(_PROFILE_SHARED_PREF_KEY_ADDR);

    if (name == null || address == null) return null;

    return Profile(name: name, address: address) ;
  }

  @override
  Future<bool> setProfile(Profile profile) async {
    final SharedPreferences prefs = await _getPreferences();

    prefs.setString(_PROFILE_SHARED_PREF_KEY_NAME, profile.name);
    prefs.setString(_PROFILE_SHARED_PREF_KEY_ADDR, profile.address);

    return true;
  }
}