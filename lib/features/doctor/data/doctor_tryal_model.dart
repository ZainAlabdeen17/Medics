import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_strings.dart';

class DoctorTrialModel {
  final int id;
  final String name;
  final String specialization;
  final String image;
  final double rating;

  // New fields
  final String generalInfo;
  final String currentWorkPlace;
  final String education;
  final String certification;
  final String training;
  final String licensure;
  final String experience;

  DoctorTrialModel({
    required this.id,
    required this.name,
    required this.specialization,
    required this.image,
    required this.rating,
    required this.generalInfo,
    required this.currentWorkPlace,
    required this.education,
    required this.certification,
    required this.training,
    required this.licensure,
    required this.experience,
  });

  static List<DoctorTrialModel> getDoctors() {
    return [
      DoctorTrialModel(
        id: 5874658,
        name: "Dr. Mia Miller",
        specialization: AppStrings.neurologist,
        image: Assets.assetsImagesDoctorsDoctor1,
        rating: 5.0,
        generalInfo:
            "Experienced neurologist specializing in epilepsy, migraines and neurodegenerative disorders.",
        currentWorkPlace: "NeuroCare Center, Seattle, Washington",
        education: "Doctor of Medicine (MD), Stanford University.",
        certification: "Board-certified in Neurology.",
        training: "Advanced fellowship in clinical neurophysiology.",
        licensure: "Licensed to practice in multiple U.S. states.",
        experience: "12+ years in neurology and patient care.",
      ),

      DoctorTrialModel(
        id: 1492357,
        name: "Dr. Norah Still",
        specialization: AppStrings.cardiologist,
        image: Assets.assetsImagesDoctorsDoctor2,
        rating: 4.9,
        generalInfo:
            "Preventive cardiologist focused on heart failure and cardiac imaging.",
        currentWorkPlace: "Mercy Heart Institute, Boston",
        education: "Doctor of Medicine (MD), Johns Hopkins University.",
        certification: "Board-certified in Cardiology.",
        training: "Residency and fellowship at Cleveland Clinic.",
        licensure: "Fully licensed cardiologist.",
        experience: "Over 12 years in advanced cardiac care.",
      ),

      DoctorTrialModel(
        id: 7785691,
        name: "Dr. Helena Fox",
        specialization: AppStrings.radiologist,
        image: Assets.assetsImagesDoctorsDoctor3,
        rating: 4.8,
        generalInfo:
            "Radiologist specialized in MRI, CT and diagnostic imaging.",
        currentWorkPlace: "Advanced Imaging Center, Chicago",
        education: "MD, University of Pennsylvania.",
        certification: "Board-certified in Diagnostic Radiology.",
        training: "Fellowship in neuroradiology.",
        licensure: "Licensed diagnostic radiologist.",
        experience: "10 years in medical imaging.",
      ),

      DoctorTrialModel(
        id: 4397615,
        name: "Dr. Andrew Miller",
        specialization: AppStrings.dentist,
        image: Assets.assetsImagesDoctorsDoctor4,
        rating: 3.2,
        generalInfo:
            "General dentist focused on cosmetic and restorative procedures.",
        currentWorkPlace: "Smile Dental Clinic, New York",
        education: "DDS, Columbia University.",
        certification: "Certified in cosmetic dentistry.",
        training: "Implantology and restorative training.",
        licensure: "Licensed dental practitioner.",
        experience: "8 years in dental care.",
      ),

      DoctorTrialModel(
        id: 1298453,
        name: "Dr. Jack Buckly",
        specialization: AppStrings.pulmonologist,
        image: Assets.assetsImagesDoctorsDoctor7,
        rating: 4.1,
        generalInfo: "Pulmonologist treating asthma, COPD and lung disorders.",
        currentWorkPlace: "Respira Medical Center, Houston",
        education: "MD, Baylor College of Medicine.",
        certification: "Board-certified in Pulmonary Medicine.",
        training: "Critical care fellowship.",
        licensure: "Licensed pulmonologist.",
        experience: "11 years in respiratory medicine.",
      ),

      DoctorTrialModel(
        id: 7193825,
        name: "Dr. Anya Taylor Joe",
        specialization: AppStrings.gynecologist,
        image: Assets.assetsImagesDoctorsDoctor8,
        rating: 3.7,
        generalInfo:
            "Gynecologist specializing in women's health and prenatal care.",
        currentWorkPlace: "Women's Health Center, San Diego",
        education: "MD, UCLA School of Medicine.",
        certification: "Board-certified OB-GYN.",
        training: "Advanced maternal care fellowship.",
        licensure: "Licensed gynecologist.",
        experience: "9 years in obstetrics and gynecology.",
      ),

      DoctorTrialModel(
        id: 9146372,
        name: "Dr. Noa Brown",
        specialization: AppStrings.urologist,
        image: Assets.assetsImagesDoctorsDoctor6,
        rating: 5.0,
        generalInfo:
            "Urologist treating kidney, bladder and urinary disorders.",
        currentWorkPlace: "UroHealth Institute, Dallas",
        education: "MD, Duke University.",
        certification: "Board-certified in Urology.",
        training: "Endourology fellowship.",
        licensure: "Licensed urology specialist.",
        experience: "13 years of practice.",
      ),

      DoctorTrialModel(
        id: 8921476,
        name: "Dr. Sara Palm",
        specialization: AppStrings.traumatologist,
        image: Assets.assetsImagesDoctorsDoctor5,
        rating: 4.3,
        generalInfo:
            "Trauma specialist focused on orthopedic injuries and emergency care.",
        currentWorkPlace: "Trauma Center, Denver",
        education: "MD, University of Michigan.",
        certification: "Board-certified in Trauma Surgery.",
        training: "Orthopedic trauma fellowship.",
        licensure: "Licensed trauma surgeon.",
        experience: "14 years in trauma medicine.",
      ),
    ];
  }
}
