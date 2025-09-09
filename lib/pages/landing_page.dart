import 'package:flutter/material.dart';
import 'package:scrapkart_web/core/widgets/info_card.dart';
import 'package:scrapkart_web/core/widgets/section.dart';
import 'package:scrapkart_web/core/widgets/section_title.dart';
// import 'info_card.dart';
// import 'section.dart';
// import 'section_title.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: const Text(
          "Scrapkart",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("🚧 Under Maintenance"),
                  content: const Text(
                    "The login feature is currently unavailable.\n"
                    "Please check back in the next update.",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(), // closes popup
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
            },
            child: const Text("Login", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // ✅ Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              color: Colors.blue.shade50,
              child: Column(
                children: const [
                  Text(
                    "Welcome to Scrapkart",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "A platform for buying and selling vehicle parts.\n"
                    "Fast • Secure • Reliable",
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // ✅ About Us Section
            const Section(
              title: "About Us",
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Scrapkart helps insurance companies, vendors, and clients "
                    "to efficiently manage vehicle parts sales and purchases. "
                    "Our mission is to provide a transparent and reliable marketplace.",
                    style: TextStyle(fontSize: 16, height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            // ✅ How It Works Section
            Section(
              title: "How It Works",
              children: [
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: const [
                    InfoCard(
                      icon: Icons.upload_file,
                      title: "Upload Parts",
                      description: "Insurance team uploads part photos & invoice.",
                    ),
                    InfoCard(
                      icon: Icons.assignment,
                      title: "Get Quotation",
                      description: "Scrapkart prepares & sends quotation for approval.",
                    ),
                    InfoCard(
                      icon: Icons.approval,
                      title: "Approve & Collect",
                      description: "Once approved, our team collects parts from location.",
                    ),
                    InfoCard(
                      icon: Icons.recycling,
                      title: "Recycle or Scrap",
                      description: "Parts are recycled for sale or scrapped responsibly.",
                    ),
                  ],
                ),
              ],
            ),

            // ✅ Footer
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.blueAccent,
              child: const Text(
                "© 2025 Scrapkart. All rights reserved.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
