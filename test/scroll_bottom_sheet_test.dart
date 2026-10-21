import 'package:flutter/material.dart';
import 'package:flutter_scroll_bottom_sheet/flutter_bottom_sheet.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('keyboard preserves the sheet expansion', (tester) async {
    addTearDown(tester.view.resetViewInsets);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return TextButton(
                onPressed: () {
                  // Use fixed height content to compare the sheet expansion
                  // before and after the keyboard changes the available height.
                  ScrollBottomSheet.open(context, const SizedBox(height: 300));
                },
                child: const Text('Open'),
              );
            },
          ),
        ),
      ),
    );

    // Open the sheet and finish its entrance animation.
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    // Check that the sheet starts fully expanded within the viewport.
    final state = tester.state<ScrollBottomSheetWidgetState>(
      find.byType(ScrollBottomSheetWidget),
    );

    final initialMaxFraction = state.maxFraction;
    expect(initialMaxFraction, lessThan(1));
    expect(state.relFraction, closeTo(1, 0.001));

    // Simulate the keyboard taking up 300 pixels at the bottom.
    tester.view.viewInsets = const FakeViewPadding(bottom: 300);
    await tester.pumpAndSettle();

    // The available height changes, but the sheet remains fully expanded.
    expect(state.maxFraction, greaterThan(initialMaxFraction));
    expect(state.relFraction, closeTo(1, 0.001));
    expect(state.absFraction, closeTo(state.maxFraction, 0.001));
  });
}
