import 'package:flutter/widgets.dart';
import 'package:material_symbols_icons/src/icon_data.dart';

enum IconVariation {
  outlined,
  rounded,
  sharp,
}

abstract mixin class VariedIconData implements IconData {
  IconVariation get defaultVariation;

  IconData getVariation(IconVariation variation);

  Map<IconVariation, IconData> getVariations();
}

abstract mixin class MaterialSymbolIconData implements VariedIconData {
  IconData get outlined;
  IconData get rounded;
  IconData get sharp;

  @override
  IconVariation get defaultVariation => IconVariation.outlined;

  @override
  IconData getVariation(IconVariation variation) {
    return switch (variation) {
      IconVariation.outlined => outlined,
      IconVariation.rounded => rounded,
      IconVariation.sharp => sharp,
    };
  }

  @override
  Map<IconVariation, IconData> getVariations() {
    return {
      IconVariation.outlined: outlined,
      IconVariation.rounded: rounded,
      IconVariation.sharp: sharp,
    };
  }

  // // unused because it isn't const, and requires the fields to be late
  // factory MaterialSymbolIconData(
  //   int codePoint, {
  //   bool matchTextDirection = false,
  // }) {
  //   final outlined = _MaterialSymbolIconDataOutlined(
  //     codePoint,
  //     matchTextDirection: matchTextDirection,
  //   );
  //   final rounded = _MaterialSymbolIconDataRounded(
  //     codePoint,
  //     matchTextDirection: matchTextDirection,
  //   );
  //   final sharp = _MaterialSymbolIconDataSharp(
  //     codePoint,
  //     matchTextDirection: matchTextDirection,
  //   );
  //   outlined.outlined = outlined;
  //   outlined.rounded = rounded;
  //   outlined.sharp = sharp;
  //   rounded.outlined = outlined;
  //   rounded.rounded = rounded;
  //   rounded.sharp = sharp;
  //   sharp.outlined = outlined;
  //   sharp.rounded = rounded;
  //   sharp.sharp = sharp;
  //   return outlined;
  // }
}

class MaterialSymbolIconDataRoot extends IconDataOutlined
    with MaterialSymbolIconData
    implements VariedIconData {
  @override
  final IconData outlined;
  @override
  final IconData rounded;
  @override
  final IconData sharp;

  const MaterialSymbolIconDataRoot(
    super.codePoint, {
    required this.outlined,
    required this.rounded,
    required this.sharp,
    super.matchTextDirection,
  });
}

// class _MaterialSymbolIconDataOutlined extends IconDataOutlined
//     with MaterialSymbolIconData
//     implements VariedIconData {
//   _MaterialSymbolIconDataOutlined(super.codePoint, {super.matchTextDirection});
// }
//
// class _MaterialSymbolIconDataRounded extends IconDataRounded
//     with MaterialSymbolIconData
//     implements VariedIconData {
//   _MaterialSymbolIconDataRounded(super.codePoint, {super.matchTextDirection});
// }
//
// class _MaterialSymbolIconDataSharp extends IconDataSharp
//     with MaterialSymbolIconData
//     implements VariedIconData {
//   _MaterialSymbolIconDataSharp(super.codePoint, {super.matchTextDirection});
// }
