# M Daddy — E-commerce POS · Flutter Onboarding (Clean GetX Architecture)

A polished, production-grade onboarding flow for **M Daddy — E-commerce POS** (sales / inventory / insights) built with Flutter + **GetX clean architecture**. ONE responsive UI for **Mobile, Web, and Windows/macOS/Linux desktop**, light + dark mode, custom branded title bar, animated splash, no white flash on launch.

---

## ✨ What's inside

- 🚀 **Animated splash** — pulse rings, drifting orbs, shimmer logo, loading dots (auto-routes after 2.6s)
- 🎬 **3-slide onboarding** — Sales → Inventory → Insights, parallax palette, custom-painted illustrations
- 🔐 **Auth** — animated Sign In ↔ Sign Up toggle, email/password, Google + Apple buttons
- 🌗 **Light + Dark mode** — global, animated, persists across routes
- 📐 **One responsive UI** — single codebase that adapts to mobile, web, desktop
- 🪟 **Custom branded title bar** — replaces the small native Windows chrome with a 56-px tall brand bar (logo, theme toggle, min/max/close)
- 🚫 **No white flash** on app open — handled at every layer (HTML loader, scaffold bg, MaterialApp builder, window bg)
- 🧭 **Named routes** with `Get.toNamed()` / `Get.offAllNamed()`
- 🧱 **Per-route Bindings** for clean dependency injection

---

## 📐 Platforms & minimum size

| Platform | Minimum size | Enforcement |
|---|---|---|
| Windows / macOS / Linux | **1080 × 600** | `window_manager` `setMinimumSize()` — OS blocks resizing smaller |
| Web | **1080 × 600** | CSS `min-width / min-height` on `html, body` — page becomes scrollable below |
| Mobile (iOS / Android) | n/a | Adaptive UI |
| Wide-layout breakpoint | **1080 px** | Split-pane (brand panel + form/illustration) kicks in |

---

## 🏗️ Project structure (Clean GetX Architecture)

```
lib/
├── main.dart                          ← Bootstraps window_manager, theme, GetMaterialApp
└── app/
    ├── routes/
    │   ├── app_routes.dart            ← Route NAME constants (Routes.splash, Routes.auth, …)
    │   └── app_pages.dart             ← GetPage list (page + binding + transition)
    ├── bindings/
    │   ├── initial_binding.dart       ← App-wide deps (ThemeController, permanent)
    │   ├── splash_binding.dart
    │   ├── onboarding_binding.dart
    │   └── auth_binding.dart
    ├── modules/
    │   ├── splash/
    │   │   ├── controllers/splash_controller.dart
    │   │   └── views/splash_view.dart
    │   ├── onboarding/
    │   │   ├── controllers/onboarding_controller.dart
    │   │   └── views/onboarding_view.dart
    │   └── auth/
    │       ├── controllers/auth_controller.dart
    │       └── views/auth_view.dart
    ├── data/
    │   └── models/slide_model.dart    ← SlideModel + SlidePalette + kSlides
    └── core/
        ├── constants/
        │   ├── app_colors.dart        ← Brand palette
        │   └── app_sizes.dart         ← minDesktop, titleBarHeight, breakpoint
        ├── theme/
        │   ├── app_theme.dart         ← Material 3 light + dark
        │   └── theme_controller.dart  ← Reactive isDark + toggle()
        └── widgets/                   ← Shared, dumb widgets
            ├── window_title_bar.dart  ← 56-px branded chrome (desktop only)
            ├── top_bar.dart
            ├── page_indicator.dart
            ├── cta_buttons.dart       ← PrimaryCta + FinishCta
            └── slide_art.dart         ← CustomPainter illustrations
```

This is the **standard GetX clean architecture** (modules → controllers + views, bindings, data layer, core utilities). Each route's controller is created on demand by its binding, so memory is freed automatically when the route is closed.

---

## 🧭 Navigation (named routes only)

All navigation goes through the route constants in `app/routes/app_routes.dart`:

```dart
// Inside a controller / view:
Get.toNamed(Routes.auth);          // push
Get.offNamed(Routes.auth);         // replace
Get.offAllNamed(Routes.onboarding); // clear stack and push
```

**Where each route is triggered:**
| From | To | Call |
|---|---|---|
| `SplashController.onReady` (after 2.6 s) | Onboarding | `Get.offAllNamed(Routes.onboarding)` |
| Onboarding → "Get Started" on last slide | Auth | `Get.toNamed(Routes.auth)` |
| Onboarding → "Skip" | Auth | `Get.offAllNamed(Routes.auth)` |

To add a new route:
1. Add a constant in `app_routes.dart` (e.g. `static const home = '/home';`).
2. Create `modules/home/{controllers,views}/...`.
3. Create `bindings/home_binding.dart`.
4. Add a `GetPage(...)` entry to `app_pages.dart`.
5. Navigate with `Get.toNamed(Routes.home)`.

---

## 🪟 Custom Windows title bar

The screenshot you sent showed the standard small Windows title bar (the one with the tiny app icon, "M Daddy" text and the X/□/− buttons). We **hide** that with `windowManager.setTitleBarStyle(TitleBarStyle.hidden)` and render our own taller, branded title bar inside Flutter:

- **Height:** 56 px (`AppSizes.titleBarHeight`) — much larger than the default ~30 px
- **Left:** Brand badge + "M Daddy"
- **Middle:** Drag region (drag to move, double-click to maximize)
- **Right:** Theme toggle, then min / max / close buttons (close turns red on hover, like Windows)
- **Theme-aware:** background, borders and icon colors all flip with light/dark mode
- **Desktop-only:** `WindowTitleBar` returns `SizedBox.shrink()` on web/mobile; `WindowChrome` wraps every page automatically

Implementation lives in `lib/app/core/widgets/window_title_bar.dart`. Every view's `Scaffold(body: WindowChrome(child: ...))` gets the title bar for free.

---

## 🌑 No white flash on launch

We kill the white flash at four layers so it's bulletproof:

1. **`web/index.html`** — `html, body { background: #ECFDF5 }` (or `#050813` if `prefers-color-scheme: dark`) + a small HTML splash that auto-removes when Flutter renders its first frame.
2. **`window_manager`** — `WindowOptions(backgroundColor: AppColors.splashBgLight)` so the native window opens already brand-coloured.
3. **`AppTheme`** — both `light()` and `dark()` set `scaffoldBackgroundColor` to the brand splash colour.
4. **`MaterialApp.builder`** — wraps every page in a brand-coloured `Container` so route transitions never expose white.

---

## 🚀 Run it

```bash
flutter pub get

flutter run -d chrome     # Web (requires viewport ≥ 1080 × 600 to avoid scroll)
flutter run -d windows    # Windows desktop (will open at 1080×600, can't shrink)
flutter run -d android    # Android
flutter run -d ios        # iOS
```

> First-time desktop setup: `flutter config --enable-windows-desktop` (or `--enable-macos-desktop`, `--enable-linux-desktop`).

---

## 📦 Dependencies

| Package | Why |
|---|---|
| `get: ^4.6.6` | State management, dependency injection, named routing |
| `window_manager: ^0.3.9` | Desktop window control (size, hidden title bar, drag, min/max/close) |

---

## 🧠 GetX patterns used (cheat sheet)

| Pattern | Example |
|---|---|
| Reactive state | `RxBool isDark = false.obs;` → `Obx(() => …)` |
| Dependency injection | `Get.put(ThemeController(), permanent: true)` (in `InitialBinding`) |
| Lazy DI per route | `Get.lazyPut(() => AuthController())` (in `AuthBinding`) |
| Find a controller | `Get.find<ThemeController>()` |
| View ↔ Controller link | `class AuthView extends GetView<AuthController>` → use `controller.xxx` |
| Named routing | `Get.toNamed(Routes.auth)` / `Get.offAllNamed(Routes.onboarding)` |
| Snackbar / dialog | `Get.snackbar(...)`, `Get.dialog(...)`, `Get.bottomSheet(...)` |

---

Made with care for shopkeepers · v1.0
