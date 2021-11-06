import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:persistence_example/data/ProfileDataSource.dart';
import 'package:persistence_example/model/Profile.dart';

class FileProfileDataSource implements ProfileDataSource {

  static const String _PROFILE_FILE_NAME = "profile.txt";

  Future<String> get _localPath async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _notesFile async {
    final path = await _localPath;
    return File("$path/$_PROFILE_FILE_NAME");
  }

  @override
  Future<bool> deleteProfile() async {
    final notesFile = await _notesFile;
    notesFile.delete();

    return true;
  }

  @override
  Future<Profile?> getProfile() async {
    // TODO: implement getProfile
    final notesFile = await _notesFile;

    String rawText = await notesFile.readAsString();

    if (rawText.isNotEmpty) {
      List<String> lines = rawText.split("\n");

      return Profile(name: lines[0], address: lines[1]);
    }

    return null;
  }

  @override
  Future<bool> setProfile(Profile profile) async {
    final notesFile = await _notesFile;

    notesFile.writeAsString("${profile.name}\n${profile.address}");

    return true;
  }
}