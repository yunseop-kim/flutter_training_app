import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_traning_app/main.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('필요한 위젯들이 다 있는지 확인한다.', (WidgetTester tester) async {
    // Test code goes here.
    await tester.pumpWidget(MyApp());
    final questionFinder = find.text('What is your name?');
    final textFieldFinder =
        find.widgetWithText(TextField, 'Enter your name...');
    final buttonFinder = find.text('Submit');
    expect(questionFinder, findsOneWidget);
    expect(textFieldFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
  });
  testWidgets('이름 입력 후에 인사말을 잘 출력하나 보자.', (WidgetTester tester) async {
    // Test code goes here.
    await tester.pumpWidget(MyApp());
    final textFieldFinder =
        find.widgetWithText(TextField, 'Enter your name...');
    final buttonFinder = find.text('Submit');
    await tester.enterText(textFieldFinder, 'Flutter');
    await tester.tap(buttonFinder);
    await tester.pump();
    expect(find.text('Hello, Flutter!'), findsOneWidget);
  });
}
