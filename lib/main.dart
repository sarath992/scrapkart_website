import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:scrapkart_web/app.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor:Colors.white).copyWith(//added primary and secondary colors
          primary: kBlue,
          secondary: kGreen,
          onPrimary: Colors.white,
          onSecondary: Colors.white
        ),
        // textTheme: textTheme,
         textTheme: Theme.of(context).textTheme.copyWith(
          headlineLarge: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 28), // Title font (no Manrope)
          headlineMedium: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 22), // Section headings (no Manrope)

          // ✅ APPLY MANROPE ONLY FOR BODY TEXT / DESCRIPTION
          bodyLarge: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,//white changes to black
          ),
          bodyMedium: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,//white changes to black
          ),
        ),
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

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFF1E40AF), Color(0xFF16A34A)],
        begin: Alignment.topLeft,
        end:Alignment.topRight)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 2,
          titleSpacing: 24,
          title: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/logo.jpg', height: 36),
                  const SizedBox(width: 12),
                  Text('scrapkart',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color:Colors.white ,//text in blue
                      )),
                ],
              ),
              const SizedBox(height:4),
              
            ],
          ),
          actions: [
            _NavButton(label: 'Home', onTap: () => _scrollTo(homeKey)),
            _NavButton(label: 'About', onTap: () => _scrollTo(aboutKey)),
            _NavButton(label: 'How it works', onTap: () => _scrollTo(howKey)),
            _NavButton(label: 'Contact', onTap: () => _scrollTo(contactKey)),
            TextButton(onPressed: (){
              showDialog(context: context, builder: (ctx)=>const LoginDialog());
            }, child: Text('My Account',style: GoogleFonts.inter(fontWeight: FontWeight.w600,color: Colors.white),)),
            const SizedBox(width: 16),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // HERO
              Section(
                color: Colors.transparent,
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
                              style: GoogleFonts.manrope(
                                fontSize: isWide ? 52 : 36,
                                fontWeight: FontWeight.w800,
                                height: 1.1,
                                color: Colors.white,//white text
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                                "“Scrap Smart, Drive Change” ♻\n"
                  "Join hands with us in creating a cleaner, greener future.",
                              // 'Scrapkart makes selling and buying scrap simple, transparent, and eco-friendly.',
                              textAlign: isWide ? TextAlign.left : TextAlign.center,
                              // 
                              style: GoogleFonts.manrope(fontSize: 18,color: Colors.white),
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
                                    backgroundColor: Colors.white,//blue button
                                    foregroundColor: Colors.blue.shade700,//white text
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 22, vertical: 16),
                                  ),
                                  child: const Text('Get Started'),
                                ),
                                OutlinedButton(
                                  onPressed: () => _scrollTo(contactKey),
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: Colors.white,width: 2),//green border
                                    foregroundColor: Colors.white,//green text
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
                            // mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
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
            'ScrapKart is an innovative and environmentally conscious dedicated automobile scrap dealing company based in Ernakulam, Kerala specializing in the procurement, recycling, and resale of vehicle parts and materials.'
            ' Established in 2025, we aim to contribute to sustainable practices within the automotive industry by offering environmentally responsible solutions for old and damaged vehicles.'
            'Our mission is to transform automotive waste into valuable resources, contributing to a circular economy and a cleaner environment.'
            ' We cater to individual vehicle owners, workshops, garages, insurance companies, and commercial fleets, providing a streamlined and transparent process for scrap disposal.'
                        ,
                       style: Theme.of(context).textTheme.bodyLarge,
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
                title: '1) Upload parts & invoice',
                body: 'Insurance companies upload photos and invoices of excluded spare parts.',
                icon: Icons.upload_file_outlined,
              ),
              InfoCard(
                title: '2) Get quotation',
                body: 'Scrapkart prepares a quotation with pricing and sends it for approval.',
                icon: Icons.description_outlined,
              ),
              InfoCard(
                title: '3) Collection & inspection',
                body: 'Once approved, our team collects the parts, inspects them, and evaluates usability.',
                icon: Icons.fact_check_outlined,
              ),
              
              InfoCard(
                title: '4) Recycle or scrap',
                body: 'Usable parts are recycled and listed in the Scrapkart app. Others are scrapped responsibly.',
                icon: Icons.recycling_outlined,
              ),
               InfoCard(
                title: '5) Sale & delivery',
                body: 'Customers purchase recycled parts via the app, pay securely, and receive doorstep delivery.',
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
                        style: GoogleFonts.manrope(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Email: info.scrapkart@gmail.com   •   Phone: +91-90612-30070',
                        style: GoogleFonts.manrope(color: Colors.white70),
                      ),
                      const SizedBox(height: 24),
                      Divider(color: Colors.white12),
                      const SizedBox(height: 12),
                      Text(
                        '© ${DateTime.now().year} Scrapkart. All rights reserved.',
                        style: GoogleFonts.manrope(color: Colors.white60, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
              Icon(icon, size: 28,color: ScrapkartApp.kBlue,),//blue icons
              const SizedBox(height: 12),
              Text(title,
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w700,
                      color: ScrapkartApp.kBlue)),//title in blue
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
      child: Text(label, style: GoogleFonts.inter(fontWeight: FontWeight.w600,color:Colors.white)),//nav bar in blue, ScrapkartApp.kBlue
    );
  }
}

class LoginDialog extends StatefulWidget {
  const LoginDialog({super.key});

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  String selectedRole = "Client"; // default role
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text("Login", style: GoogleFonts.inter(fontWeight: FontWeight.w700)),
      content: SizedBox(
        width: 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Dropdown role selector
            DropdownButtonFormField<String>(
              value: selectedRole,
              items: const [
                DropdownMenuItem(value: "Admin", child: Text("Login as Admin")),
                DropdownMenuItem(value: "Client", child: Text("Login as Client")),
                DropdownMenuItem(value: "Vendor", child: Text("Login as Vendor")),
              ],
              onChanged: (val) => setState(() => selectedRole = val!),
              decoration: const InputDecoration(
                labelText: "Select Role",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Email field
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Password field
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
       ElevatedButton(
  onPressed: () {
    // Show popup dialog instead of actual login
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("🚧 Under Maintenance"),
          content: const Text(
            "The login feature is currently unavailable.\n"
            "Please check back in the next update.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // close popup
                Navigator.pop(context); // close popup
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: ScrapkartApp.kBlue,
    foregroundColor: Colors.white,
  ),
  child: const Text("Login"),
),


      ],
    );
  }
}

