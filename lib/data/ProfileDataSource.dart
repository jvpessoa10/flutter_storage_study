import 'package:persistence_example/model/Profile.dart';

abstract class ProfileDataSource {
  Future<Profile?> getProfile();
  Future<bool> setProfile(Profile profile);
  Future<bool> deleteProfile();
}

class ProfileDataSourceImpl implements ProfileDataSource {
  @override
  Future<bool> deleteProfile() async {
    // TODO: implement deleteProfile
    return false;
  }

  @override
  Future<Profile?> getProfile() async {
    // TODO: implement getProfile
    return null;
  }

  @override
  Future<bool> setProfile(Profile profile) async {
    // TODO: implement setProfile
    return false;
  }

}