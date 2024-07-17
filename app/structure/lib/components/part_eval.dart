import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:structure/config/pallete.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class PartEval extends StatelessWidget {
  PartEval({
    super.key,
    required this.idx,
    required this.value,
    required this.selectedText,
    required this.onChanged,
  });

  final List<String> imagePath = [
    'assets/images/eval_Marbling.png',
    'assets/images/eval_Color.png',
    'assets/images/eval_Texture.png',
    'assets/images/eval_SurfaceMoisture.png',
    'assets/images/eval_Overall.png'
  ];
  final List<String>? selectedText;
  final double value;
  final Function(dynamic value)? onChanged;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 30.w),
        // 기준 이미지
        Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath[idx],
                width: 624.w,
                height: 68.h,
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 2; i < 7; i++)
              SizedBox(
                width: 123.w,
                child: Text(
                  selectedText![i],
                  style: Palette.h5,
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),

        // 슬라이더
        Container(
          width: 650.w,
          height: 12.h,
          margin: EdgeInsets.symmetric(vertical: 50.h, horizontal: 16.w),
          child: SfSliderTheme(
            data: const SfSliderThemeData(
              tooltipBackgroundColor: Palette.meatRegiBtnBg,
              // activeTrackHeight: 8,
              // inactiveTrackHeight: 8,
            ),
            child: SfSlider(
              min: 1.0,
              max: 10.0,
              value: value,
              interval: 1,
              showTicks: true,
              showLabels: false,
              activeColor: Palette.meatRegiBtnBg,
              inactiveColor: Palette.notEditableBg,

              enableTooltip: true,
              // minorTicksPerInterval: 1,
              onChanged: onChanged,
              tooltipTextFormatterCallback:
                  (dynamic actualValue, String formattedText) {
                final double newValue = actualValue + 1;
                return newValue.toStringAsFixed(1);
              },
            ),
          ),
          const SizedBox(height: 10),
      ],
    );
  }
}
