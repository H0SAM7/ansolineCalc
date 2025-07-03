
import 'dart:developer';
String getFormattedDateTime({required String? createdAt}) {
  if (createdAt == null || createdAt.isEmpty) return '';

  try {
    // Parse the string to DateTime
    DateTime parsedDate = DateTime.parse(createdAt);

    // Extract day, month, year, hour, and minute
    int day = parsedDate.day;
    int monthNumber = parsedDate.month;
    int year = parsedDate.year;
    int hour = parsedDate.hour;
    int minute = parsedDate.minute;

    // Validate month before calling _getMonthName
    if (monthNumber < 1 || monthNumber > 12) {
      log('Invalid month in date: $createdAt, month: $monthNumber');
      return 'تاريخ غير صحيح';
    }

    String month = _getMonthName(monthNumber);

    // Determine if the time is PM and adjust hour for 12-hour format
    String period = hour >= 12 ? 'م' : 'ص'; // م for PM, ص for AM
    hour = hour % 12;
    hour = hour == 0 ? 12 : hour; // Convert hour '0' to '12'

    // Format minute to ensure two digits
    String formattedMinute = minute.toString().padLeft(2, '0');

    // Return the formatted string in Arabic
    return '$day $month $year $hour:$formattedMinute $period';
  } catch (e) {
    log('Error parsing date: $createdAt, Error: $e');
    return 'تاريخ غير صحيح';
  }
}
String _getMonthName(int month) {
  const List<String> months = [
    'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو',
    'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر'
  ];
  
  // Add validation
  if (month < 1 || month > 12) {
    log('Invalid month value: $month'); // For debugging
    return 'شهر غير صحيح';
  }
  
  // Additional safety check
  if (month - 1 >= months.length) {
    log('Month index out of range: ${month - 1}, list length: ${months.length}');
    return 'شهر غير صحيح';
  }
  
  return months[month - 1];
}

String getFormattedHigriTime(String hijriDate) {
  if (hijriDate.isEmpty) return '';
  
  try {
    // Split the date and time
    List<String> parts = hijriDate.split(' - ');
    if (parts.length != 2) return hijriDate; // Fallback if format is unexpected

    String datePart = parts[0]; // "الثلاثاء 15 ذوالقعدة 1446"
    String timePart = parts[1]; // "08:03:03"

    // Optionally reformat the time (e.g., convert 24-hour to 12-hour with AM/PM in Arabic)
    List<String> timeComponents = timePart.split(':');
    if (timeComponents.length < 3) return hijriDate;

    int hour = int.parse(timeComponents[0]);
    int minute = int.parse(timeComponents[1]);
    int second = int.parse(timeComponents[2]);
    
    String period = hour >= 12 ? 'م' : 'ص'; 
    hour = hour % 12 == 0 ? 12 : hour % 12;
    String formattedTime = '$hour:${minute.toString().padLeft(2, '0')} $period';

    return '$datePart\n$formattedTime'; // Display date and time on separate lines
  } catch (e) {
    print('Error parsing Hijri date: $hijriDate, Error: $e');
    return hijriDate; // Return original if parsing fails
  }
}  