part of 'design_utils.dart';

// Brand
 const Color accentLight = Color(0xFF10B981);
 const Color accentDark = Color(0xFF34D399);

// Splash / scaffold backgrounds (used to kill the white flash).
 const Color splashBgLight = Color(0xFFECFDF5);
 const Color splashBgDark = Color(0xFF050813);

// Light gradient
 const List<Color> gradientLight = [
  Color(0xFFECFDF5),
  Color(0xFFD1FAE5),
  Color(0xFFCCFBF1),
];

// Dark gradient
 const List<Color> gradientDark = [
  Color(0xFF050813),
  Color(0xFF070B1A),
  Color(0xFF0A1024),
];

/// App text color
const Color appTextPrimaryColor                  = Colors.black;
const Color appTextPrimaryColorForDarkMode       = Colors.white;
const Color appTextPrimaryColorForLightMode      = Colors.black;
 const Color textLight = Color(0xFF0F172A);
 const Color textDark = Color(0xFFFFFFFF);
 const Color mutedLight = Color(0xFF475569);
 const Color mutedDark = Color(0xFF94A3B8);

 Color glowColor(bool isDark) => isDark ? const Color(0xA634D399) : const Color(0x8010B981);


/// Card color
const Color cardColor                  = accentLight;
