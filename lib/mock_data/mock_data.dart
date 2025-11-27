import 'package:profile_app_/model/user_profile.dart';
import 'package:flutter/material.dart';
// import '../models/user_profile.dart';

class MockData {
  static UserProfile getProfileData() {
    return UserProfile(
      name: 'Hasanor Dimasimpan',
      role: 'FullStack Developer',
      bio:
          "Passionate web developer with 1+ years of experience creating beautiful, performant cross-platform applications. Love working with JavaScript, React.js and exploring new technologies. Strong problem-solving skills and commitment to writing clean, efficient code.",
      email: 'hasanordimasimpan@gmail.com',
      phone: '0123456789',
      location: 'Zone 1 Capili Compound brngy. Graceville CSJDM',
      skills: const [
        "Flutter",
        "Dart",
        "JavaScript",
        "React.js",
        "Supabase",
        "REST APIs",
        "GitHub",
        "State Management",
        "HTML/CSS",
        "Node.js",
        "Express.js",
        "C#",
      ],
      interests: const [
        "Mobile Development",
        "Web Technologies",
        "UI/UX Design",
        "Open Source",
        "Tech Communities",
        "Continuous Learning",
        "Problem Solving",
      ],
      profileImagePath: 'assets/images/profile_avatar.jpg',
      education: const [
        Education(
          institution: 'STI College',
          degree: 'Bachelor of Science in Information Technology',
          period: '2020 - 2024',
          description:
              'Specialized in software development and web technologies. Graduated with honors.',
        ),
        Education(
          institution: 'Online Courses & Bootcamps',
          degree: 'Various Certifications',
          period: '2023 - Present',
          description:
              'Completed courses in Flutter development, React.js, and modern web technologies.',
        ),
      ],
      workExperience: const [
        WorkExperience(
          company: 'Capstone',
          position: 'FullStack Developer',
          period: '2024 ',
          responsibilities: [
            'Developed web applications using express and Node.js',
            'Collaborated with design team to implement UI/UX designs',
            'Integrated REST APIs and managed database operations',
          ],
        ),
        WorkExperience(
          company: 'Internship',
          position: 'Web Developer',
          period: '2025 Feb-March',
          responsibilities: [
            'Developed web applications using React.js, Supabase and Node.js',
            'Created responsive websites for Government Tool',
            'Implemented modern UI designs with HTML/Tailwind/JavaScript',
            'Optimized website performance with realtime function using SocketIO',
          ],
        ),
      ],
      socialMedia: const [
        SocialMedia(
          platform: 'GitHub',
          username: '@hasanordimasimpan',
          url: 'https://github.com/HasanorDim',
          icon: Icons.code,
        ),
        SocialMedia(
          platform: 'LinkedIn',
          username: 'Hasanor Dimasimpan',
          url: 'https://linkedin.com/in/hasanordimasimpan',
          icon: Icons.work,
        ),
        SocialMedia(
          platform: 'Facebook',
          username: '@hasanordev',
          url: 'https://twitter.com/hasanordev',
          icon: Icons.facebook,
        ),
        SocialMedia(
          platform: 'Instagram',
          username: '@hasanor.codes',
          url: 'https://instagram.com/hasanor.codes',
          icon: Icons.camera_alt,
        ),
      ],
      projects: const [
        Project(
          title: 'E-Commerce Mobile App',
          description:
              'A full-featured e-commerce application built with Flutter and Supabase. Features include user authentication, product catalog, shopping cart, and payment integration.',
          technologies: ['Flutter', 'Dart', 'Supabase', 'REST API'],
          githubUrl: 'https://github.com/hasanordimasimpan/ecommerce-app',
        ),
        Project(
          title: 'Task Management Dashboard',
          description:
              'A responsive web dashboard for project management with real-time updates, team collaboration features, and analytics.',
          technologies: ['React.js', 'Node.js', 'MongoDB', 'Socket.io'],
          projectUrl: 'https://taskmanager-demo.com',
          githubUrl: 'https://github.com/hasanordimasimpan/task-dashboard',
        ),
        Project(
          title: 'Weather Forecast App',
          description:
              'A beautiful weather application with location-based forecasts, interactive maps, and detailed weather analytics.',
          technologies: ['Flutter', 'OpenWeather API', 'Google Maps'],
          githubUrl: 'https://github.com/hasanordimasimpan/weather-app',
        ),
        Project(
          title: 'Portfolio Website',
          description:
              'A responsive portfolio website showcasing projects and skills with modern design and smooth animations.',
          technologies: ['HTML/CSS', 'JavaScript', 'GSAP', 'Responsive Design'],
          projectUrl: 'https://hasanordimasimpan.dev',
        ),
      ],
    );
  }
}
