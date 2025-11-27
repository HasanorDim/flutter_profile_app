import 'package:flutter/material.dart';
import 'package:profile_app_/model/user_profile.dart';

class InfoSection extends StatelessWidget {
  final UserProfile profile;

  const InfoSection({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("About", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Text(
          profile.bio,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),
        Text("Contact", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        _buildContactItem(Icons.email, profile.email, context),
        if (profile.phone != null)
          _buildContactItem(Icons.phone, profile.phone!, context),
        _buildContactItem(Icons.location_on, profile.location, context),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
