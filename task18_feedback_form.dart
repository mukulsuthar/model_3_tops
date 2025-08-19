import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeedbackForm(),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  String _feedbackType = "Bug Report"; // default dropdown value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback Form"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Name
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                // Email
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                // Dropdown for feedback type
                DropdownButtonFormField<String>(
                  value: _feedbackType,
                  decoration: const InputDecoration(
                    labelText: "Feedback Type",
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: "Bug Report", child: Text("Bug Report")),
                    DropdownMenuItem(value: "Suggestion", child: Text("Suggestion")),
                    DropdownMenuItem(value: "Other", child: Text("Other")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _feedbackType = value!;
                    });
                  },
                ),
                const SizedBox(height: 15),

                // Feedback message
                TextFormField(
                  controller: _messageController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: "Message",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your message";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),

                // Submit button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Thank you ${_nameController.text}, your feedback has been submitted!",
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text("Submit", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
