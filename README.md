# FoodGo 🍔

FoodGo is a premium, modern food delivery application built with Flutter. It features a sleek, responsive UI designed to provide a seamless user experience, from browsing delicious categories to selecting the perfect burger.

## ✨ Features

- **Dynamic Home Screen**: A clean and intuitive dashboard to explore top-rated food.
- **Categorized Browsing**: Quickly filter through various food types like Burgers, Pizza, Classics, and more.
- **Premium Food Cards**: Beautifully designed cards featuring high-quality images, star ratings, and quick "favorite" toggles.
- **Search & Filter**: Find exactly what you're craving with a modern search interface and filter controls.
- **Fully Responsive**: Built with `flutter_screenutil` to ensure the UI looks stunning on any device size.
- **Modular Architecture**: Clean, reusable widget structure for high maintainability.


## 📁 Project Structure

The project follows a modular and clean architecture pattern:

```text
lib/
├── Core/
│   ├── Helpers/       # Utility classes (Spacing, etc.)
│   ├── Theme/         # Design system (Colors, Images, TextStyles)
│   └── Shared/        # Project-wide reusable components
└── Features/
    ├── Home/
    │   ├── Screens/   # Main Home View
    │   └── Widgets/   # Modular components (FoodCard, HomeHeader, etc.)
    └── Intro/         # Navigational roots and onboarding
```
## 📸 UI Preview

| Home Screen | Food Grid |
| :---: | :---: |
| ![Home](assets/screenshots/splash.png) | ![Cards](assets/screenshots/home.png) |

---
## 🛠️ Technology Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **Typography**: [Google Fonts - Poppins](https://fonts.google.com/specimen/Poppins)
- **Icons & Assets**: Custom SVG integration using `flutter_svg`.
- **Responsive Design**: `flutter_screenutil`

## 🚀 Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/FoodGo-App.git
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```


Developed with ❤️ by [Salma Elmaghawry](https://github.com/salmaelmaghawry)
