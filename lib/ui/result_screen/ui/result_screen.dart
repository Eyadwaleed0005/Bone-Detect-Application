import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/style/textstyles.dart';
import 'package:bonedetect/core/widgets/app_button.dart';
import 'package:bonedetect/core/helper/spacer.dart';
import 'package:bonedetect/core/local/shared_preferences.dart';
import 'package:bonedetect/core/local/shared_preference_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  double? probability;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProbability();
  }

  Future<void> _loadProbability() async {
    final value = await SharedPreferencesHelper.getDouble(
      key: SharedPreferenceKeys.fractureProbability,
    );

    setState(() {
      probability = value;
      _isLoading = false;
    });
  }

  /// هل يوجد كسر بناءً على threshold الحقيقي من كاجل؟
  bool get _isFractured {
    if (probability == null) return false;
    return probability! >= 0.5;
  }

  String getResultTitle() {
    if (probability == null) {
      return "Analysis Failed";
    }

    return _isFractured ? "Fracture Detected" : "No Fracture Detected";
  }

  Color getResultColor() {
    if (probability == null) return Colors.grey;
    return _isFractured ? Colors.red : Colors.green;
  }

  String getResultParagraph() {
    if (probability == null) {
      return "Unable to analyse the image. Please try again with a clear X-ray image.";
    }

    if (_isFractured) {
      return "The AI analysis indicates a high probability of a bone fracture in the uploaded X-ray image.\n\n"
          "This is not a final medical diagnosis, but it is strongly recommended to consult a medical specialist "
          "to confirm the fracture and start appropriate treatment.";
    } else {
      return "The AI analysis does not detect any bone fracture in this image.\n\n"
          "If this is not a real X-ray image (for example, a normal camera photo), the model will also classify it "
          "as 'not fractured'. Please ensure you upload a proper X-ray image for accurate results.\n\n"
          "If you still feel pain or symptoms, it is advised to consult a medical specialist.";
    }
  }

  String getPercentageText() {
    if (probability == null) return "";
    final percent = (probability! * 100).toStringAsFixed(2);
    return "$percent% fracture probability";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(40),
                    Text(
                      getResultTitle(),
                      style: Textstyles.font15blackBold().copyWith(
                        color: getResultColor(),
                      ),
                    ),
                    verticalSpace(8),
                    Text(
                      getPercentageText(),
                      style: Textstyles.font13grey600medium(),
                    ),
                    verticalSpace(20),
                    Text(
                      getResultParagraph(),
                      style: Textstyles.font14grey600medium(),
                    ),
                    const Spacer(),
                    AppButton(
                      title: "Back",
                      onPressed: () => Navigator.pop(context),
                    ),
                    verticalSpace(20),
                  ],
                ),
              ),
            ),
    );
  }
}
