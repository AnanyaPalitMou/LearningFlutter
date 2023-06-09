import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'todo.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Todo List', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
      ),
      body: ValueListenableBuilder<Box<Todo>>(
        valueListenable: Hive.box<Todo>('todos').listenable(),
        builder: (context, box, _){
          if(box.isEmpty){
            return Center(
            child: Text('No Todo', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            );
          }
          return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index){
            final todo=box.getAt(index) as Todo;

            return ListTile(
              title: Text(todo.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              trailing: Checkbox(
                value: todo.isDone,
                onChanged: (value){
                  todo.isDone=value!;
                  todo.save();
                },

              ),
              onTap: (){
                _showUpdateDialog(context, todo);
              },
              onLongPress: (){
                _showDeleteConfirmationDialog(context, todo);
              },
            );
          },
          );

        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showAddTodoDialog(context);
        },

        child: Icon(Icons.add),

      ),

    );
  }

  void _showAddTodoDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (context){
          String title='';

          return AlertDialog(
            title: Text('Add Todo'),
            content: TextField(
              onChanged: (value){
                title=value;
              },
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    final todo=Todo(title: title);
                    final box=Hive.box<Todo>('todos');
                    box.add(todo);
                    Navigator.pop(context);
                  },
                  child: Text('Add'),
              ),
            ],
          );


        },
        );
  }

  void _showUpdateDialog(BuildContext context, Todo todo){

    String updateTitle=todo.title;

    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('Update Todo'),
          content: TextField(
            onChanged: (value){
              updateTitle=value;
            },
            controller: TextEditingController(text: todo.title),
          ),
          actions: [
            TextButton(
              onPressed: (){
                todo.title=updateTitle;
                todo.save();
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, Todo todo){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Delete Todo'),
            content: Text('Are you sure you want to delete this Todo?'),
            actions: [
              TextButton(
                  onPressed: (){
                    final box=Hive.box<Todo>('todos');
                    box.delete(todo.key);
                    Navigator.pop(context);
                  },
                  child: Text('Delete'),
              ),
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
              ),
            ],
          );
        },
        );
  }

}
