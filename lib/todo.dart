import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject{
  @HiveField(0)
  late String title;

  @HiveField(1)
  late bool isDone;

  Todo({
    required this.title,
    this.isDone=false,
});
}