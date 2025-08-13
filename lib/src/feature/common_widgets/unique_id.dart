import 'package:uuid/uuid.dart';

var uuid = Uuid();

String generateTaskId() {
  return uuid.v4();
}

String generateChapterId() {
  return uuid.v4();
}
