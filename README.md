# Module 1 – Activity 2 – Student Detail (Dart)

Practice using variables with the right data types and a `List`, then print a
student summary.

## What to do

### 1. Fill in your details

Open `student.json` and fill in every field (use the **class code** your
instructor gave you, which also appears in your repo name):

```json
{
  "classCode": "1234",
  "fullName": "Juan Dela Cruz",
  "studentNumber": "2026-12345",
  "studentEmail": "juan.delacruz@hau.edu.ph",
  "personalEmail": "juan@example.com",
  "githubAccount": "juandelacruz"
}
```

### 2. Write the program

Open [`bin/student_detail.dart`](bin/student_detail.dart). Declare variables
with **appropriate data types** and use a **`List`** for the enrolled courses,
then print a summary for this student (the values must appear in your output):

```
Name:             Bing Chua
Student Number:   44385
Course:           BSIT in Networking
Year:             2
Enrolled Courses: 6APPDEV, 6WANTECH, 6ASI
```

Store the enrolled courses in a **`List`**, and use variables with appropriate
data types for the rest. (Check the Dart cheat sheet for the syntax.)

## Running the test

```bash
dart pub get
dart test
```

This activity is graded by **one test** worth the activity's points. It passes
only when **both** are true:

- ✅ `bin/student_detail.dart` prints the required summary (name, student
  number, course, and all three enrolled courses)
- ✅ every field in `student.json` is filled in

## Submitting on Canvas

When the test passes locally, **commit and push**:

```bash
git add -A
git commit -m "Activity 2 complete"
git push
```

Pushing triggers the **Autograde** workflow. To confirm it passed:

1. Open your repo on GitHub and click the **Actions** tab.
2. Open the latest **Autograde** run and confirm the green ✅ check
   and the "1 / 1 tests passed" summary.

Then submit **both** on Canvas:

1. **A screenshot** of the green Autograde run.
2. **The link to that Actions run** (copy the URL from your browser).
