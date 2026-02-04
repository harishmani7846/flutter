import 'package:flutter/material.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Management System',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light,
      ),
      home: const StudentHomePage(),
    );
  }
}

class Student {
  String name;
  int age;
  String course;

  Student({required this.name, required this.age, required this.course});
}

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  final List<Student> students = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController courseController = TextEditingController();

  void addStudent() {
    if (nameController.text.isEmpty || courseController.text.isEmpty) return;
    setState(() {
      students.add(Student(
        name: nameController.text,
        age: int.tryParse(ageController.text) ?? 0,
        course: courseController.text,
      ));
      nameController.clear();
      ageController.clear();
      courseController.clear();
    });
  }

  void deleteStudent(int index) {
    setState(() {
      students.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient AppBar
      appBar: AppBar(
        title: const Text("🎓 Student Management System"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.pinkAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Input Fields with colorful borders
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Student Name",
                  prefixIcon: const Icon(Icons.person, color: Colors.deepPurple),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Age",
                  prefixIcon: const Icon(Icons.cake, color: Colors.pink),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: courseController,
                decoration: InputDecoration(
                  labelText: "Course",
                  prefixIcon: const Icon(Icons.book, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 15),

              // Colorful Button
              ElevatedButton.icon(
                onPressed: addStudent,
                icon: const Icon(Icons.add_circle, color: Colors.white),
                label: const Text("Add Student"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Student List with colorful cards
              Expanded(
                child: students.isEmpty
                    ? const Center(
                        child: Text(
                          "No students added yet!",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      )
                    : ListView.builder(
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          final student = students[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 6,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            color: Colors.primaries[index % Colors.primaries.length].shade200,
                            child: ListTile(
                              leading: const Icon(Icons.school, color: Colors.white),
                              title: Text(
                                student.name,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              subtitle: Text("Age: ${student.age}, Course: ${student.course}"),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => deleteStudent(index),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Management System',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light,
      ),
      home: const StudentHomePage(),
    );
  }
}

class Student {
  String name;
  int age;
  String course;

  Student({required this.name, required this.age, required this.course});
}

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  final List<Student> students = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController courseController = TextEditingController();

  void addStudent() {
    if (nameController.text.isEmpty || courseController.text.isEmpty) return;
    setState(() {
      students.add(Student(
        name: nameController.text,
        age: int.tryParse(ageController.text) ?? 0,
        course: courseController.text,
      ));
      nameController.clear();
      ageController.clear();
      courseController.clear();
    });
  }

  void deleteStudent(int index) {
    setState(() {
      students.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient AppBar
      appBar: AppBar(
        title: const Text("🎓 Student Management System"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.pinkAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Input Fields with colorful borders
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Student Name",
                  prefixIcon: const Icon(Icons.person, color: Colors.deepPurple),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Age",
                  prefixIcon: const Icon(Icons.cake, color: Colors.pink),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: courseController,
                decoration: InputDecoration(
                  labelText: "Course",
                  prefixIcon: const Icon(Icons.book, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 15),

              // Colorful Button
              ElevatedButton.icon(
                onPressed: addStudent,
                icon: const Icon(Icons.add_circle, color: Colors.white),
                label: const Text("Add Student"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Student List with colorful cards
              Expanded(
                child: students.isEmpty
                    ? const Center(
                        child: Text(
                          "No students added yet!",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      )
                    : ListView.builder(
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          final student = students[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 6,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            color: Colors.primaries[index % Colors.primaries.length].shade200,
                            child: ListTile(
                              leading: const Icon(Icons.school, color: Colors.white),
                              title: Text(
                                student.name,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              subtitle: Text("Age: ${student.age}, Course: ${student.course}"),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => deleteStudent(index),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
