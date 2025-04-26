import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.fontWeight = FontWeight.normal,
    this.textColor,
    required this.fontSize,
    this.title,
    this.firstText,
    this.secondText,
    this.firstTextColor,
    this.secondTextColor,
    this.firstTextFontWeight,
    this.secondTextFontWeight,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.maxLines,
    this.textOverflow,
    this.textAlign = TextAlign.center,
    this.fontFamily,
    this.fontStyle = FontStyle.normal,
    this.isItalic = false,
    this.capitalize = false,
    this.isGlass = false,
    this.glassPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.textStyle,
    this.withLines = false, // Added parameter to control lines
    this.lineColor, // Added parameter for line color
    this.lineWidth, // Added parameter for line width
  }) : assert(
  (title != null) ^ (firstText != null && secondText != null),
  'Provide either a single title or both firstText and secondText for dual-tone.',
  );

  final FontWeight fontWeight;
  final Color? textColor;
  final double fontSize;
  final String? title;
  final String? firstText;
  final String? secondText;
  final Color? firstTextColor;
  final Color? secondTextColor;
  final FontWeight? firstTextFontWeight;
  final FontWeight? secondTextFontWeight;
  final MainAxisAlignment mainAxisAlignment;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign textAlign;
  final String? fontFamily;
  final FontStyle fontStyle;
  final bool isItalic;
  final bool capitalize;
  final bool isGlass;
  final EdgeInsetsGeometry glassPadding;
  final TextStyle? textStyle;
  final bool withLines;
  final Color? lineColor;
  final double? lineWidth;

  String capitalizeText(String text) {
    return text
        .split(' ')
        .map((word) => word.isNotEmpty
        ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
        : word)
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    TextStyle baseStyle = textStyle ??
        (fontFamily != null && fontFamily!.isNotEmpty
            ? TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
          fontFamily: fontFamily,
        )
            : GoogleFonts.quicksand(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        ));

    if (isItalic) {
      baseStyle = baseStyle.copyWith(fontStyle: FontStyle.italic);
    }

    Widget textWidget;

    if (title != null) {
      Widget titleText = Text(
        capitalize && title != null ? capitalizeText(title!) : title ?? '',
        overflow: textOverflow,
        maxLines: maxLines,
        textAlign: textAlign,
        style: baseStyle.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        ),
      );

      if (withLines) {
        textWidget = Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 10.w),
                height: 1.h,
                color: lineColor ?? Colors.grey, // Use provided color or default
              ),
            ),
            titleText,
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10.w),
                height: 1.h,
                color: lineColor ?? Colors.grey, // Use provided color or default
              ),
            ),
          ],
        );
      } else {
        textWidget = titleText;
      }
    } else if (firstText != null && secondText != null) {
      textWidget = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Text(
            capitalize && firstText != null
                ? capitalizeText(firstText!)
                : firstText!,
            style: baseStyle.copyWith(
              fontSize: fontSize,
              fontWeight: firstTextFontWeight ?? fontWeight,
              color: firstTextColor ?? textColor,
            ),
          ),
          Text(
            capitalize && secondText != null
                ? capitalizeText(secondText!)
                : secondText!,
            style: baseStyle.copyWith(
              fontSize: fontSize,
              fontWeight: secondTextFontWeight ?? fontWeight,
              color: secondTextColor ?? textColor,
            ),
          ),
        ],
      );
    } else {
      textWidget = const SizedBox.shrink();
    }

    return textWidget;
  }
}

