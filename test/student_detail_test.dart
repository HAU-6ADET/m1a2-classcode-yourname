import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

/// Each test below is worth one point. student.json must be filled in (6
/// fields) and the program must print every part of the required summary.
void main() {
  group('Student info (student.json)', () {
    late Map<String, dynamic> info;

    setUpAll(() {
      info = jsonDecode(File('student.json').readAsStringSync())
          as Map<String, dynamic>;
    });

    for (final field in [
      'classCode',
      'fullName',
      'studentNumber',
      'studentEmail',
      'personalEmail',
      'githubAccount',
    ]) {
      test('$field is filled in', () {
        expect(info[field], isNotEmpty, reason: 'Set "$field" in student.json');
      });
    }
  });

  group('Student Detail output', () {
    late String out;

    setUpAll(() async {
      final process =
          await Process.start('dart', ['run', 'bin/student_detail.dart']);
      await process.stdin.close();
      out = await process.stdout.transform(utf8.decoder).join();
      await process.exitCode;
    });

    test('prints the student name', () {
      expect(out, contains('Bing Chua'), reason: 'Print the student name');
    });
    test('prints the student number', () {
      expect(out, contains('44385'), reason: 'Print the student number');
    });
    test('prints the course', () {
      expect(out, contains('BSIT in Networking'), reason: 'Print the course');
    });
    test('prints the year level', () {
      expect(out, contains('2'), reason: 'Print the year level (2)');
    });
    test('lists enrolled course 6APPDEV', () {
      expect(out, contains('6APPDEV'), reason: 'List enrolled course 6APPDEV');
    });
    test('lists enrolled course 6WANTECH', () {
      expect(out, contains('6WANTECH'),
          reason: 'List enrolled course 6WANTECH');
    });
    test('lists enrolled course 6ASI', () {
      expect(out, contains('6ASI'), reason: 'List enrolled course 6ASI');
    });
  });
}
