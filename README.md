# Digital Lemonade Stand

Digital Lemonade Stand is a Flutter demo that focuses on building a cohesive
visual system using Material 3, custom design tokens, and a reusable theme layer.
The UI scaffolding is intentionally simple so you can concentrate on experimenting
with colors, typography, and component styling.

## Features
- Material 3 theme configured via `lib/theme.dart`
- Design tokens collected in `lib/tokens.dart` for consistent styling
- Minimal `lib/main.dart` entry point ready for feature development

## Getting Started
1. Ensure you have Flutter (3.22 or newer) installed and set up on your machine.
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app on a connected device or simulator:
   ```bash
   flutter run
   ```

## Project Structure
- `lib/main.dart` – App entry point and root `MaterialApp`
- `lib/theme.dart` – Material 3 theme builder wired to tokens
- `lib/tokens.dart` – Centralized design tokens (colors, spacing, typography)

## Testing
Execute the Flutter test suite whenever you add new features:
```bash
flutter test
```

## Contributing
Feel free to open issues or suggestions for improving the design system,
expanding the feature set, or refining documentation. Pull requests are welcome.
