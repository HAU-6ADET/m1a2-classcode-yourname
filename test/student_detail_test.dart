import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

/// One test = the points for this activity. It passes only if your
/// student.json is filled in AND the program prints the required summary.
void main() {
  test('Activity 2 complete: student detail summary + student.json filled',
      () async {
    // 1. student.json must be filled in
    final info = jsonDecode(File('student.json').readAsStringSync())
        as Map<String, dynamic>;
    for (final field in [
      'classCode',
      'fullName',
      'studentNumber',
      'studentEmail',
      'personalEmail',
      'githubAccount',
    ]) {
      expect(info[field], isNotEmpty, reason: 'Set "$field" in student.json');
    }

    // 2. the program prints the required summary
    final process = await Process.start('dart', ['run', 'bin/student_detail.dart']);
    await process.stdin.close();
    final out = await process.stdout.transform(utf8.decoder).join();
    await process.exitCode;

    expect(out, contains('Bing Chua'), reason: 'Print the student name');
    expect(out, contains('44385'), reason: 'Print the student number');
    expect(out, contains('BSIT in Networking'), reason: 'Print the course');
    expect(out, contains('6APPDEV'), reason: 'List enrolled course 6APPDEV');
    expect(out, contains('6WANTECH'), reason: 'List enrolled course 6WANTECH');
    expect(out, contains('6ASI'), reason: 'List enrolled course 6ASI');
  }, timeout: const Timeout(Duration(seconds: 60)));
}
