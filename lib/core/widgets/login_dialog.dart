import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_colors.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({super.key});

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  String selectedRole = "Client";
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
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
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
                        Navigator.pop(context); // close login dialog
                      },
                      child: const Text("OK"),
                    ),
                  ],
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kBlue,
            foregroundColor: Colors.white,
          ),
          child: const Text("Login"),
        ),
      ],
    );
  }
}
