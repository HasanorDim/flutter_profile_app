import 'package:flutter/material.dart';
import 'package:profile_app_/mock_data/mock_data.dart';
import 'package:profile_app_/model/user_profile.dart';
import 'package:profile_app_/provider/theme_manager.dart';
import 'package:profile_app_/widgets/projects_section.dart';
import 'package:profile_app_/widgets/shadow_card.dart';

class ExperiencePage extends StatelessWidget {
  final List<WorkExperience> experiences;

  const ExperiencePage({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    final profile = MockData.getProfileData();

    return ValueListenableBuilder<bool>(
      valueListenable: ThemeManager().isDarkMode,
      builder: (context, isDarkMode, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: isDarkMode ? _buildDarkGradient() : _buildLightGradient(),
          ),

          child: Scaffold(
            backgroundColor: Colors.transparent, // 5. Make Scaffold transparent
            appBar: AppBar(
              title: Text(
                "Work Experience",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              backgroundColor: Colors.transparent, // 6. Transparent AppBar
              elevation: 0, // 7. No shadow
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
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Column(
                    children: experiences.asMap().entries.map((entry) {
                      final index = entry.key;
                      final exp = entry.value;
                      return _buildExperienceItem(exp, index, context);
                    }).toList(),
                  ),

                  const SizedBox(height: 24),
                  ShadowCard(
                    isDark: isDarkMode,
                    child: ProjectsSection(projects: profile.projects),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildExperienceItem(
    WorkExperience exp,
    int index,
    BuildContext context,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: index == experiences.length - 1 ? 0 : 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.business_center,
              color: Theme.of(context).colorScheme.onSecondary,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exp.position,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  exp.company,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  exp.period,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: exp.responsibilities.map((responsibility) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6, right: 8),
                            child: Icon(
                              Icons.play_arrow,
                              size: 12,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              responsibility,
                              style: TextStyle(
                                fontSize: 13,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.7),
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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

  LinearGradient _buildDarkGradient() {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF121212), Color(0xFF1E1E1E), Color(0xFF2D2D2D)],
      stops: [0.0, 0.5, 1.0],
    );
  }
}
