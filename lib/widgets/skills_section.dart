import 'package:flutter/material.dart';

class SkillsSection extends StatefulWidget {
  final List<String> skills;

  const SkillsSection({super.key, required this.skills});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.terminal,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text("Technical Skills"),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: widget.skills.asMap().entries.map((entry) {
            final index = entry.key;
            final skill = entry.value;
            return _buildAnimatedSkillChip(skill, index, context);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAnimatedSkillChip(
    String skill,
    int index,
    BuildContext context,
  ) {
    // FIXED: Calculate interval safely to prevent values > 1.0
    final maxDelay = 0.7; // Maximum delay before animation starts
    final step = 0.15; // Delay between each skill animation
    final start = (index * step).clamp(0.0, maxDelay);
    final end = start + 0.3; // Animation duration for each skill

    final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.elasticOut),
      ),
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.scale(
          scale: animation.value,
          child: Opacity(
            opacity: animation.value.clamp(
              0.0,
              1.0,
            ), // FIXED: Ensure valid opacity
            child: child,
          ),
        );
      },
      child: _buildSkillChip(skill, index, context),
    );
  }

  Widget _buildSkillChip(String skill, int index, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: _getSkillColor(skill, context),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_getSkillIcon(skill), size: 16, color: Colors.white),
          const SizedBox(width: 6),
          Text(
            skill,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Color _getSkillColor(String skill, BuildContext context) {
    final colors = [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.secondary,
      Colors.blue.shade600,
      Colors.green.shade600,
      Colors.orange.shade600,
      Colors.purple.shade600,
      Colors.red.shade600,
      Colors.teal.shade600,
      Colors.indigo.shade600,
      Colors.pink.shade600,
    ];
    return colors[skill.length % colors.length];
  }

  IconData _getSkillIcon(String skill) {
    switch (skill.toLowerCase()) {
      case 'flutter':
        return Icons.flash_on;
      case 'dart':
        return Icons.code;
      case 'javascript':
        return Icons.javascript;
      case 'react.js':
        return Icons.layers;
      case 'supabase':
        return Icons.storage;
      case 'rest apis':
        return Icons.api;
      case 'github':
        return Icons.folder;
      case 'state management':
        return Icons.settings;
      case 'html/css':
        return Icons.web;
      case 'node.js':
        return Icons.settings_input_component;
      default:
        return Icons.developer_mode;
    }
  }
}
