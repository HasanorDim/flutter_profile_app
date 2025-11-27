import 'package:flutter/material.dart';
import 'package:profile_app_/provider/theme_manager.dart';

class InterestsPage extends StatelessWidget {
  final List<String> interests;

  const InterestsPage({super.key, required this.interests});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeManager().isDarkMode,
      builder: (context, isDarkMode, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: isDarkMode ? _buildDarkGradient() : _buildLightGradient(),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text('Interests & Passions'),
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                IconButton(
                  icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                  onPressed: () {
                    ThemeManager().toggleTheme();
                  },
                  tooltip: 'Toggle theme',
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Interests & Passions",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 3,
                        ),
                    itemCount: interests.length,
                    itemBuilder: (context, index) {
                      return _buildInterestCard(interests[index], context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInterestCard(String interest, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(
            _getInterestIcon(interest),
            size: 16,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              interest,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getInterestIcon(String interest) {
    switch (interest.toLowerCase()) {
      case 'mobile development':
        return Icons.phone_android;
      case 'web technologies':
        return Icons.language;
      case 'devops':
        return Icons.developer_mode_sharp;
      case 'open source':
        return Icons.code;
      case 'tech communities':
        return Icons.people;
      case 'continuous learning':
        return Icons.school;
      case 'problem solving':
        return Icons.psychology;
      default:
        return Icons.favorite;
    }
  }

  // Light Mode Gradient
  LinearGradient _buildLightGradient() {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromARGB(255, 238, 241, 244),
        Color.fromARGB(255, 208, 228, 245),
        Color.fromARGB(255, 146, 179, 205),
      ],
      stops: [0.0, 0.5, 1.0],
    );
  }

  // Dark Mode Gradient
  LinearGradient _buildDarkGradient() {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF121212), Color(0xFF1E1E1E), Color(0xFF2D2D2D)],
      stops: [0.0, 0.5, 1.0],
    );
  }
}
