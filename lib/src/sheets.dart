import 'package:firebase_database/firebase_database.dart';
import 'package:logger/logger.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref("1cdSgrLDjTPxl8tULut7N4vjQezvR8epybj3HWWTmVq8/G11/YoungmokRyu/진현도");
var appLogger = Logger();
void getData() async {
  appLogger.d("Works until here");
  ref.onValue.listen((DatabaseEvent event) {
    final data = event.snapshot.value;
    appLogger.d(data);
  });
}
