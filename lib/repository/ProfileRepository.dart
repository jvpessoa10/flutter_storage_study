import 'package:persistence_example/data/ProfileDataSource.dart';
import 'package:persistence_example/model/Profile.dart';

abstract class ProfileRepository {
  Future<Profile?> getProfile();
  Future<bool> setProfile(Profile profile);
  Future<bool> deleteProfile();
}

class ProfileRepositoryImpl implements ProfileRepository {

  ProfileRepositoryImpl(this.dataSource);

  final ProfileDataSource dataSource;

  @override
  Future<Profile?> getProfile() {
    // TODO: implement getProfile
    return dataSource.getProfile();
  }

  @override
  Future<bool> deleteProfile() {
    // TODO: implement deleteProfile
    return dataSource.deleteProfile();
  }

  @override
  Future<bool> setProfile(Profile profile) {
    // TODO: implement setProfile
    return dataSource.setProfile(profile);
  }
}
