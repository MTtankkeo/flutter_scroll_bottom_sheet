# Introduction

This package provides a flexible bottom sheet, built on top of the flutter_appbar package, that syncs with scroll events instead of relying only on gestures.

## Preview

The GIF below may appear distorted or choppy due to compression.

![preview](https://github.com/user-attachments/assets/059081e1-a526-4545-bd7a-9d6fa482f458)

## Usage

### Open a sheet

Use `ScrollBottomSheet.open` with the widget you want to display. A vertically scrollable child, such as `ListView`, lets scrolling expand and dismiss the sheet.

```dart
import 'package:flutter/widgets.dart';
import 'package:flutter_scroll_bottom_sheet/flutter_bottom_sheet.dart';

ScrollBottomSheet.open(
  context,
  ListView.builder(
    padding: const .all(20),
    itemCount: 100,
    itemBuilder: (context, index) => const Text('Hello, World!'),
  ),
);
```

### Close a sheet

Call `Navigator.pop` from a context inside the sheet. Pass a result to complete the `Future` from `open`, or omit it to close without a result.

```dart
Navigator.pop(context, 'Hello, World!');
```

### Customize a sheet

Set `ScrollBottomSheet.config` to apply configuration to every sheet:

```dart
ScrollBottomSheet.config = const ScrollBottomSheetConfig(
  initialFraction: 0.6,
  fadeInDuration: .new(seconds: 1),
  fadeInCurve: Curves.ease,
);
```

Pass `config` to `open` to configure one sheet instead of using the global configuration:

```dart
ScrollBottomSheet.open(
  context,
  const SizedBox(height: 300),
  config: const .new(initialFraction: 0.8),
);
```

`builder` wraps the inner content, while `sheetBuilder` customizes the sheet container. When the on-screen keyboard opens, the sheet moves above it and preserves its relative expansion.
