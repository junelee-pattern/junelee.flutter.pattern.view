import '../../../app/_/_/interaction/listener/_/app_version_change/_.dart';
import '../../../app/_/_/interaction/listener/_/first_time_open_app/_.dart';
import '../../../../../main.dart';
import '../../params/my_package_info.dart';

readyForMyAppVersionChange() {
  int oldAppVersionNum =
      GetStorageKit().getInt("myVersionListener - versionNumber") ?? 0;
  int nowAppVersionNum = int.parse(MyPackageInfo.buildNumber);

  if (oldAppVersionNum == 0) {
    //first time open app
    _firstTimeOpen();

    _whenVersionChanged(nowAppVersionNum, oldAppVersionNum);
  } else if (oldAppVersionNum != nowAppVersionNum) {
    // this case is version changed.
    _whenVersionChanged(nowAppVersionNum, oldAppVersionNum);
  }
}

_firstTimeOpen() {
  if (GetStorageKit().getInt("myVersionListener - FirstOpenTime") == 0) {
    GetStorageKit().setInt("myVersionListener - FirstOpenTime",
        DateTime.now().millisecondsSinceEpoch);

    FirstTimeOpenAppListener();
  }
}

_whenVersionChanged(int nowAppVersionNum, int oldAppVersionNum) {
  GetStorageKit().setInt("myVersionListener - versionNumber", nowAppVersionNum);

  AppVersionChangeListener(nowAppVersionNum, oldAppVersionNum);
}
