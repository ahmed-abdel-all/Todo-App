import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  final String vartitle;
  final bool varstatus;
  final Function myFunc;
  final int indexofTask;
  final Function deleteTask;

  const ToDoCard(
      {super.key,
      required this.vartitle,
      required this.varstatus,
      required this.myFunc,
      required this.indexofTask,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myFunc(indexofTask);
      },
      child: FractionallySizedBox(
        widthFactor: .9,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(top: 22),
          decoration: BoxDecoration(
            color: const Color(0xff4B515C),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(
                  color: varstatus
                      ? const Color.fromARGB(255, 27, 26, 26)
                      : Colors.white,
                  fontSize: 20,
                  decoration: varstatus
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              Row(
                children: [
                  Icon(
                    varstatus ? Icons.done : Icons.close,
                    color: varstatus ? Colors.greenAccent : Colors.red,
                    size: 32,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  IconButton(
                    onPressed: () {
                      deleteTask(indexofTask);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 255, 200, 196),
                      size: 32,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
