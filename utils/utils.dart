import 'package:firestore/import.dart';

const textSize14 = TextStyle(
  fontSize: 14,
);

const textSize14Bold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold
);

const textSize16 = TextStyle(
  fontSize: 16,
);

const textSize16Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold
);

const textSize18 = TextStyle(
  fontSize: 18,
);

const textSize18Bold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold
);

const textSize20 = TextStyle(
  fontSize: 20,
);

const textSize20Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold
);

const textSize22 = TextStyle(
  fontSize: 22,
);

const textSize22Bold = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold
);

const textSize24 = TextStyle(
  fontSize: 24,
);

const textSize24Bold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold
);


const textSize28 = TextStyle(
  fontSize: 28,
);

const textSize28Bold = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold
);

const textSize32 = TextStyle(
  fontSize: 28,
);

const textSize32Bold = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold
);

bool empty([dynamic data, bool acceptZero = false]) {
  if (data != null) {
    if ((data is Map || data is List) && (data.length == 0
        || (data is List && data.length == 1 && empty(data.first, acceptZero)))) {
      return true;
    }
    if ((data is Map || data is Iterable) && data.isEmpty) {
      return true;
    }
    if (data is bool) {
      return !data;
    }
    if ((data is String || data is num) && (data == '0' || data == 0)) {
      if (acceptZero) {
        return false;
      }else{
        return true;
      }
    }
    if (data.toString().trim().isNotEmpty) {
      return false;
    }
  }
  return true;
}
bool isset([dynamic data]) {
  if (data != null) return true;
  return false;
}

String formatTime(Duration duration) {
  int minutes = duration.inMinutes.remainder(60);
  int seconds = duration.inSeconds.remainder(60);

  String minutesStr = (minutes < 10) ? '0$minutes' : '$minutes';
  String secondsStr = (seconds < 10) ? '0$seconds' : '$seconds';

  return '$minutesStr:$secondsStr';
}
