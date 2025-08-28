import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const ScrapkartApp());

class ScrapkartApp extends StatelessWidget {
  const ScrapkartApp({super.key});

  static const Color kBlue = Color(0xFF1E40AF);
  static const Color kGreen = Color(0xFF16A34A);

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.interTextTheme();

    return MaterialApp(
      title: 'Scrapkart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kBlue),
        textTheme: textTheme,
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final howKey = GlobalKey();
  final contactKey = GlobalKey();

  Future<void> _scrollTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx != null) {
      await Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 2,
        titleSpacing: 24,
        title: Row(
          children: [
            Image.asset('assets/logo.jpg', height: 36),
            const SizedBox(width: 12),
            Text('scrapkart',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF111827),
                )),
          ],
        ),
        actions: [
          _NavButton(label: 'Home', onTap: () => _scrollTo(homeKey)),
          _NavButton(label: 'About', onTap: () => _scrollTo(aboutKey)),
          _NavButton(label: 'How it works', onTap: () => _scrollTo(howKey)),
          _NavButton(label: 'Contact', onTap: () => _scrollTo(contactKey)),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HERO
            Section(
              key: homeKey,
              padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Flex(
                  direction: isWide ? Axis.horizontal : Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: isWide ? 6 : 0,
                      child: Column(
                        crossAxisAlignment: isWide
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Turn Waste into Value',
                            textAlign: isWide ? TextAlign.left : TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: isWide ? 52 : 36,
                              fontWeight: FontWeight.w800,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                              "“Scrap Smart, Drive Change” ♻\n"
                "Join hands with us in creating a cleaner, greener future.",
                            // 'Scrapkart makes selling and buying scrap simple, transparent, and eco-friendly.',
                            textAlign: isWide ? TextAlign.left : TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              color: const Color(0xFF374151),
                            ),
                          ),
                          const SizedBox(height: 28),
                          Wrap(
                            alignment:
                                isWide ? WrapAlignment.start : WrapAlignment.center,
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              FilledButton(
                                onPressed: () => _scrollTo(howKey),
                                style: FilledButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 22, vertical: 16),
                                ),
                                child: const Text('Get Started'),
                              ),
                              OutlinedButton(
                                onPressed: () => _scrollTo(contactKey),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 22, vertical: 16),
                                ),
                                child: const Text('Contact Us'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (isWide) const SizedBox(width: 40) else const SizedBox(height: 40),
                    Expanded(
                      flex: isWide ? 5 : 0,
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF1E40AF), Color(0xFF16A34A)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('assets/logo.jpg', height: 120),
                            const SizedBox(height: 16),
                            Text(
                              'Scrapkart',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ABOUT
            Section(
              key: aboutKey,
              color: const Color(0xFFF9FAFB),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle(title: 'About Scrapkart'),
                    const SizedBox(height: 12),
                    Text(
                      'We connect households and businesses with trusted recyclers. '
                      'Our mission is to promote sustainability by making scrap trading effortless and fair.',
                      style: GoogleFonts.inter(fontSize: 16, color: Color(0xFF4B5563)),
                    ),
                  ],
                ),
              ),
            ),

            // HOW IT WORKS
            Section(
              key: howKey,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle(title: 'How it works'),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: const [
                        InfoCard(
                          title: '1) Post your scrap',
                          body:
                              'Tell us what you have. Photos help you get better quotes.',
                          icon: Icons.add_photo_alternate_outlined,
                        ),
                        InfoCard(
                          title: '2) Get the best price',
                          body:
                              'Receive offers from verified buyers and choose the best.',
                          icon: Icons.price_check_outlined,
                        ),
                        InfoCard(
                          title: '3) Pickup & payout',
                          body:
                              'Schedule pickup at your convenience and get paid quickly.',
                          icon: Icons.local_shipping_outlined,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // CONTACT / FOOTER
            Section(
              key: contactKey,
              color: const Color(0xFF0B1220),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get in touch',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Email: hello@scrapkart.example   •   Phone: +91-00000-00000',
                      style: GoogleFonts.inter(color: Colors.white70),
                    ),
                    const SizedBox(height: 24),
                    Divider(color: Colors.white12),
                    const SizedBox(height: 12),
                    Text(
                      '© ${DateTime.now().year} Scrapkart. All rights reserved.',
                      style: GoogleFonts.inter(color: Colors.white60, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry padding;

  const Section({
    super.key,
    required this.child,
    this.color,
    this.padding = const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: color ?? Colors.white,
      padding: padding,
      child: child,
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w800),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String body;
  final IconData icon;

  const InfoCard({
    super.key,
    required this.title,
    required this.body,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;
    final cardWidth = isWide ? 340.0 : double.infinity;

    return SizedBox(
      width: cardWidth,
      child: Card(
        elevation: 0,
        color: const Color(0xFFF3F4F6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 28),
              const SizedBox(height: 12),
              Text(title,
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Text(body,
                  style: GoogleFonts.inter(
                      fontSize: 14, color: Color(0xFF4B5563))),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _NavButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(label, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
    );
  }
}
