<div align="center">

# 🏆 QuizWins

### 🎯 Flutter Quiz Application

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=22&pause=1000&color=6C63FF&center=true&vCenter=true&width=700&lines=Welcome+to+QuizWins!;Test+Your+Knowledge;Take+Quizzes+%7C+Track+Scores+%7C+View+History;Built+with+Flutter+%26+BLoC" alt="Typing animation" />

<br/>

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart)
![BLoC](https://img.shields.io/badge/State%20Management-BLoC-6C63FF?style=for-the-badge)
![SQLite](https://img.shields.io/badge/Database-SQLite-003B57?style=for-the-badge&logo=sqlite)

</div>

---

## 📱 About the Project

**QuizWins** is a Flutter-based Quiz Application developed as part of my **Week 3 Flutter Internship Task at Owasoft Technologies Pvt. Ltd.**

The project focuses on building a functional quiz application with multiple-choice questions, answer selection, score calculation, result management, and quiz history.

During this week, I also practiced **BLoC state management**, database integration with SQLite, model classes, events, states, and separation of UI from application logic.

---

## 🎯 Week 3 Internship Objectives

The main objectives of this project were:

- Build a functional Flutter Quiz Application
- Work with local SQLite database
- Store and retrieve quiz questions
- Implement quiz categories
- Handle multiple-choice answers
- Calculate quiz scores
- Store completed quiz results
- Display quiz history
- Practice BLoC state management
- Understand Events, States, and BLoC
- Improve Flutter project structure
- Create reusable UI components

---

## ✨ Features

- 🏠 Home Screen with quiz categories
- 🎯 Multiple quiz categories
- ❓ 10 questions per quiz
- ✅ Answer selection and validation
- 📊 Question progress
- 🧮 Automatic score calculation
- 🏆 Result Screen
- 🕘 Quiz History
- 💾 SQLite local database
- 🔄 BLoC state management
- 🎨 Custom UI components
- 🖼️ Custom visual assets
- 📱 Clean feature-based project structure

---

## 🧩 BLoC State Management

For this project, I practiced separating the application into:

```text
UI
 │
 │ User Action
 ▼
Event
 │
 ▼
BLoC
 │
 │ Business Logic
 ▼
State
 │
 ▼
UI Update
