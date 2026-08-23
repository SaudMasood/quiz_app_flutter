<div align="center">

# 🏆 QuizWins

### 🎯 Test Your Knowledge. Track Your Score. Keep Improving.

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=22&pause=1000&color=6C63FF&center=true&vCenter=true&width=700&lines=Welcome+to+QuizWins!;Challenge+Your+Knowledge;Take+Quizzes+%7C+Track+Scores+%7C+View+History;Built+with+Flutter+%26+BLoC" alt="Typing animation" />

<br/>

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart)
![BLoC](https://img.shields.io/badge/State%20Management-BLoC-6C63FF?style=for-the-badge)
![SQLite](https://img.shields.io/badge/Database-SQLite-003B57?style=for-the-badge&logo=sqlite)

</div>

---

## 📱 About QuizWins

**QuizWins** is a Flutter-based quiz application designed to provide a simple, interactive, and enjoyable way to test knowledge across different categories.

The application includes quiz categories, multiple-choice questions, answer validation, score calculation, result display, and quiz history stored locally using SQLite.

The project was also used to practice a clean Flutter feature structure and understand **BLoC state management** in a real application.

---

## ✨ Features

- 🏠 Clean and simple Home Screen
- 🎯 Multiple quiz categories
- ❓ Multiple-choice questions
- ✅ Instant correct/wrong answer feedback
- 📊 Question progress tracking
- 🧮 Automatic score calculation
- 🏆 Result Screen after completing a quiz
- 🕘 Quiz History
- 💾 Local SQLite database
- 🔄 BLoC-based state management
- 🎨 Reusable widgets and centralized styling
- 🖼️ Custom application images and visual assets
- 📱 Responsive Flutter UI

---

## 🧠 Quiz Flow

```text
                    ┌─────────────────┐
                    │   QuizWins App  │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │   Home Screen   │
                    └────────┬────────┘
                             │
                    Select Category
                             │
                             ▼
                    ┌─────────────────┐
                    │   Quiz Screen   │
                    └────────┬────────┘
                             │
                       Select Answer
                             │
                             ▼
                    ┌─────────────────┐
                    │ Check Answer    │
                    │ Correct / Wrong │
                    └────────┬────────┘
                             │
                         Next Question
                             │
                             ▼
                    ┌─────────────────┐
                    │  Finish Quiz    │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │  Save Result    │
                    │   SQLite DB     │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │  Result Screen  │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │  History Screen │
                    └─────────────────┘
