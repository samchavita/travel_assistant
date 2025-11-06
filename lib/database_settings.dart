import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'database.dart'; // 1. Import your database file (which now has the provider)


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2. MaterialApp must be *inside* ProviderScope
    return MaterialApp(
      title: 'My Drift App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 3. Your app's UI starts here.
      //    You can put SettingsPage here directly to test it.
      home: const SettingsPage(), 
      
      // OR, if you have a HomePage, you would put that here:
      // home: const HomePage(), 
      // ...and then navigate to SettingsPage from your HomePage.
    );
  }
}

  // 2. Change StatelessWidget to ConsumerWidget
class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  // 3. Add WidgetRef ref to the build method
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text('RESET ALL APP DATA'),
          onPressed: () async {
            // Show a confirmation dialog
            final confirmed = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text('This will delete all todos and users. This cannot be undone.'),
                actions: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  TextButton(
                    child: const Text('Reset', style: TextStyle(color: Colors.red)),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              ),
            );

            if (confirmed == true) {
              // 4. Use ref.read() to get your database instance
              final db = ref.read(databaseProvider);
              
              // 5. Call your method!
              await db.clearAllData();

              // Show a success message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('App data has been reset.')),
              );
            }
          },
        ),
      ),
    );
  }
}