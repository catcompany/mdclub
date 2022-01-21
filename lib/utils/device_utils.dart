import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceUtils {
  Future<dynamic> getDeviceInfo() async {
    /// Get device info
    ///
    /// return info of running paltform or null if paltform is fuchsia
    ///
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    var dataInfo;
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      dataInfo = iosInfo;
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      dataInfo = androidInfo;
    } else if (Platform.isLinux) {
      LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
      dataInfo = linuxInfo;
    } else if (Platform.isWindows) {
      WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
      dataInfo = windowsInfo;
    } else if (Platform.isMacOS) {
      MacOsDeviceInfo macOsDeviceInfo = await deviceInfo.macOsInfo;
      dataInfo = macOsDeviceInfo;
    } else if (Platform.isFuchsia) {
      dataInfo = null;
    }
    return dataInfo;
  }

  Future<String> get platformModel async {
    var data = await getDeviceInfo(), res;
    if (Platform.isIOS) {
      res = data.utsname.machine;
    } else if (Platform.isAndroid) {
      res = data.brand + ' ' + data.model;
    } else if (Platform.isLinux) {
      res = data.name;
    } else if (Platform.isWindows) {
      res = data.computerName;
    } else if (Platform.isMacOS) {
      res = data.computerName;
    } else if (Platform.isFuchsia) {
      res = 'fuchsia';
    }
    return res;
  }
}
