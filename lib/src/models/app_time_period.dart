
import 'package:kid_management/src/models/my_app.dart';

class AppTimePeriod {
  int id;
  String startTime;
  String endTime;
  List<MyApp> apps;

  AppTimePeriod({this.id, this.startTime, this.endTime, this.apps});
}
