class AvailabilityForm{

  String month;
  String email;
  String date;
  String time;

  AvailabilityForm(this.month, this.date, this.time,this.email);

  factory AvailabilityForm.fromJson(dynamic json) {
    return AvailabilityForm("${json['month']}", "${json['date']}",
        "${json['time']}","${json['email']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
    'month': month,
    'email': email,
    'date': date,
    'time': time,
  };
}