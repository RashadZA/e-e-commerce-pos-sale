part of 'design_utils.dart';

/// ─────────────────────────────────────────────────────────────────────────────
/// EPOS SALE Brand Palette (extracted from banner.png)
///
///  Deep Navy Blue  #1A3C7A  — logo "EPOS", icon body, primary UI chrome
///  Vivid Orange    #F5830A  — logo "SALE", arrow accent, primary CTAs
///  Bright Green    #2DB84B  — checkmarks, success states
///  Dark Charcoal   #3A3A3A  — tagline / body text
///  Off-White       #F4F5F7  — page/screen background
/// ─────────────────────────────────────────────────────────────────────────────

/// Theme colors
const Color lightThemeColor = Colors.black;
const Color darkThemeColor  = Colors.white;

/// Primary colors — Navy Blue (brand primary)
const Color primaryColor                              = Color(0xFF1A3C7A);
const Color secondaryColor                            = Color(0xFFF5830A);
const Color safeAreaPrimaryColor                      = Color(0xFF1A3C7A);
const Color safeAreaPrimaryColorForAppBar             = Color(0xFF1A3C7A);
const Color safeAreaPrimaryColorForBottomNavigationBar = Color(0xFF0F2550);
const Color primaryColorForDarkMode                   = Colors.white38;
final Color primaryShadowColor                        = primaryColor.withValues(alpha: 0.4);
const Color backgroundColorForDarkMode                = Colors.black54;
const Color backgroundColorForLightMode               = Color(0xFFF4F5F7); // unchanged — suits brand

/// Refresh Indicator Color
const Color refreshIndicatorColorForDarkMode               = Colors.white70;
const Color refreshIndicatorColorForLight                  = primaryColor;
const Color refreshIndicatorBackgroundColorForDarkMode     = Colors.grey;
const Color refreshIndicatorBackgroundColorForLight        = Colors.white;

/// Others
const Color appIconBackgroundColor = Color(0xFF000000);
const Color whiteColor             = Colors.white;
const Color blackColor             = Colors.black;
const Color blueAccentColor        = Colors.blueAccent;
const Color greyColor              = Colors.grey;
final Color greyColorOpacity04     = Colors.grey.withValues(alpha: 0.4);
final Color greyColorOpacity08     = Colors.grey.withValues(alpha: 0.8);
const Color redAccentColor         = Colors.redAccent;
const Color greenColor             = Color(0xFF2DB84B); // brand green (checkmarks)
const Color transparentColor       = Colors.transparent;
const Color editColor              = Color(0xFFF5830A); // brand orange — used for edit/highlight
const Color deleteColor            = Colors.redAccent;

/// Gradient colors — Navy → Brand Blue gradient
const Color buttonGradientStartColor              = Color(0xFF1A3C7A); // navy
const Color buttonGradientStartColorForDarkMode   = Colors.white38;
Color       buttonGradientCenterColor             = const Color(0xFF1F5BB5); // mid-blue
Color       buttonGradientCenterColorForDarkMode  = const Color(0xFF8D8D91);
const Color buttonGradientEndColor                = Color(0xFF2472D4); // bright blue
const Color buttonGradientEndColorForDarkMode     = Color(0xFFC0C0C1);

const Color gradientStartColor                    = Color(0xFF1A3C7A);
const Color gradientStartColorForDarkMode         = Colors.white38;
Color       gradientCenterColor                   = const Color(0xFF1F5BB5);
Color       gradientCenterColorForDarkMode        = const Color(0xFF8D8D91);
const Color gradientEndColor                      = Color(0xFF2472D4);
const Color gradientEndColorForDarkMode           = Color(0xFFADADAE);

/// App text color
const Color appTextPrimaryColor                  = Colors.black;
const Color appTextPrimaryColorForDarkMode       = Colors.white;
const Color appTextPrimaryColorForLightMode      = Colors.black;
const Color appTextSecondaryColor                = Color(0xFF3A3A3A); // brand charcoal
const Color appTextSecondaryColorForDarkMode     = Color(0xFFD8D8D8);
const Color appTextSecondaryColorForLightMode    = Color(0xFF3A3A3A); // brand charcoal
// Alias kept for backwards compatibility:
const Color appTextThirdColor                    = Color(0xFF6B7280);

/// Card shadow color
const Color cardColor                    = Colors.white;
const Color cardColorForLightMode        = Colors.white;
const Color secondCardColorForLightMode  = Color(0xFFF9FAFB);
const Color cardSecondaryColor           = Colors.white;
Color       cardColorForDarkMode         = Colors.white10.withValues(alpha: 0.1);
Color       secondCardColorForDarkMode   = const Color(0xFF1D2939);
Color       cardShadowColor              = primaryColor.withValues(alpha: 0.4);
const Color cardSecondaryShadowColor     = Color(0xFFCCCCCC);
Color       dialogCardColorForDarkMode   = Colors.black87;
Color       cardShadowColorForDarkMode   = Colors.white10.withValues(alpha: 0.05);

/// Bottom Navigation Bar color — deep navy
Color bottomNavigationBarColor                        = const Color(0xFF0F2550);
Color bottomNavigationBarShadowColor                  = const Color(0xFF0F2550).withValues(alpha: 0.5);
Color bottomNavigationBarActiveIconPrimaryColor        = whiteColor;
Color bottomNavigationBarInActiveIconPrimaryColor      = blackColor;
Color bottomNavigationBarActiveBackgroundColor         = greyColor.withValues(alpha: 0.1);

/// App Bar colors
Color       appBarIconPrimaryColor          = const Color(0xFF292929);
const Color appBarBackgroundColor           = primaryColor;           // navy
const Color appBarBackgroundColorForDarkMode = primaryColorForDarkMode;

/// Shimmer color
Color shimmerBaseColor      = Colors.grey.shade300;
Color shimmerHighlightColor = Colors.grey.shade100;

/// Core Text Field Colors
const Color coreTextFieldBackgroundColor              = Colors.white;
const Color coreTextFieldBackgroundColorForLightMode  = Color(0xFFF8F9FB);
const Color coreTextFieldBackgroundColorForDarkMode   = Color(0xFF323645);
const Color coreTextFieldDefaultIconColor             = Color(0xFF9A9A9A);
const Color coreTextFieldDefaultHintTextColor         = Color(0xFFD8D8D8);
const Color coreTextFieldShadowColor                  = Color(0xFFF2F2F2);
const Color coreTextFieldShadowColorForDarkMode       = Color(0xFF716F6F);
const Color coreTextFieldCursorColor                  = Colors.black;
const Color coreTextFieldTitleColorForLightMode       = Color(0xFF515151);
const Color coreTextFieldTitleColorForDarkMode        = Color(0xFFA8A6A6);

/// App Icon Colors
const Color appIconDarkModeColor   = Colors.white70;
const Color appIconLightModeColor  = Color(0xFF000000);
const Color appIconPrimaryColor    = Colors.white;
const Color appIconSecondaryColor  = Color(0xFF515151);

/// Divider Color
Color dividerColorForLightMode = const Color(0xFF000000).withValues(alpha: 0.2);
Color dividerColorForDarkMode  = Colors.white10;

/// Core Button Colors — primary = navy; accent = orange for CTAs
const Color buttonPrimaryColor              = primaryColor;            // navy
const Color buttonPrimaryColorForDarkMode   = Color(0xFF858181);
const Color buttonDisableColor              = Color(0xFFE1E0E0);
Color       buttonShadowColor               = Colors.black.withValues(alpha: 0.3);
const Color buttonBorderColor               = Colors.white24;
const Color buttonBorderColorForDarkMode    = Colors.black26;

/// Accent / CTA button color — brand orange
const Color buttonAccentColor               = Color(0xFFF5830A);       // orange (SALE / arrow)
const Color buttonAccentColorDark           = Color(0xFFD4700A);       // darker orange hover

/// Button fill color
const Color buttonTextPrimaryColor    = Colors.white;
const Color buttonIconPrimaryColor    = Colors.white;
Color buttonFillColorForLightMode     = const Color(0xFFF2F2F2);
Color buttonFillColorForDarkMode      = Colors.grey.withValues(alpha: 0.3);
Color disableButtonFillColorForLightMode = const Color(0xFFD9D9D9);
Color disableButtonFillColorForDarkMode  = Colors.grey.withValues(alpha: 0.2);
Color buttonFillSecondaryColorForLightMode = const Color(0xFF000000).withValues(alpha: 0.1);
Color buttonFillSecondaryColorForDarkMode  = const Color(0xFF000000).withValues(alpha: 0.1);

/// PopUp Menu Button color
const Color popUpMenuButtonLightModeColor = Color(0xFFFAFAFA);
const Color popUpMenuButtonDarkModeColor  = Colors.black;

/// App CheckBox color
const Color appCheckBoxPrimaryColor          = primaryColor;           // navy
const Color appCheckBoxSecondaryColor        = Color(0xFFC5C5C5);
const Color appCheckBoxDarkModeColor         = Colors.white70;
const Color appCheckBoxLightModeColor        = Colors.white38;
const Color appCheckBoxIconDarkModeColor     = Colors.white;
const Color appCheckBoxIconLightModeColor    = Colors.white;

/// Drop Down
const Color coreDropDownDefaultHintTextColor                        = Colors.white54;
const Color coreDropDownDefaultHintTextColorForLightMode            = Colors.black54;
const Color coreDropDownDefaultHintTextColorForDarkMode             = Colors.white54;
const Color coreDropDownBackgroundColor                             = Color(0xFF323645);
const Color coreDropDownBackgroundColorForLightMode                 = Color(0xFFF8F9FB);
const Color coreDropDownBackgroundColorForDarkMode                  = Color(0xFF323645);
const Color popUpMenuButtonColor                                    = Color(0xFF323645);
const Color popUpMenuButtonColorForLightMode                        = Color(0xFFF8F9FB);
const Color popUpMenuButtonColorForDarkMode                         = Color(0xFF323645);
const Color coreDropDownBorderColorForLightMode                     = Color(0xFF1A3C7A); // navy
const Color coreDropDownBorderColorForDarkMode                      = Color(0xFF323645);
const Color coreDropDownPopUpMenuSearchFieldBorderColorForLightMode = Color(0xFF1A3C7A); // navy
const Color coreDropDownPopUpMenuSearchFieldBorderColorForDarkMode  = Color(0xFFF8F9FB);

/// Dialog Colors — navy-tinted header to match brand
const Color dialogHeaderColorForLightMode = Color(0xFF1A3C7A); // navy
const Color dialogHeaderColorForDarkMode  = Colors.black26;

const Color dialogShadowColorForLightMode = Color(0xFF1A3C7A);
Color       dialogShadowColorForDarkMode  = Colors.black26;

const Color dialogSurfaceTintColorForLightMode = Color(0xFF1A3C7A);
const Color dialogSurfaceTintColorForDarkMode  = Colors.black26;

const Color dialogBackgroundColorForLightMode  = Colors.white;
Color       dialogBackgroundColorForDarkMode   = const Color(0xFF323645);

const Color dialogBorderColorForLightMode = Color(0xFF1A3C7A); // navy border
const Color dialogBorderColorForDarkMode  = Colors.black26;

/// ── Brand accent convenience aliases ─────────────────────────────────────────
/// Use these for orange highlights, badges, and sale/promo UI elements.
const Color brandOrange = Color(0xFFF5830A); // "SALE" orange
const Color brandNavy   = Color(0xFF1A3C7A); // "EPOS" navy
const Color brandGreen  = Color(0xFF2DB84B); // checkmark green