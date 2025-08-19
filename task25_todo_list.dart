import 'package:flutter/material.dart';

void main() {
  runApp(const Task25App());
}

class Task25App extends StatelessWidget {
  const Task25App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task 25 To-Do List",
      debugShowCheckedModeBanner: false,
      home: const TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> _tasks = [];
  final TextEditingController _controller = TextEditingController();

  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("📝 To-Do List")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
               child: TextField(
               controller: _controller,
              decoration: const InputDecoration(
                labelText: "Enter Task",
              border: OutlineInputBorder(),
             ),
                  ),
             ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text("Add"),
                ),
              ],
           ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
            final task = _tasks[index];
            return Dismissible(
                 key: Key(task),
              onDismissed: (_) => _removeTask(index),
                  background: Container(
                color: Colors.red,
             alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
               child: Card(
                    child: ListTile(
                      title: Text(task),
                  trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeTask(index),
                      ),
                ),
                  ),
           );
              },
          ),
          ),
       ],
      ),
    );
  }
}
