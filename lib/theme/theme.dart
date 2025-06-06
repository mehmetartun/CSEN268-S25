import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278217067),
      surfaceTint: Color(4278217067),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4288475634),
      onPrimaryContainer: Color(4278198304),
      secondary: Color(4283065187),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291619048),
      onSecondaryContainer: Color(4278460192),
      tertiary: Color(4286404366),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294958765),
      onTertiaryContainer: Color(4280817920),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294245370),
      onBackground: Color(4279639325),
      surface: Color(4294245370),
      onSurface: Color(4279639325),
      surfaceVariant: Color(4292535524),
      onSurfaceVariant: Color(4282337609),
      outline: Color(4285495673),
      outlineVariant: Color(4290693320),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020978),
      inverseOnSurface: Color(4293718769),
      inversePrimary: Color(4286633174),
      primaryFixed: Color(4288475634),
      onPrimaryFixed: Color(4278198304),
      primaryFixedDim: Color(4286633174),
      onPrimaryFixedVariant: Color(4278210385),
      secondaryFixed: Color(4291619048),
      onSecondaryFixed: Color(4278460192),
      secondaryFixedDim: Color(4289776844),
      onSecondaryFixedVariant: Color(4281486155),
      tertiaryFixed: Color(4294958765),
      onTertiaryFixed: Color(4280817920),
      tertiaryFixedDim: Color(4294033005),
      onTertiaryFixedVariant: Color(4284498176),
      surfaceDim: Color(4292205531),
      surfaceBright: Color(4294245370),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916148),
      surfaceContainer: Color(4293521390),
      surfaceContainerHigh: Color(4293126633),
      surfaceContainerHighest: Color(4292732131),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278209356),
      surfaceTint: Color(4278217067),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280516994),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281222983),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284447097),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4284169472),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4288048420),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294245370),
      onBackground: Color(4279639325),
      surface: Color(4294245370),
      onSurface: Color(4279639325),
      surfaceVariant: Color(4292535524),
      onSurfaceVariant: Color(4282074437),
      outline: Color(4283916641),
      outlineVariant: Color(4285758844),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020978),
      inverseOnSurface: Color(4293718769),
      inversePrimary: Color(4286633174),
      primaryFixed: Color(4280516994),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278216552),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284447097),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282867809),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4288048420),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4286207243),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292205531),
      surfaceBright: Color(4294245370),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916148),
      surfaceContainer: Color(4293521390),
      surfaceContainerHigh: Color(4293126633),
      surfaceContainerHighest: Color(4292732131),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278200104),
      surfaceTint: Color(4278217067),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278209356),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278986278),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281222983),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281409280),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284169472),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294245370),
      onBackground: Color(4279639325),
      surface: Color(4294245370),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292535524),
      onSurfaceVariant: Color(4280034854),
      outline: Color(4282074437),
      outlineVariant: Color(4282074437),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020978),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4289133564),
      primaryFixed: Color(4278209356),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203187),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281222983),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279710001),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284169472),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282263552),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292205531),
      surfaceBright: Color(4294245370),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916148),
      surfaceContainer: Color(4293521390),
      surfaceContainerHigh: Color(4293126633),
      surfaceContainerHighest: Color(4292732131),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4286633174),
      surfaceTint: Color(4286633174),
      onPrimary: Color(4278204216),
      primaryContainer: Color(4278210385),
      onPrimaryContainer: Color(4288475634),
      secondary: Color(4289776844),
      onSecondary: Color(4279972917),
      secondaryContainer: Color(4281486155),
      onSecondaryContainer: Color(4291619048),
      tertiary: Color(4294033005),
      onTertiary: Color(4282592256),
      tertiaryContainer: Color(4284498176),
      onTertiaryContainer: Color(4294958765),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279112725),
      onBackground: Color(4292732131),
      surface: Color(4279112725),
      onSurface: Color(4292732131),
      surfaceVariant: Color(4282337609),
      onSurfaceVariant: Color(4290693320),
      outline: Color(4287206290),
      outlineVariant: Color(4282337609),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292732131),
      inverseOnSurface: Color(4281020978),
      inversePrimary: Color(4278217067),
      primaryFixed: Color(4288475634),
      onPrimaryFixed: Color(4278198304),
      primaryFixedDim: Color(4286633174),
      onPrimaryFixedVariant: Color(4278210385),
      secondaryFixed: Color(4291619048),
      onSecondaryFixed: Color(4278460192),
      secondaryFixedDim: Color(4289776844),
      onSecondaryFixedVariant: Color(4281486155),
      tertiaryFixed: Color(4294958765),
      onTertiaryFixed: Color(4280817920),
      tertiaryFixedDim: Color(4294033005),
      onTertiaryFixedVariant: Color(4284498176),
      surfaceDim: Color(4279112725),
      surfaceBright: Color(4281612858),
      surfaceContainerLowest: Color(4278783759),
      surfaceContainerLow: Color(4279639325),
      surfaceContainer: Color(4279902497),
      surfaceContainerHigh: Color(4280625963),
      surfaceContainerHighest: Color(4281284150),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4286896602),
      surfaceTint: Color(4286633174),
      onPrimary: Color(4278196762),
      primaryContainer: Color(4282883743),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290105552),
      onSecondary: Color(4278196762),
      secondaryContainer: Color(4286289558),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294296177),
      onTertiary: Color(4280357888),
      tertiaryContainer: Color(4290087230),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279112725),
      onBackground: Color(4292732131),
      surface: Color(4279112725),
      onSurface: Color(4294376699),
      surfaceVariant: Color(4282337609),
      onSurfaceVariant: Color(4290956748),
      outline: Color(4288390565),
      outlineVariant: Color(4286285189),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292732131),
      inverseOnSurface: Color(4280625963),
      inversePrimary: Color(4278210898),
      primaryFixed: Color(4288475634),
      onPrimaryFixed: Color(4278195221),
      primaryFixedDim: Color(4286633174),
      onPrimaryFixedVariant: Color(4278205758),
      secondaryFixed: Color(4291619048),
      onSecondaryFixed: Color(4278195221),
      secondaryFixedDim: Color(4289776844),
      onSecondaryFixedVariant: Color(4280367675),
      tertiaryFixed: Color(4294958765),
      onTertiaryFixed: Color(4279897856),
      tertiaryFixedDim: Color(4294033005),
      onTertiaryFixedVariant: Color(4283117824),
      surfaceDim: Color(4279112725),
      surfaceBright: Color(4281612858),
      surfaceContainerLowest: Color(4278783759),
      surfaceContainerLow: Color(4279639325),
      surfaceContainer: Color(4279902497),
      surfaceContainerHigh: Color(4280625963),
      surfaceContainerHighest: Color(4281284150),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4293525503),
      surfaceTint: Color(4286633174),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4286896602),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293525503),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290105552),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966007),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294296177),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279112725),
      onBackground: Color(4292732131),
      surface: Color(4279112725),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282337609),
      onSurfaceVariant: Color(4294180348),
      outline: Color(4290956748),
      outlineVariant: Color(4290956748),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292732131),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4278202416),
      primaryFixed: Color(4288738806),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4286896602),
      onPrimaryFixedVariant: Color(4278196762),
      secondaryFixed: Color(4291882220),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290105552),
      onSecondaryFixedVariant: Color(4278196762),
      tertiaryFixed: Color(4294960059),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294296177),
      onTertiaryFixedVariant: Color(4280357888),
      surfaceDim: Color(4279112725),
      surfaceBright: Color(4281612858),
      surfaceContainerLowest: Color(4278783759),
      surfaceContainerLow: Color(4279639325),
      surfaceContainer: Color(4279902497),
      surfaceContainerHigh: Color(4280625963),
      surfaceContainerHighest: Color(4281284150),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
