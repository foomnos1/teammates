import 'package:flutter/material.dart';
import 'package:angelo/util/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 164, 108, 209),
      content: SizedBox(
        height: 120, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ), 

                labelText: "Add New Task",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextStyle(
                color: Colors.white,
                
              ),
            ),


        //buttons - save & cancel
        
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        //save button
        children: [
          Button(text: "Save", onPressed: onSave),

          const SizedBox(width: 9),

          Button(text: "Cancel", onPressed: onCancel),
        ],
      )


      ]),
      )
    );
  }
}