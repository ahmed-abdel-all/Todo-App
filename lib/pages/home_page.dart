import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/widgets/counter.dart';
import 'package:todo_app/widgets/todo_card.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  // create controller to get the text inside textfield in dialog widget
  final myController = TextEditingController();
  int count = 0;

  // List of todo
  List<Task> allTasks = [
    // Task(title: 'Publish Video', status: true),
    // Task(title: 'laugh Louder', status: true),
    // Task(title: 'Gem', status: true),
    // Task(title: 'Call Mom', status: true),
    // Task(title: 'Call Dad', status: true),
    // Task(title: 'Call Dad', status: true),
  ];

// To add new todo when clicking on "ADD" in the dialog widget
  void addNewTask() {
    setState(() {
      allTasks.add(Task(title: myController.text, status: false));
    });
  }

// To Calculate only completed tasks
  int calculateCompletedTasks() {
    int completedTasks = 0;
    for (var element in allTasks) {
      if (element.status == true) completedTasks++;
    }
    return completedTasks;
  }

// To Change the state of the todo (completed or not completed) when click the todo
  changeStatus(int index) {
    setState(
      () {
        allTasks[index].status = !allTasks[index].status;
      },
    );
  }

// To remove todo  when clicking on "delete" icon
  void deleteTask(int index) {
    setState(() {
      allTasks.remove(allTasks[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff272D3A),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 52, 59, 73),
        title: const Text(
          'To Do App',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                setState(() {
                  allTasks.clear();
                });
              },
              icon: const Icon(
                Icons.delete_forever,
                size: 32,
                color: Color.fromARGB(255, 255, 188, 215),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Counter(
              count: calculateCompletedTasks(),
              totalcount: allTasks.length,
            ),
            Container(
              color: const Color(0xff353E54),
              margin: const EdgeInsets.only(top: 16),
              height: 550,
              child: ListView.builder(
                itemCount: allTasks.length,
                itemBuilder: (context, index) {
                  return ToDoCard(
                    vartitle: allTasks[index].title,
                    varstatus: allTasks[index].status,
                    myFunc: changeStatus,
                    indexofTask: index,
                    deleteTask: deleteTask,
                  );
                },
              ),
            ),

            // ...allTasks
            //     .map(
            //       (item) => ToDoCard(
            //         vartitle: item.title,
            //         varstatus: item.status,
            //       ),
            //     )
            //     .toList()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  height: 200,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        maxLength: 25,
                        decoration: const InputDecoration(
                          hintText: 'Add new Task',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          addNewTask();
                          myController.text = "";
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'ADD',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
    );
  }
}
