# Digital Lemonade Stand

Digital Lemonade Stand is a Flutter showcase that pairs a beverage ordering
experience with a Material 3 driven design system. It demonstrates how to layer
design tokens, Riverpod state management, and responsive layouts into an
approachable demo application.

## Features
- Beverage catalog backed by Riverpod providers with pricing and flavor imagery.
- Responsive home grid that adapts card widths and columns to screen size.
- Order flow with dynamic summaries, validation-aware controls, and SafeArea
  protection on every screen.
- Centralized tokens and theming so brand tweaks happen in one place.

## Getting Started
1. Ensure Flutter (3.22 or newer) is installed and available on your `PATH`.
2. Fetch dependencies:
   ```bash
   flutter pub get
   ```
3. Launch the app on a device or simulator:
   ```bash
   flutter run
   ```

### Visual Styling
Each beverage card is styled with gradients and icons defined in
`lib/providers/beverage_providers.dart`. Adjust the `BeverageVisual` values there
to experiment with different art directions or branding.

## Project Structure
- `lib/main.dart` – App entry point, router setup, and theme bootstrap.
- `lib/app_router.dart` & `lib/routes.dart` – Route table and navigation helpers.
- `lib/screens/` – Feature screens such as home and order flows.
- `lib/widgets/` – Reusable UI components (cards, buttons, form fields).
- `lib/providers/` – Riverpod providers and state notifiers for beverages.
- `lib/tokens.dart` & `lib/theme.dart` – Design tokens and Material 3 theme.

## State & Navigation
- **Riverpod** keeps UI and data in sync with immutable state notifiers that
  expose beverage definitions, selection status, and derived totals to widgets.
- **go_router** manages navigation using declarative routes, named lookups, and
  simple back navigation between the catalog and order screens.

## Testing
Run the Flutter test suite whenever you add or modify features:
```bash
flutter test
```

## Contributing
Suggestions for improving the design system, enhancing the shopping flow, or
expanding documentation are welcome. Open an issue or submit a pull request.
