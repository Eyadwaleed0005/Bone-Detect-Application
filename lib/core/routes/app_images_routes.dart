class AppImage {
  static AppImage? _instance;

  factory AppImage() {
    _instance ??= AppImage._internal();
    return _instance!;
  }

  AppImage._internal();

  String get base => 'assets/images/';

  late final String bone = '${base}bone.png';
  late final String doctorWithXray = '${base}doctor_with_xray.png';
  late final String report = '${base}report.png';
  late final String xray = '${base}xray.png';
}
