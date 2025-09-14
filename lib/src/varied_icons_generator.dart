import "package:build/build.dart";

import 'package:source_gen/source_gen.dart';

class VariedIconsGenerator extends Generator {
  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    final out = StringBuffer();
    const targetClass = 'Symbols'; // Hardcoded class name
    for (var element in library.classes) {
      if (element.name3 != targetClass) continue;

      out.writeln(
          'import "package:material_symbols_icons/src/varied_icon_data.dart";');
      out.writeln(
          'import "package:material_symbols_icons/material_symbols_icons.dart";');
      out.writeln('');
      out.writeln('class ${element.name3}Varied {');
      out.writeln('  ${element.name3}Varied._();');
      for (final e in element.fields2) {
        if (e.name3 == null ||
            e.name3!.endsWith("_rounded") ||
            e.name3!.endsWith("_sharp")) {
          continue;
        }
        final constant = e.computeConstantValue();
        final constantReader = ConstantReader(constant);
        // print(e.name3);
        // print(constant);
        // print(constant?.toStringValue());
        final codePointReader = constantReader.peek("codePoint");
        final codePoint = codePointReader!.intValue;
        // print(codePoint);
        // print(codePoint?.intValue);
        out.writeln("");
        out.writeln(
            "  static const MaterialSymbolIconData ${e.name3!} = MaterialSymbolIconDataRoot(");
        out.writeln("    $codePoint,");
        out.writeln("    outlined: Symbols.${e.name3},");
        out.writeln("    rounded: Symbols.${e.name3}_rounded,");
        out.writeln("    sharp: Symbols.${e.name3}_sharp,");
        out.writeln("  );");
      }
      out.writeln('}');
    }
    return out.toString();
  }
}

Builder variedIconsBuilder(BuilderOptions options) =>
    LibraryBuilder(VariedIconsGenerator(), generatedExtension: '.varied.dart');
