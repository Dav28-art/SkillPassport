import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skillpassport_africa/app.dart';

void main() {
  testWidgets('SkillPassport Africa app smoke test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'SkillPassport Africa',
        home: const Scaffold(
          body: Center(
            child: Text('SkillPassport Africa'),
          ),
        ),
      ),
    );

    expect(find.text('SkillPassport Africa'), findsOneWidget);
  });
}