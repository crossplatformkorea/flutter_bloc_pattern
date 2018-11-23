// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bloc_login_example/main.dart';
import 'package:bloc_login_example/screens/review.dart';
import 'package:bloc_login_example/blocs/review_bloc.dart';

void main() {
  ReviewBloc reviewBloc;

  setUp(() {
    reviewBloc = ReviewBloc();
  });

  group('Review Screen', () {
    test('initial state', () async {
      var userId = await reviewBloc.userId.first;
      expect(userId, '001');
    });
    testWidgets('Widget', (WidgetTester tester) async {
      await tester.pumpWidget(new Review());
      await tester.pump();

      expect(find.text('null'), findsNothing);
      expect(find.text('message: '), findsOneWidget);
      expect(find.text('test'), findsOneWidget);
    });
  });


//  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//    // Build our app and trigger a frame.
//    await tester.pumpWidget(new MyApp());`
//
//    // Verify that our counter starts at 0.
//    expect(find.text('0'), findsOneWidget);
//    expect(find.text('1'), findsNothing);
//
//    // Tap the '+' icon and trigger a frame.
//    await tester.tap(find.byIcon(Icons.add));
//    await tester.pump();
//
//    // Verify that our counter has incremented.
//    expect(find.text('0'), findsNothing);
//    expect(find.text('1'), findsOneWidget);
//  });
}
