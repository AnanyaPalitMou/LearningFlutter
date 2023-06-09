part of 'todo.dart';

class TodoAdapter extends TypeAdapter<Todo>{
  @override
  final int typeId=0;

  @override
  Todo read(BinaryReader reader){
    return Todo(
      title: reader.read(),
      isDone: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Todo obj){
    writer.write(obj.title);
    writer.write(obj.isDone);
  }
}