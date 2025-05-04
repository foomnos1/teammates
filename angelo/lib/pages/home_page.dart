import 'package:flutter/material.dart';
import 'package:angelo/util/dialog_box.dart';
import 'package:angelo/util/todo_tile.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  //controller
  final _controller = TextEditingController();

  //list of todo
  List toDoList = [
    ["Guipro Flutter Run", false],
    ["Tuition for finals", false],
    ["Philpop roleplay", false]

  ];


  //checkbox was taptap
    void checkBoxChanged(bool? value, int index) {
        setState(() {
          toDoList[index][1] = !toDoList[index][1];
        });

    }

  //save new task
  void saveNewTask(){
    setState((){
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //create a task
    void createNewTask(){
      showDialog(context: context, builder: (context){
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      }, );
    }

    //delete task
    void deleteTask(int index){
      setState(() {
        toDoList.removeAt(index);
      });
    }

  @override  
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 131, 190, 238),
        appBar: AppBar(
          title: Text('To Do (Asian College)'),
          elevation: 0,
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        ),

        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder:(context, index) {
            return ToDoTile(taskName: toDoList[index][0], taskCompleted: toDoList[index][1], onChanged: (value) =>  checkBoxChanged(value, index), deleteFunction: (context) => deleteTask(index),
            );
          },
        ),
      ),
    );
  }
}