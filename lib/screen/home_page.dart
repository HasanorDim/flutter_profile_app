import 'package:flutter/material.dart';
import 'package:profile_app_/mock_data/mock_data.dart';
import 'package:profile_app_/provider/theme_manager.dart';
import 'package:profile_app_/routes/main.route.dart';
import 'package:profile_app_/widgets/contact_button.dart';
import 'package:profile_app_/widgets/info_section.dart';
import 'package:profile_app_/widgets/interests_section.dart';
import 'package:profile_app_/widgets/profile_header.dart';
import 'package:profile_app_/widgets/skills_section.dart';
import 'package:profile_app_/widgets/education_section.dart';
import 'package:profile_app_/widgets/experience_section.dart';
import 'package:profile_app_/widgets/social_media_section.dart';
import 'package:profile_app_/widgets/projects_section.dart';
import 'package:profile_app_/widgets/shadow_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  void _checkIfWeReturned() {
    // This will be called after navigation completes
    if (mounted) {
      setState(() {
        _selectedIndex = 0; // Reset to Home tab
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      AppRoutes.push(AppRoutes.exp).then((_) {
        _checkIfWeReturned();
      });
    } else if (index == 2) {
      AppRoutes.push(AppRoutes.interest).then((_) {
        _checkIfWeReturned();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = MockData.getProfileData();

    return ValueListenableBuilder<bool>(
      valueListenable: ThemeManager().isDarkMode,
      builder: (context, isDarkMode, child) {
        return Scaffold(
          body: Container(
            // Gradient Background
            decoration: BoxDecoration(
              gradient: isDarkMode
                  ? _buildDarkGradient()
                  : _buildLightGradient(),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: const Text('Developer Profile'),
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                    icon: Icon(
                      isDarkMode ? Icons.light_mode : Icons.dark_mode,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
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
                  children: [
                    ProfileHeader(profile: profile),
                    const SizedBox(height: 32),

                    // Info Section with Shadow Card
                    ShadowCard(
                      isDark: isDarkMode,
                      child: InfoSection(profile: profile),
                    ),
                    const SizedBox(height: 24),

                    // Skills Section with Shadow Card
                    ShadowCard(
                      isDark: isDarkMode,
                      child: SkillsSection(skills: profile.skills),
                    ),
                    const SizedBox(height: 24),

                    // Education Section with Shadow Card
                    ShadowCard(
                      isDark: isDarkMode,
                      child: EducationSection(education: profile.education),
                    ),
                    const SizedBox(height: 24),

                    ShadowCard(
                      isDark: isDarkMode,
                      child: SocialMediaSection(
                        socialMedia: profile.socialMedia,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Contact Section with Shadow Card
                    ShadowCard(
                      isDark: isDarkMode,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Get In Touch",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          const SizedBox(height: 16),
                          ContactButton(email: profile.email),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Developer Stats
                    _buildDeveloperStats(context, isDarkMode),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: _buildBottomNavigationBar(context, isDarkMode),
        );
      },
    );
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

  Widget _buildDeveloperStats(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withOpacity(0.05)
            : Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.1)
              : Colors.white.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.5)
                : Colors.blueGrey.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(context, '1+', 'Years Experience', isDark),
          _buildStatItem(context, '10+', 'Skills', isDark),
          _buildStatItem(context, '5+', 'Projects', isDark),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String value,
    String label,
    bool isDark,
  ) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isDark
                ? Colors.white.withOpacity(0.8)
                : Colors.white.withOpacity(0.8),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(
    BuildContext context,
    bool isDarkMode,
  ) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      backgroundColor: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
      selectedItemColor: isDarkMode
          ? const Color(0xFF90CAF9)
          : const Color(0xFF1976D2),
      unselectedItemColor: isDarkMode ? Colors.grey[400] : Colors.grey[600],
      elevation: 8,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Exp & Work'),
        BottomNavigationBarItem(icon: Icon(Icons.interests), label: 'Interest'),
      ],
    );
  }
}
