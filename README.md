# Quiz App

## Overview

A full-stack multiple-choice quiz application built with Flutter and Firebase. This app offers an interactive quiz experience with real-time progress tracking, user authentication, and dynamic animations.

## Demo

https://github.com/user-attachments/assets/63dcd492-7c38-4ae8-b47c-2c65da8a8152

## Features

- Firebase Authentication
- Real-time quiz progress tracking
- Multiple-choice quiz interface with interactive elements
- Cross-platform compatibility (iOS and Android)
- Dynamic animations for an engaging user experience
- Persistent user data storage with Firestore
- Elegant and responsive UI design

## Tech Stack

- Flutter 3.5.4
- State Management: Riverpod
- Backend: Firebase
- Authentication: Firebase Auth
- Database: Cloud Firestore

## Challenges & Solutions

Here are some challenges I faced during development:

1. **Complex State Management**: Implementing a scalable state management solution for tracking quiz progress across multiple screens was challenging. Riverpod helped solve this by providing a clean way to manage and share state.

2. **Firebase Data Modeling**: Designing an efficient Firestore data structure to handle quiz questions, user responses, and progress tracking required careful planning. I implemented a normalized data model that minimized read operations and optimized for speed.

3. **User Authentication Flow**: Creating a seamless authentication experience with multiple sign-in options while maintaining security best practices was tricky. I solved this by implementing a robust authentication service layer that abstracts the complexity.

4. **Real-time Updates**: Synchronizing quiz progress in real-time between the UI and Firestore required careful implementation of stream-based data flow. I used Firestore streams combined with Flutter's StreamBuilder for reactive UI updates.
