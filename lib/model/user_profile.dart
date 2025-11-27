import 'package:flutter/material.dart';

class UserProfile {
  final String name;
  final String role;
  final String bio;
  final String email;
  final String? phone;
  final String location;
  final List<String> skills;
  final List<String> interests;
  final String profileImagePath;
  final List<Education> education;
  final List<WorkExperience> workExperience;
  final List<SocialMedia> socialMedia;
  final List<Project> projects;

  const UserProfile({
    required this.name,
    required this.role,
    required this.bio,
    required this.email,
    this.phone,
    required this.location,
    required this.skills,
    required this.interests,
    required this.profileImagePath,
    required this.education,
    required this.workExperience,
    required this.socialMedia,
    required this.projects,
  });
}

class Education {
  final String institution;
  final String degree;
  final String period;
  final String description;

  const Education({
    required this.institution,
    required this.degree,
    required this.period,
    required this.description,
  });

  // get length => null;
}

class WorkExperience {
  final String company;
  final String position;
  final String period;
  final List<String> responsibilities;

  const WorkExperience({
    required this.company,
    required this.position,
    required this.period,
    required this.responsibilities,
  });
}

class SocialMedia {
  final String platform;
  final String username;
  final String url;
  final IconData icon;

  const SocialMedia({
    required this.platform,
    required this.username,
    required this.url,
    required this.icon,
  });
}

class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String? projectUrl;
  final String? githubUrl;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    this.projectUrl,
    this.githubUrl,
  });
}
