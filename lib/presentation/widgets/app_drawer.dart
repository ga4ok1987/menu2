import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:menu2/domain/entities/info_entity.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';

class AppDrawer extends StatelessWidget {
  final InfoEntity info;
  const AppDrawer({super.key, required this.info});

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
                  AppGaps.gap16,
                  Text(
                    '"${info.name}"',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: AppTextSizes.large,
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
            title: Text(
              info.address,
              style: const TextStyle(color: AppColors.black, fontSize: AppTextSizes.small),
            ),
            trailing: const Icon(Icons.open_in_new),
            onTap: () {
              context.go('/'); // або context.push('/')
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title:  Text(info.phone),
            onTap: () {
              context.go('/add');
            },
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title:  Text(info.email),
            onTap: () {
              context.go('/settings');
            },
          ),
        ],
      ),
    );
  }
}
