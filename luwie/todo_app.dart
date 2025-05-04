import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final List<String> todos = [];
  final TextEditingController controller = TextEditingController();

  void addTodo() {
    final text = controller.text.trim();
    if (text.isNotEmpty) {
      setState(() => todos.add(text));
      controller.clear();
    }
  }

  void deleteTodo(int i) {
    setState(() => todos.removeAt(i));
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: cs.background,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 10),
            Text('AsianCollege To-Do'),
          ],
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: 'New task',
                      prefixIcon: Icon(Icons.task_alt, color: cs.secondary),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: addTodo,
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 24),
            Expanded(
              child: todos.isEmpty
                  ? Center(
                      child: Text(
                        'No tasks yet!',
                        style: TextStyle(color: cs.onBackground, fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (ctx, i) {
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                          child: ListTile(
                            title: Text(todos[i]),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: cs.error),
                              onPressed: () => deleteTodo(i),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
