import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Settings UI Demo',
      theme: ThemeData(
        // Defining the specific Green color from the design
        primaryColor: const Color(0xFF10A37F),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF10A37F),
          secondary: const Color(0xFF10A37F),
        ),
      ),
      home: const ProfileMenuScreen(),
    );
  }
}

// =============================================================================
// SCREEN 1: Main Profile Menu
// =============================================================================

class ProfileMenuScreen extends StatelessWidget {
  const ProfileMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Profile Header
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFD0F0C0), // Light green bg
                            image: const DecorationImage(
                              // Placeholder for the Memoji
                              image: NetworkImage('https://i.pravatar.cc/300?img=5'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Aishat Adewale",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Edit Picture",
                        style: TextStyle(color: Color(0xFF10A37F)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Section: My Account
              _buildSectionHeader("MY ACCOUNT"),
              _buildMenuContainer(
                children: [
                  _buildMenuItem(
                    icon: Icons.person_outline,
                    text: "Personal Information",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PersonalInfoScreen()),
                      );
                    },
                  ),
                  _buildDivider(),
                  // _buildMenuItem(icon: Icons.card_membership, text: "Subscriptions"),
                  // _buildDivider(),
                  // _buildMenuItem(icon: Icons.receipt_long, text: "Purchase History"),
                  // _buildDivider(),
                  _buildMenuItem(icon: Icons.notifications_none, text: "Notifications"),
                ],
              ),

              const SizedBox(height: 20),

              // Section: Security
              _buildSectionHeader("SECURITY"),
              _buildMenuContainer(
                children: [
                  _buildMenuItem(
                    icon: Icons.vpn_key_outlined,
                    text: "Change Password",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChangePasswordScreen()),
                      );
                    },
                  ),
                  _buildDivider(),
                  // _buildMenuItem(icon: Icons.fingerprint, text: "Biometrics"),
                  // _buildDivider(),
                  // _buildMenuItem(icon: Icons.shield_outlined, text: "Security Question"),
                ],
              ),

              const SizedBox(height: 20),

              // Section: Rewards
              _buildSectionHeader("REWARDS AND BENEFITS"),
              _buildMenuContainer(
                children: [
                  _buildMenuItem(icon: Icons.card_giftcard, text: "Referral Program"),
                  _buildDivider(),
                  _buildMenuItem(icon: Icons.confirmation_number_outlined, text: "Redeem"),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuContainer({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFE8F5E9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFF10A37F), size: 20),
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
      onTap: onTap ?? () {},
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, thickness: 0.5, indent: 60, endIndent: 16);
  }
}

// =============================================================================
// SCREEN 2: Personal Information
// =============================================================================

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Information"),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Edit Profile",
                style: TextStyle(color: Color(0xFF10A37F), fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _buildInfoRow("Name", "Aishat Adewale"),
              const Divider(indent: 16, endIndent: 16),
              _buildInfoRow("Email", "adewaleaishat@spemail.com"),
              const Divider(indent: 16, endIndent: 16),
              _buildInfoRow("Phone Number", "+2347085634212"),
              const Divider(indent: 16, endIndent: 16),
              _buildInfoRow("Gender", "Female"),
              const Divider(indent: 16, endIndent: 16),
              _buildInfoRow("Birthday", "09 June, 2024"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// SCREEN 3: Change Password
// =============================================================================

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Current Password",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF10A37F))),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "New Password",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF10A37F))),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Password should be a minimum of 6 characters",
              style: TextStyle(color: Colors.grey[400], fontSize: 11),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF10A37F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Change Password",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Forgot Password? ",
                    style: TextStyle(color: Colors.grey)),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Reset Password",
                    style: TextStyle(
                      color: Color(0xFF10A37F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}