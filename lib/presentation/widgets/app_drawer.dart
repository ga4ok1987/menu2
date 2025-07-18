import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Center(
              child: Column(
                children: [
                  const Text(
                    'Ресторан',
                    style: TextStyle(color: AppColors.black, fontSize: 15),
                  ),
                  const Text(
                    '"Файний Кременець"',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              context.go('/add');
            },
          ),

          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text(
              'вулиця Тараса Шевченка, 1, Кременець, Тернопільська область, Україна',
              style: TextStyle(color: AppColors.black, fontSize: 12),
            ),
            trailing: const Icon(Icons.open_in_new),
            onTap: () {
              context.go('/'); // або context.push('/')
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('+38099-00-99-999'),
            onTap: () {
              context.go('/add');
            },
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('fainyi_krmenets@gmai.com'),
            onTap: () {
              context.go('/settings');
            },
          ),
        ],
      ),
    );
  }
}
