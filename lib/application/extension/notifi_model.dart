import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/model/task_notifi.dart';

extension TaskModel on NotifyTaskData {
  TaskNotify toGetNotifyTask() {
    return TaskNotify(
        id: id,
        title: title,
        note: note,
        isCompleted: isCompleted,
        ringDay: ringDay,
        daySave: daySave,
        startTime: startTime,
        endTime: endTime,
        color: color,
        remind: remind);
  }
}
