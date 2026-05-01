import 'package:e_commerce_pos_sale/core/components/widgets/window_title_bar.dart';
import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';
import 'package:e_commerce_pos_sale/modules/startUp/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowChrome(
        child: Obx(() {
          final isDark = controller.themeController.isDark.value;
          final p = _AuthPalette(isDark);
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: p.bg,
              ),
            ),
            child: Stack(
              children: [
                if (isDark) ..._neonOrbs(p),
                if (isDark) _grid(),
                if (!isDark) ..._lightOrbs(p),
                SafeArea(
                  child: LayoutBuilder(
                    builder: (context, box) {
                      final isWide = box.maxWidth >= AppSizes.wideBreakpoint;
                      return isWide
                          ? _WideAuth(p: p, isDark: isDark)
                          : _CompactAuth(p: p, isDark: isDark);
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  List<Widget> _neonOrbs(_AuthPalette p) => [
        Positioned(left: -160, top: -160, child: _Orb(color: p.accent, size: 500, opacity: 0.4)),
        Positioned(right: -180, bottom: -180, child: _Orb(color: p.accent, size: 600, opacity: 0.3)),
      ];
  List<Widget> _lightOrbs(_AuthPalette p) => [
        Positioned(right: -160, top: -160, child: _Orb(color: p.accent, size: 500, opacity: 0.35)),
        Positioned(left: -160, bottom: -160, child: _Orb(color: p.accent, size: 500, opacity: 0.35)),
      ];
  Widget _grid() => Positioned.fill(
        child: IgnorePointer(child: CustomPaint(painter: _GridPainter())),
      );
}

/* ---------- Palette ---------- */

class _AuthPalette {
  final bool isDark;
  _AuthPalette(this.isDark);

  List<Color> get bg => isDark ? gradientDark : gradientLight;
  Color get accent => isDark ? accentDark : accentLight;
  Color get glow => glowColor(isDark);
  Color get text => isDark ? textDark : textLight;
  Color get muted => isDark ? mutedDark : mutedLight;
  Color get cardBg => isDark
      ? Colors.white.withValues(alpha: 0.04)
      : Colors.white.withValues(alpha: 0.6);
  Color get border => isDark
      ? Colors.white.withValues(alpha: 0.08)
      : const Color(0xFF0F172A).withValues(alpha: 0.06);
  Color get fieldBg => isDark ? Colors.white.withValues(alpha: 0.04) : Colors.white;
  Color get fieldBorder => isDark
      ? Colors.white.withValues(alpha: 0.10)
      : const Color(0xFF0F172A).withValues(alpha: 0.10);
  Color get divider => isDark
      ? Colors.white.withValues(alpha: 0.10)
      : const Color(0xFF0F172A).withValues(alpha: 0.10);
  Color get onAccent => isDark ? const Color(0xFF0F172A) : Colors.white;
}

/* ---------- Orbs / grid ---------- */

class _Orb extends StatelessWidget {
  final Color color;
  final double size;
  final double opacity;
  const _Orb({required this.color, required this.size, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color.withValues(alpha: opacity), color.withValues(alpha: 0)],
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.04)
      ..strokeWidth = 1;
    const step = 48.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter old) => false;
}

/* ---------- Compact / Wide ---------- */

class _CompactAuth extends StatelessWidget {
  final _AuthPalette p;
  final bool isDark;
  const _CompactAuth({required this.p, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        children: [
          _LogoRow(p: p, isDark: isDark),
          const SizedBox(height: 24),
          _FormCard(p: p, isDark: isDark),
        ],
      ),
    );
  }
}

class _WideAuth extends StatelessWidget {
  final _AuthPalette p;
  final bool isDark;
  const _WideAuth({required this.p, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _LogoRow(p: p, isDark: isDark),
                _BrandPitch(p: p, isDark: isDark),
                Text('© ${DateTime.now().year} E-commerce POS. All rights reserved.',
                    style: TextStyle(fontSize: 12, color: p.muted)),
              ],
            ),
          ),
          const SizedBox(width: 40),
          Expanded(child: Center(child: _FormCard(p: p, isDark: isDark))),
        ],
      ),
    );
  }
}

class _LogoRow extends StatelessWidget {
  final _AuthPalette p;
  final bool isDark;
  const _LogoRow({required this.p, required this.isDark});

  @override
  Widget build(BuildContext context) {
    // The brand badge only appears on mobile/web — on desktop the title bar
    // already shows it.
    if (WindowTitleBar.isDesktop) return const SizedBox.shrink();
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: p.accent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: p.glow,
                  blurRadius: isDark ? 22 : 18,
                  offset: const Offset(0, 8)),
            ],
          ),
          child: Icon(Icons.show_chart_rounded,
              color: p.onAccent, size: 20),
        ),
        const SizedBox(width: 10),
        Text('E-COMMERCE POS',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 9,
              letterSpacing: 1.4,
              color: p.accent,
              height: 1.2,
            )),
      ],
    );
  }
}

class _BrandPitch extends StatelessWidget {
  final _AuthPalette p;
  final bool isDark;
  const _BrandPitch({required this.p, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final bullets = const [
      'Real-time sales & profit tracking',
      'Low-stock alerts before you run out',
      'Beautiful charts to spot what sells',
    ];
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 480),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'E-COMMERCE POS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 2.6,
              color: p.accent,
              shadows:
                  isDark ? [Shadow(color: p.glow, blurRadius: 18)] : null,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Sales · Inventory · Insights',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: p.muted,
            ),
          ),
          const SizedBox(height: 12),
          Text('Run your shop\nlike a pro.',
              style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w800,
                height: 1.05,
                letterSpacing: -1.2,
                color: p.text,
              )),
          const SizedBox(height: 16),
          Text(
            'Track every sale, manage stock in real-time, and grow with insights — all from your phone, tablet, or PC.',
            style: TextStyle(fontSize: 16, height: 1.5, color: p.muted),
          ),
          const SizedBox(height: 28),
          ...bullets.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: p.accent,
                        shape: BoxShape.circle,
                        boxShadow: isDark
                            ? [BoxShadow(color: p.glow, blurRadius: 12)]
                            : null,
                      ),
                      child: Icon(Icons.check_rounded,
                          size: 14, color: p.onAccent),
                    ),
                    const SizedBox(width: 12),
                    Text(s, style: TextStyle(fontSize: 14, color: p.text)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class _FormCard extends StatelessWidget {
  final _AuthPalette p;
  final bool isDark;
  const _FormCard({required this.p, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 460),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: p.cardBg,
          border: Border.all(color: p.border),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.6)
                  : Colors.black.withValues(alpha: 0.18),
              blurRadius: 80,
              offset: const Offset(0, 30),
              spreadRadius: -20,
            ),
          ],
        ),
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder: (child, anim) => FadeTransition(
                    opacity: anim,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.1),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(
                          parent: anim, curve: Curves.easeOutCubic)),
                      child: child,
                    ),
                  ),
                  child: Column(
                    key: ValueKey(auth.mode.value),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        auth.isSignUp
                            ? 'Create your account'
                            : 'Welcome back',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                          letterSpacing: -0.5,
                          color: p.text,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        auth.isSignUp
                            ? 'Start tracking sales in under a minute.'
                            : 'Sign in to pick up where you left off.',
                        style: TextStyle(fontSize: 14, color: p.muted),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                _ModeToggle(p: p, isDark: isDark),
                const SizedBox(height: 22),
                if (auth.isSignUp) ...[
                  _Field(
                    controller: auth.nameCtrl,
                    label: 'Full Name',
                    hint: 'Riya Sharma',
                    icon: Icons.person_outline_rounded,
                    p: p,
                    isDark: isDark,
                  ),
                  const SizedBox(height: 14),
                ],
                _Field(
                  controller: auth.emailCtrl,
                  label: 'Email',
                  hint: 'you@m-daddy.app',
                  icon: Icons.mail_outline_rounded,
                  keyboardType: TextInputType.emailAddress,
                  p: p,
                  isDark: isDark,
                ),
                const SizedBox(height: 14),
                _PasswordField(p: p, isDark: isDark),
                const SizedBox(height: 16),
                if (auth.isSignUp)
                  _AgreeRow(p: p, isDark: isDark)
                else
                  _RememberRow(p: p, isDark: isDark),
                const SizedBox(height: 18),
                _PrimaryButton(p: p, isDark: isDark),
                const SizedBox(height: 16),
                _Divider(p: p),
                const SizedBox(height: 16),
                _SocialRow(p: p, isDark: isDark),
                const SizedBox(height: 18),
                _FooterToggle(p: p, isDark: isDark),
              ],
            )),
      ),
    );
  }
}

class _ModeToggle extends StatelessWidget {
  final _AuthPalette p;
  final bool isDark;
  const _ModeToggle({required this.p, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    return LayoutBuilder(builder: (context, box) {
      final pillW = (box.maxWidth - 8) / 2;
      return Container(
        height: 48,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withValues(alpha: 0.05)
              : const Color(0xFF0F172A).withValues(alpha: 0.06),
          border: Border.all(color: p.border),
          borderRadius: BorderRadius.circular(99),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutCubic,
              alignment: auth.isSignUp
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                width: pillW,
                height: 40,
                decoration: BoxDecoration(
                  color: p.accent,
                  borderRadius: BorderRadius.circular(99),
                  boxShadow: [
                    BoxShadow(
                      color: p.glow,
                      blurRadius: isDark ? 18 : 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                _ToggleTab(
                  label: 'Sign In',
                  active: !auth.isSignUp,
                  activeColor: p.onAccent,
                  inactiveColor: p.muted,
                  onTap: () => auth.setMode(AuthMode.signIn),
                ),
                _ToggleTab(
                  label: 'Sign Up',
                  active: auth.isSignUp,
                  activeColor: p.onAccent,
                  inactiveColor: p.muted,
                  onTap: () => auth.setMode(AuthMode.signUp),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class _ToggleTab extends StatelessWidget {
  final String label;
  final bool active;
  final Color activeColor;
  final Color inactiveColor;
  final VoidCallback onTap;
  const _ToggleTab({
    required this.label,
    required this.active,
    required this.activeColor,
    required this.inactiveColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: active ? activeColor : inactiveColor,
            ),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}

class _Field extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final _AuthPalette p;
  final bool isDark;
  const _Field({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    required this.p,
    required this.isDark,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<_Field> createState() => _FieldState();
}

class _FieldState extends State<_Field> {
  final FocusNode _node = FocusNode();
  bool _focused = false;
  @override
  void initState() {
    super.initState();
    _node.addListener(() => setState(() => _focused = _node.hasFocus));
  }

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.p;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w600, color: p.muted)),
        const SizedBox(height: 6),
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: p.fieldBg,
            border: Border.all(
                color: _focused ? p.accent : p.fieldBorder, width: 1.5),
            borderRadius: BorderRadius.circular(18),
            boxShadow: _focused
                ? [
                    BoxShadow(
                      color: p.glow.withValues(alpha: widget.isDark ? 0.35 : 0.25),
                      blurRadius: 18,
                      spreadRadius: 1,
                    ),
                  ]
                : null,
          ),
          child: Row(
            children: [
              Icon(widget.icon,
                  size: 18, color: _focused ? p.accent : p.muted),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: _node,
                  keyboardType: widget.keyboardType,
                  style: TextStyle(fontSize: 14, color: p.text),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    hintText: widget.hint,
                    hintStyle: TextStyle(
                        color: p.muted.withValues(alpha: 0.7), fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PasswordField extends StatefulWidget {
  final _AuthPalette p;
  final bool isDark;
  const _PasswordField({required this.p, required this.isDark});

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  final FocusNode _node = FocusNode();
  bool _focused = false;
  @override
  void initState() {
    super.initState();
    _node.addListener(() => setState(() => _focused = _node.hasFocus));
  }

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    final p = widget.p;
    return Obx(() {
      final obscure = auth.obscurePassword.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Password',
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w600, color: p.muted)),
          const SizedBox(height: 6),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: p.fieldBg,
              border: Border.all(
                  color: _focused ? p.accent : p.fieldBorder, width: 1.5),
              borderRadius: BorderRadius.circular(18),
              boxShadow: _focused
                  ? [
                      BoxShadow(
                        color:
                            p.glow.withValues(alpha: widget.isDark ? 0.35 : 0.25),
                        blurRadius: 18,
                        spreadRadius: 1,
                      ),
                    ]
                  : null,
            ),
            child: Row(
              children: [
                Icon(Icons.lock_outline_rounded,
                    size: 18, color: _focused ? p.accent : p.muted),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: auth.passwordCtrl,
                    focusNode: _node,
                    obscureText: obscure,
                    style: TextStyle(fontSize: 14, color: p.text),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: auth.isSignUp ? 'Min 8 characters' : '••••••••',
                      hintStyle: TextStyle(
                          color: p.muted.withValues(alpha: 0.7), fontSize: 14),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: auth.togglePassword,
                  icon: Icon(
                    obscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: 18,
                    color: p.muted,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class _AgreeRow extends StatelessWidget {
  final _AuthPalette p;
  final bool isDark;
  const _AgreeRow({required this.p, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    return Obx(() => GestureDetector(
          onTap: auth.toggleAgree,
          behavior: HitTestBehavior.opaque,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 18,
                height: 18,
                margin: const EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  color: auth.agree.value ? p.accent : Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: auth.agree.value ? p.accent : p.fieldBorder,
                      width: 1.5),
                  boxShadow: auth.agree.value && isDark
                      ? [BoxShadow(color: p.glow, blurRadius: 8)]
                      : null,
                ),
                child: auth.agree.value
                    ? Icon(Icons.check_rounded, size: 14, color: p.onAccent)
                    : null,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 12, color: p.muted, height: 1.4),
                    children: [
                      const TextSpan(text: 'I agree to the '),
                      TextSpan(
                          text: 'Terms',
                          style: TextStyle(
                              color: p.accent,
                              fontWeight: FontWeight.w700)),
                      const TextSpan(text: ' and '),
                      TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                              color: p.accent,
                              fontWeight: FontWeight.w700)),
                      const TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class _RememberRow extends StatelessWidget {
  final _AuthPalette p;
  final bool isDark;
  const _RememberRow({required this.p, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: auth.toggleRemember,
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: [
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: auth.rememberMe.value
                          ? p.accent
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: auth.rememberMe.value
                              ? p.accent
                              : p.fieldBorder,
                          width: 1.5),
                      boxShadow: auth.rememberMe.value && isDark
                          ? [BoxShadow(color: p.glow, blurRadius: 8)]
                          : null,
                    ),
                    child: auth.rememberMe.value
                        ? Icon(Icons.check_rounded,
                            size: 14, color: p.onAccent)
                        : null,
                  ),
                  const SizedBox(width: 8),
                  Text('Remember me',
                      style: TextStyle(fontSize: 12, color: p.muted)),
                ],
              ),
            ),
            Text('Forgot password?',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: p.accent)),
          ],
        ));
  }
}

class _PrimaryButton extends StatefulWidget {
  final _AuthPalette p;
  final bool isDark;
  const _PrimaryButton({required this.p, required this.isDark});

  @override
  State<_PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<_PrimaryButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _shimmer;
  @override
  void initState() {
    super.initState();
    _shimmer = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000))
      ..repeat();
  }

  @override
  void dispose() {
    _shimmer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    final p = widget.p;
    return Obx(() {
      final loading = auth.isSubmitting.value;
      return GestureDetector(
        onTap: loading ? null : auth.submit,
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [p.accent, p.accent.withValues(alpha: 0.86)],
            ),
            borderRadius: BorderRadius.circular(99),
            boxShadow: [
              BoxShadow(
                color: p.glow,
                blurRadius: widget.isDark ? 36 : 28,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: _shimmer,
                  builder: (_, _) => Positioned.fill(
                    child: Transform.translate(
                      offset: Offset((_shimmer.value * 600) - 300, 0),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withValues(alpha: 0),
                              Colors.white.withValues(alpha: 0.35),
                              Colors.white.withValues(alpha: 0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (loading)
                  SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: p.onAccent,
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 6, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          auth.isSignUp ? 'Create Account' : 'Sign In',
                          style: TextStyle(
                              color: p.onAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3),
                        ),
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                              color: p.onAccent, shape: BoxShape.circle),
                          child: Icon(Icons.arrow_forward_rounded,
                              color: p.accent, size: 20),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class _Divider extends StatelessWidget {
  final _AuthPalette p;
  const _Divider({required this.p});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(height: 1, color: p.divider)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text('OR CONTINUE WITH',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: p.muted,
                letterSpacing: 1.4,
              )),
        ),
        Expanded(child: Container(height: 1, color: p.divider)),
      ],
    );
  }
}

class _SocialRow extends StatelessWidget {
  final _AuthPalette p;
  final bool isDark;
  const _SocialRow({required this.p, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    return Row(
      children: [
        Expanded(
          child: _SocialButton(
            onTap: auth.signInWithGoogle,
            label: 'Google',
            icon: const _GoogleLogo(),
            p: p,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _SocialButton(
            onTap: auth.signInWithApple,
            label: 'Apple',
            icon: Icon(Icons.apple, size: 18, color: p.text),
            p: p,
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Widget icon;
  final _AuthPalette p;
  const _SocialButton(
      {required this.onTap,
      required this.label,
      required this.icon,
      required this.p});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: p.fieldBg,
          border: Border.all(color: p.fieldBorder, width: 1.5),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 8),
            Text(label,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: p.text)),
          ],
        ),
      ),
    );
  }
}

class _GoogleLogo extends StatelessWidget {
  const _GoogleLogo();
  @override
  Widget build(BuildContext context) =>
      const SizedBox(width: 18, height: 18, child: CustomPaint(painter: _GoogleLogoPainter()));
}

class _GoogleLogoPainter extends CustomPainter {
  const _GoogleLogoPainter();
  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width;
    void arc(double startDeg, double sweepDeg, Color c) {
      final rect = Rect.fromCircle(
          center: Offset(s / 2, s / 2), radius: s * 0.42);
      canvas.drawArc(
        rect,
        startDeg * 3.14159 / 180,
        sweepDeg * 3.14159 / 180,
        false,
        Paint()
          ..color = c
          ..style = PaintingStyle.stroke
          ..strokeWidth = s * 0.18
          ..strokeCap = StrokeCap.butt,
      );
    }

    arc(-90, 90, const Color(0xFF4285F4));
    arc(0, 90, const Color(0xFF34A853));
    arc(90, 90, const Color(0xFFFBBC05));
    arc(180, 90, const Color(0xFFEA4335));
  }

  @override
  bool shouldRepaint(covariant _GoogleLogoPainter old) => false;
}

class _FooterToggle extends StatelessWidget {
  final _AuthPalette p;
  final bool isDark;
  const _FooterToggle({required this.p, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    return Center(
      child: GestureDetector(
        onTap: auth.toggleMode,
        child: Obx(() => RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 14, color: p.muted),
                children: [
                  TextSpan(
                      text: auth.isSignUp
                          ? 'Already have an account? '
                          : "Don't have an account? "),
                  TextSpan(
                    text: auth.isSignUp ? 'Sign in' : 'Sign up',
                    style: TextStyle(
                        color: p.accent, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
