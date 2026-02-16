# 📱 Flutter E-Commerce Catalog App

A smobile catalog application built with Flutter, featuring real-time API integration, dynamic search functionality, and a complete shopping basket workflow.

## 🚀 Key Features

- **Dynamic Product Feed:** Fetches real-time data from a remote REST API with automated data cleaning for price formatting.
- **Real-time Search:** Integrated filtering system that allows users to instantly find products by name.
- **Detailed Product Views:** Rich product pages displaying high-resolution images, pricing, and technical descriptions.
- **Shopping Basket System:** Persistent basket management with total cost calculation and a simulated checkout process.
- **Optimized Web Rendering:** Utilizes specialized HTML rendering to bypass cross-origin (CORS) restrictions for seamless image loading.
- **Premium UI/UX:** Features a modern promotional banner, responsive grid layouts, and an intuitive navigation flow.

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev) (Cross-platform support)
- **Language:** [Dart](https://dart.dev)
- **State Management:** StatefulWidget for reactive UI updates and filtering
- **Networking:** HTTP client for asynchronous JSON data fetching

## 📂 Project Structure

```text
lib/
├── models/          # Data models for Products and Basket items
├── screens/         # UI Screens (Discover, Product Detail, Basket)
├── services/        # API service and networking logic
├── widgets/         # Reusable UI components like ProductCard
└── main.dart        # Application entry point

```

## ⚙️ Installation & Usage

1. **Clone the repository and fetch dependencies:**

```bash
flutter pub get

```

2. **Run the application:**

- For Mobile (iOS/Android):

```bash
flutter run

```

- For Web (with optimized rendering):

```bash
flutter run -d chrome --web-renderer html

```
