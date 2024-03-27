import 'package:intl/intl.dart';

class DateTimeUtils {
  /// Return fomatted date by local
  /// [format] default =  dd MMMM yyyy , output : 12 Juni 2002
  static String? dateFormat(dynamic tanggal,
      {String format = 'dd MMMM yyyy',
      String locale = 'id',
      Duration? addDuration}) {
    String? hasil;

    DateTime? date = toDateTime(tanggal);
    if (date != null) {
      if (addDuration != null) {
        date = date.add(addDuration);
      }
      hasil = DateFormat(format, locale).format(date).toString();
    }
    return hasil;
  }

  /// Return diff time
  static Duration differenceTime(dynamic tanggalAwal, dynamic tanggalAkhir) {
    DateTime awal, akhir;

    if (tanggalAwal is DateTime) {
      awal = tanggalAwal;
    } else {
      return const Duration(milliseconds: 0);
    }

    if (tanggalAkhir is DateTime) {
      akhir = tanggalAkhir;
    } else {
      return const Duration(milliseconds: 0);
    }

    Duration duration = akhir.difference(awal);
    return duration;
  }

  /// Return convert string to date
  static DateTime? toDateTime(dynamic tanggal) {
    if (tanggal is String) {
      return DateTime.tryParse(tanggal);
    }
    if (tanggal is DateTime) {
      return tanggal;
    }
    return null;
  }
}
