import 'package:flutter/material.dart';

// --- Custom Colors ---
const Color kGreenAccent = Color(0xFF1CB954); // A vibrant green
const Color kLightGrey = Color(0xFFF0F0F0); // Very light grey background

void main() {
  runApp(const ChatbotApp());
}

class ChatbotApp extends StatelessWidget {
  const ChatbotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guidebook Chatbot Input',
      debugShowCheckedModeBanner: false, // <-- Removed debug banner
      theme: ThemeData(
        fontFamily: 'Inter', // Using a common modern font like Inter (or system default)
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const ChatbotInputScreen(),
    );
  }
}

class ChatbotInputScreen extends StatelessWidget {
  const ChatbotInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Use a Column to place the scrollable content above the fixed input bar
        child: Column(
          children: <Widget>[
            // --- 1. Scrollable Content (Greeting, Sphere, Instructions) ---
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 32),

                    // --- Custom Green Sphere/Gradient Element ---
                    Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: kGreenAccent.withOpacity(0.5),
                              blurRadius: 25,
                              spreadRadius: 8,
                            ),
                          ],
                          // Simple radial gradient to mimic the light/glow
                          gradient: RadialGradient(
                            colors: [
                              kGreenAccent.withOpacity(0.8),
                              kGreenAccent.withOpacity(0.3),
                              Colors.white.withOpacity(0),
                            ],
                            stops: const [0.0, 0.4, 1.0],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // --- Greeting Text ---
                    // const Text(
                    //   'Good evening, Milovan',
                    //   style: TextStyle(
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // const SizedBox(height: 8),
                    const Text(
                      'Can I help you with anything?',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // --- Instructions ---
                    const Text(
                      'Write your prompt below to start chatting with us',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),

            // --- 2. Fixed Input Area (Always at the bottom) ---
            const BottomInputArea(),
          ],
        ),
      ),
    );
  }
}

// --- Extracted Widget for the fixed bottom input and footer text ---
class BottomInputArea extends StatelessWidget {
  const BottomInputArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Use min size for column
        children: [
          const Text(
            'How can we help you today?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: kLightGrey.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                // "Formal" Dropdown Look
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: const Row(
                    children: [
                      Text('Formal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      Icon(Icons.keyboard_arrow_down, size: 20),
                    ],
                  ),
                ),
                // Using TextField in place of Spacer for text input capability
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type your prompt here...',
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      maxLines: 1,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                const Icon(Icons.camera_alt_outlined, color: Colors.teal),
                const SizedBox(width: 12),
                const Icon(Icons.attach_file, color: Colors.teal),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Please double-check responses.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}