import 'package:medics/features/doctor/data/models/doctor_tryal_model.dart';

class ChatModel {
  static List<Map<String, dynamic>> getRecentChats() {
    return [
      {
        'name': DoctorTrialModel.getDoctors()[0].name,
        'you': false,
        'lastMessage': 'How are you feeling today?',
        'time': '2:30 PM',
        'image': DoctorTrialModel.getDoctors()[0].image,
      },
      {
        'name': DoctorTrialModel.getDoctors()[6].name,
        'you': false,
        'lastMessage': 'This lab report is very good',
        'time': '2:10 PM',
        'image': DoctorTrialModel.getDoctors()[6].image,
      },
      {
        'name': DoctorTrialModel.getDoctors()[2].name,
        'you': false,
        'lastMessage': 'yes you can book appointment with me',
        'time': '2:02 PM',
        'image': DoctorTrialModel.getDoctors()[2].image,
      },
      {
        'name': DoctorTrialModel.getDoctors()[4].name,
        'you': true,
        'lastMessage': 'Is this medication good for me ?',
        'time': '1:30 PM',
        'image': DoctorTrialModel.getDoctors()[4].image,
      },
      {
        'name': DoctorTrialModel.getDoctors()[3].name,
        'you': true,
        'lastMessage': 'I have pain at the same area is that ordinary ?',
        'time': '12:44 PM',
        'image': DoctorTrialModel.getDoctors()[3].image,
      },
      {
        'name': DoctorTrialModel.getDoctors()[1].name,
        'you': false,
        'lastMessage':
            'yes you can ask me whenever you want , because I have a small time every evening , so I can replay to all',
        'time': '11:17 AM',
        'image': DoctorTrialModel.getDoctors()[1].image,
      },
      {
        'name': DoctorTrialModel.getDoctors()[7].name,
        'you': false,
        'lastMessage':
            'Don\'t use this medication more than 3 times a day , and if you feel any side effect please contact me immediately',
        'time': '11:00 AM',
        'image': DoctorTrialModel.getDoctors()[7].image,
      },
    ];
  }
}
