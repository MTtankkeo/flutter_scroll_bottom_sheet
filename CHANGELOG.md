## 1.0.0
- A initial verison.

## 1.1.0
- Updated to allow the bottom sheet to be laid out at its minimum size.

## 1.2.0
- Added `builder` to build the inner content of the bottom sheet.
- Inner content now automatically applies SafeArea, removing the need to wrap ScrollView separately.
- Renamed the previous `builder` to `sheetBuilder` to clarify it builds the card-style container inside the bottom sheet.

## 1.2.1
- Updated BottomSheet `open` function to return a Future so that it can receive a result from the page.

## 1.3.0
- Renamed the public bottom sheet API to `ScrollBottomSheet`, including its route, configuration, builder, and widget types. Update references to the previous `BottomSheet` names.
- Added an optional per-call `config` argument to `ScrollBottomSheet.open`.
- Removed the convenience `BottomSheet.close` method; use `Navigator.pop` to dismiss a sheet or return a result.
- Moved the sheet above the on-screen keyboard while preserving its expansion state as the available height changes.
- Raised the minimum supported versions to Dart 3.12 and Flutter 3.44, and updated `flutter_appbar` to 1.9.0.
- Added a keyboard behavior widget test and a GitHub Actions test workflow.

## 1.3.1
- Replaced the `flutter_appbar` dependency with `flutter_nested_scroll` for nested scroll coordination.
