import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: colorScheme.secondary,
            ),
            child: Text(
              'My App',
              style: TextStyle(
                color: colorScheme.onSecondary,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: colorScheme.onSurface),
            title: Text('Home', style: TextStyle(color: colorScheme.onSurface)),
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: colorScheme.onSurface),
            title: Text('Settings', style: TextStyle(color: colorScheme.onSurface)),
            onTap: () => Navigator.pushNamed(context, '/settings'),
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: colorScheme.onSurface),
            title: Text('Logout', style: TextStyle(color: colorScheme.onSurface)),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
