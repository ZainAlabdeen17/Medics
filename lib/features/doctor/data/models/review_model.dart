class ReviewModel {
  final String reviewerName;
  final String reviewDate;
  final String reviewText;
  final double rating;

  ReviewModel({
    required this.reviewerName,
    required this.reviewDate,
    required this.reviewText,
    required this.rating,
  });
  static List<ReviewModel> getDummyReviews() {
    return [
      ReviewModel(
        reviewerName: 'Sarah Palladium',
        reviewDate: 'May 11, 2024',
        reviewText:
            'Dr. Montgomery’s expertise in cardiology is outstanding. She made me feel comfortable and explained everything in detail. Her approach to heart health is proactive and compassionate. I’m grateful for her care and highly recommend her.',
        rating: 4.0,
      ),
      ReviewModel(
        reviewerName: 'James Robert',
        reviewDate: 'June 5, 2024',
        reviewText:
            'Absolutely fantastic cardiologist. Dr. Montgomery took the time to understand my family history and run thorough tests. She explained my condition in simple terms and gave me a clear action plan. My blood pressure has improved significantly under her care.',
        rating: 4.0,
      ),
      ReviewModel(
        reviewerName: 'Linda Killstone',
        reviewDate: 'April 22, 2024',
        reviewText:
            'I was very nervous about my heart palpitations, but Dr. Montgomery was so reassuring and kind. She ordered the right diagnostics and found a minor valve issue that others missed. Her follow-up care is excellent. Truly a top cardiologist.',
        rating: 2.8,
      ),
      ReviewModel(
        reviewerName: 'Robert Tiana',
        reviewDate: 'May 28, 2024',
        reviewText:
            'Dr. Montgomery combines deep medical knowledge with genuine empathy. She listened to all my concerns and never rushed me. After my angioplasty, she called me personally to check on my recovery. That level of dedication is rare and appreciated.',
        rating: 2,
      ),
      ReviewModel(
        reviewerName: 'Maria Sabanci',
        reviewDate: 'March 15, 2024',
        reviewText:
            'I have seen several cardiologists over the years, and Dr. Montgomery is by far the best. She updated my medications based on the latest guidelines and encouraged lifestyle changes that actually work. My cholesterol is now under control. Highly recommended!',
        rating: 1,
      ),
      ReviewModel(
        reviewerName: 'David Lanlord',
        reviewDate: 'June 10, 2024',
        reviewText:
            'Dr. Montgomery is a true professional. She explained my echocardiogram results with great clarity and answered every question patiently. The preventive plan she set up for me includes diet, exercise, and regular monitoring. I feel confident about my heart health now.',
        rating: 3.0,
      ),
      ReviewModel(
        reviewerName: 'Patricia Willson',
        reviewDate: 'April 5, 2024',
        reviewText:
            'After my father had a heart attack, I wanted a thorough check-up. Dr. Montgomery did a full cardiac risk assessment and discovered I had high Lp(a) levels. She started me on a proactive treatment plan. Her attention to detail and caring nature are exceptional.',
        rating: 2.7,
      ),
      ReviewModel(
        reviewerName: 'Michael Caduim',
        reviewDate: 'May 20, 2024',
        reviewText:
            'The best doctor visit I’ve ever had. Dr. Montgomery’s office is efficient, and she spent over 30 minutes with me. She reviewed my past records, suggested a stress test, and even gave me a heart-healthy recipe handout. I left feeling empowered and informed.',
        rating: 5.0,
      ),
      ReviewModel(
        reviewerName: 'Jennifer Halsy',
        reviewDate: 'March 30, 2024',
        reviewText:
            'I was hesitant about seeing a cardiologist at my age, but Dr. Montgomery made me feel completely at ease. She explained that prevention is key and showed me how to monitor my own blood pressure. Her warm personality and clear communication are top-notch.',
        rating: 4.0,
      ),
      ReviewModel(
        reviewerName: 'William Ford',
        reviewDate: 'June 18, 2024',
        reviewText:
            'Dr. Montgomery saved my life. I came in with mild chest discomfort, and she immediately recognized the signs of a silent ischemia. She admitted me to the hospital and arranged an urgent catheterization. I am forever grateful for her quick thinking and skill.',
        rating: 5.0,
      ),
      ReviewModel(
        reviewerName: 'Elizabeth Davis',
        reviewDate: 'April 12, 2024',
        reviewText:
            'Very impressed with Dr. Montgomery. She is up-to-date on the latest research and doesn’t over-prescribe medications. For my mild arrhythmia, she recommended dietary changes and stress reduction techniques first. It worked wonders. She genuinely cares about whole-patient wellness.',
        rating: 4.0,
      ),
      ReviewModel(
        reviewerName: 'Thomas Balcony.',
        reviewDate: 'May 7, 2024',
        reviewText:
            'From the moment I walked in, Dr. Montgomery made me feel like a priority. She took a detailed history and noticed a family pattern of early heart disease. She ordered genetic testing and started me on a statin early. Her proactive approach gives me peace of mind.',
        rating: 3.0,
      ),
      ReviewModel(
        reviewerName: 'Susan Niaomi.',
        reviewDate: 'June 25, 2024',
        reviewText:
            'I cannot recommend Dr. Montgomery enough. She has a rare combination of brilliance and bedside manner. She even called my primary care doctor to coordinate my care. My heart failure symptoms have improved dramatically under her management. She is a lifesaver.',
        rating: 1.0,
      ),
    ];
  }
}
