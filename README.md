# color_blink

## Getting Started

```bash
flutter pub get
flutter run
```

## Architecture

The project follows a layered architecture to ensure separation of concerns:

Data: Concrete implementations of services.

Controller: State management using `ValueNotifier` without external dependencies.

DI: Manual dependency injection via `InheritedWidget` + `StatefulWidget`.

## State Management

Used `ValueNotifier` with `ValueListenableBuilder` for lightweight, reactive UI updates without external dependencies.

## Features

Adaptive UI: Text color changes based on background luminance for better readability.

Animations: Smooth transitions using `TweenAnimationBuilder`.

Haptics: Physical feedback on color generation.