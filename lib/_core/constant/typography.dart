import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimensions.dart';

class TypographyStyles extends StatelessWidget {
  static const String fontFamily = 'DMSans';

  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow overflow;
  final TextScaler? textScaler;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final Color? color;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;

  TypographyStyles.h1(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow = TextOverflow.ellipsis,
    this.textScaler,
    this.maxLines = 1,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
  }) : style = TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize ?? AppTextSize.h1,
          fontWeight: fontWeight ?? FontWeight.w700,
          color: color ?? TextColors.base,
          height: height ?? 1.2,
        );

  TypographyStyles.h2(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.h2,
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color ?? TextColors.base,
    height: height ?? 1.2,
  );

  TypographyStyles.h3(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.h2,
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color ?? TextColors.base,
    height: height ?? 1.2,
  );

  TypographyStyles.h4(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.xxlarge,
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color ?? TextColors.base,
    height: height ?? 1.2,
  );

  TypographyStyles.h5(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.xlarge,
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color ?? TextColors.base,
    height: height ?? 1.2,
  );

  TypographyStyles.h6(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.large,
    fontWeight: fontWeight ?? FontWeight.w500,
    color: color ?? TextColors.base,
    height: height ?? 1.2,
  );

  TypographyStyles.button(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.mediumToLarge,
    fontWeight: fontWeight ?? FontWeight.w500,
    color: color ?? TextColors.base,
    height: height ?? 1,
  );

  TypographyStyles.bodyLargeRegular(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.large,
    fontWeight: fontWeight ?? FontWeight.w400,
    color: color ?? TextColors.base,
    height: height ?? 1,
  );

  TypographyStyles.bodyLargeMedium(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.large,
    fontWeight: fontWeight ?? FontWeight.w500,
    color: color ?? TextColors.base,
    height: height ?? 1,
  );

  TypographyStyles.bodyLargeBold(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.large,
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color ?? TextColors.base,
    height: height ?? 1,
  );

  TypographyStyles.bodyMainRegular(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.mediumToLarge,
    fontWeight: fontWeight ?? FontWeight.w400,
    color: color ?? TextColors.base,
    height: height ?? 1,
  );

  TypographyStyles.bodyMainMedium(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.mediumToLarge,
    fontWeight: fontWeight ?? FontWeight.w500,
    color: color ?? TextColors.base,
    height: height ?? 1,
  );

  TypographyStyles.bodyMainBold(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.mediumToLarge,
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color ?? TextColors.base,
    height: height ?? 1,
  );

  TypographyStyles.bodySmallRegular(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.small,
    fontWeight: fontWeight ?? FontWeight.w400,
    color: color ?? TextColors.base,
    height: height ?? 1,
  );

  TypographyStyles.bodySmallMedium(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.small,
    fontWeight: fontWeight ?? FontWeight.w500,
    color: color ?? TextColors.base,
    height: height ?? 1,
  );

  TypographyStyles.bodySmallBold(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.small,
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color ?? TextColors.base,
    height: height ?? 1,
  );

  TypographyStyles.bodyCaptionRegular(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.xsmall,
    fontWeight: fontWeight ?? FontWeight.w400,
    color: color ?? TextColors.base,
    height: height ?? 1,
  );

  TypographyStyles.bodyCaptionMedium(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.xsmall,
    fontWeight: fontWeight ?? FontWeight.w500,
    color: color ?? TextColors.base,
    height: height ?? 1,
  );

  TypographyStyles.bodyCaptionBold(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.xsmall,
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color ?? TextColors.base,
    height: height ?? 1,
  );

  TypographyStyles.captionSmall(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textScaler,
        this.maxLines = 1,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.color,
        this.height,
        this.fontSize,
        this.fontWeight,
      }) : style = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize ?? AppTextSize.xxsmall,
    fontWeight: fontWeight ?? FontWeight.w400,
    color: color ?? TextColors.base.withOpacity(0.87),
    height: height ?? 1,
  );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaler: textScaler,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }
}
