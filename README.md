<img width="494" height="747" alt="image" src="https://github.com/user-attachments/assets/004b7db6-068d-4538-83c3-4821d376f67a" />
<img width="495" height="746" alt="image" src="https://github.com/user-attachments/assets/592e6842-19a7-4156-ad4d-ae06297b4973" />
<img width="496" height="819" alt="image" src="https://github.com/user-attachments/assets/22335f25-115b-499c-8f4d-6fc2e12824b7" />
<img width="489" height="800" alt="image" src="https://github.com/user-attachments/assets/0a2b9383-36c2-4f88-84fa-03a0a45c08e0" />

# Interactive Developer Portfolio Application Using Flutter and GetX

A responsive and interactive developer portfolio application built using Flutter and GetX architecture.

This project was developed as part of the SD2 Lab course to demonstrate Flutter application development, responsive UI design, animation implementation, state management, and professional project organization.

## Project Overview

This application is designed to showcase personal information, technical skills, academic background, and completed projects through a modern and interactive portfolio interface.

The main goal of this project was to move beyond a static portfolio and create a user-friendly application with smooth animations, organized architecture, and responsive design.

## Features

### Personal Portfolio

- Developer introduction
- Profile section
- Personal biography
- Educational background
- Technical skills
- Project showcase
- Contact information

### Interactive UI Animations

The application includes size and color transition animations in multiple UI components.

Implemented animated components:

1. Hero Button
   - Button size transition
   - Background color transition
   - Shadow effect transition

2. Profile/About Card
   - Card expansion animation
   - Background color transition
   - Profile image size transition
   - Border radius transition

3. Skill Cards
   - Card size transition
   - Background color transition
   - Highlight animation

Additional animations are also implemented in project cards and contact cards to improve user experience.

## GetX Architecture

The project follows GetX architecture for state management and code organization.

Project structure:

```
lib/

├── controllers/
├── models/
├── views/
└── widgets/
```

### Controllers

Controllers manage application logic and state changes.

Responsibilities:

- Managing UI states
- Handling user interactions
- Controlling animations

### Reactive State Management

GetX features used:

- GetxController
- Observable variables
- Obx widgets
- Dependency injection

These features help maintain a clean separation between UI components and application logic.

## Application Sections

### Home Section

The home section contains:

- Profile image
- Developer name
- Professional role
- Introduction
- Action buttons

### About Me Section

Contains:

- Personal biography
- Educational information
- Developer interests
- Professional details

### Skills Section

Displays technical skills using interactive animated cards.

Example skills:

- Flutter
- Dart
- Firebase
- GetX
- React
- Next.js
- Node.js

### Projects Section

Displays completed projects with:

- Project title
- Project description
- Technologies used
- Project images
- Live project links
- GitHub links

### Contact Section

Provides interactive communication options:

- Email
- Phone
- Location
- GitHub
- LinkedIn

## Responsive Design

The application is designed to support multiple screen sizes.

Supported platforms:

- Desktop
- Tablet
- Mobile

Responsive features include:

- Flexible layouts
- Adaptive card sizes
- Mobile-friendly navigation
- Responsive project grid

## Technologies Used

- Flutter
- Dart
- GetX State Management
- Material Design
- Git
- GitHub

## Folder Structure

```
lib/

├── controllers/
│
├── models/
│
├── views/
│
├── widgets/
│
└── main.dart
```

## Installation and Running the Project

Clone the repository:

```bash
git clone https://github.com/your-username/flutter-portfolio-getx.git
```

Navigate to project directory:

```bash
cd flutter-portfolio-getx
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

## SD2 Lab Learning Reflection

This project reflects the practical knowledge gained throughout the SD2 Lab course.

During the course, I learned Flutter and Dart application development, including widget-based UI design and application structure. I practiced using widgets such as Scaffold, AppBar, Container, Row, Column, Stack, Text, and buttons to create user interfaces.

I learned the differences between StatelessWidget and StatefulWidget and how state changes can update the user interface. Responsive UI design concepts helped me create layouts that work properly on different devices.

The course also introduced Flutter animation techniques. I applied size, position, shape, and color transition animations using Flutter animation widgets such as AnimatedContainer.

GetX architecture was another important learning outcome. I applied GetxController, reactive variables, Obx widgets, dependency injection, bindings, and routing concepts to maintain a clean and organized application structure.

The SD2 Lab also introduced API integration, asynchronous programming, and JSON handling concepts. These topics improved my understanding of dynamic data management in Flutter applications.

Additionally, I learned professional software development workflow using Git and GitHub. I practiced creating repositories, using Git add, commit, and push commands, maintaining version history, publishing projects, and preparing documentation using README files.

## Report

The complete SD2 Lab project report is available in the report folder.

```
report/
└── SD2_Lab_Report.pdf
```

## Future Improvements

Possible future improvements include:

- Backend integration
- Online content management
- More advanced animations
- User authentication
- Cloud-based project updates

## Author

Leanur Rahman

Department of Computer Science and Engineering

International Islamic University Chittagong

## Repository

GitHub Repository: https://github.com/Leanurrahman/flutter-portfolio-getx/tree/main
