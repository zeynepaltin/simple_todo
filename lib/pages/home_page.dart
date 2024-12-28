import 'package:flutter/material.dart';
import 'package:to_do/utils/todo_list.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();
List todolist=[
  ['Learn C language',false],
  ['Learn Flutter',false],
  ['Go for a walk',false]
];

void checkBoxChanged(int index){
setState(() {
  todolist[index][1]= !todolist[index][1];
});
}

void saveNewTask(){
  setState(() {
    todolist.add([_controller.text, false]);
    _controller.clear();
  });
}

void deleteTask(int index){
  setState(() {
    todolist.removeAt(index);
  });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      appBar: AppBar(
        title: Text('Todo'),
        backgroundColor: Colors.brown.shade400,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(itemCount: todolist.length,
          itemBuilder: (BuildContext context, index){
        return TodoList(
            taskName: todolist[index][0],
          taskCompleted: todolist[index][1],
          onChanged: (value) => checkBoxChanged(index),
          deleteFunction: (contex) => deleteTask(index),
        );
      },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Add your tasks',
                filled: true,
                fillColor: Colors.brown.shade300,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.brown,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.brown,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          )
          ),
          FloatingActionButton(
              onPressed: saveNewTask,
            child: const Icon(Icons.add,
              color: Colors.brown,
            ),
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
