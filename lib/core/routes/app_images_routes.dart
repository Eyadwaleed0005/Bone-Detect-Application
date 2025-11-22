class AppImage {
  static AppImage? _instance;

  factory AppImage() {
    _instance ??= AppImage._internal();
    return _instance!;
  }

  AppImage._internal();

  String get base => 'assets/images/';
  String get baseAnimation => 'assets/animation/';

  //images
  late final String bone = '${base}bone.png';
  late final String doctorWithXray = '${base}doctor_with_xray.png';
  late final String report = '${base}report.png';
  late final String xray = '${base}xray.png';
  late final String tmpPic1 = '${base}tmp_pic1.png';
  late final String tmpPic2 = '${base}tmp_pic2.png';
  late final String tmpPic3 = '${base}tmp_pic3.png';
  late final String tmpPic4 = '${base}tmp_pic4.png';
  late final String tmpPic5 = '${base}tmp_pic5.png';
  late final String tmpPic6 = '${base}tmp_pic6.png';


  
  //animation
  late final String errorAnimation = '${baseAnimation}error_animation.json';
}
