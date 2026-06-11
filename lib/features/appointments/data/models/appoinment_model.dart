import 'package:medics/core/utils/app_assets.dart';

class Appointment {
  final String doctorName;
  final String specialty;
  final String date;
  final String time;
  final String imagePath;


  Appointment({
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.time,
    required this.imagePath,
  });

 static List<Appointment> getAppointments() {
    return [
      Appointment(
        doctorName: 'Dr. John Smith',
        specialty: 'Cardiologist',
        date: '12 Nov',
        time: '12:00 - 12:45 PM',
        imagePath:Assets.assetsImagesDoctorsDoctor1,
      ),
      Appointment(
        doctorName: 'Dr. Ch.E. Montgomery',
        specialty: 'Cardiologist',
        date: '12 Nov',
        time: '12:00 - 12:45 PM',
        imagePath: Assets.assetsImagesDoctorsDoctor2,
      ),
      Appointment(
        doctorName: 'Dr. Helena Fox',
        specialty: 'Radiologist',
        date: '12 Nov',
        time: '12:00 - 12:45 PM',
        imagePath: Assets.assetsImagesDoctorsDoctor3,
      ),
      Appointment(
        doctorName: 'Dr. Andrew Miller',
        specialty: 'Neurologist',
        date: '12 Nov',
        time: '12:00 - 12:45 PM',
        imagePath: Assets.assetsImagesDoctorsDoctor4,
      ),
    ];
  }
}
