class FaqItem {
  final String question;
  final String answer;

  FaqItem({required this.question, required this.answer});
}

final List<FaqItem> faqList = [
  FaqItem(
    question: 'How far in advance can I cancel my appointment?',
    answer:
        'You can cancel your appointment up to 2 hours before the scheduled appointment time.',
  ),
  FaqItem(
    question: 'What is the refund policy if I cancel my appointment?',
    answer:
        'If you cancel your booking, you will receive a 50% refund of the paid amount.',
  ),
  FaqItem(
    question: 'What happens if the doctor cancels the appointment?',
    answer:
        'If the appointment is canceled by the doctor, you will receive a full 100% refund.',
  ),
  FaqItem(
    question: 'Can I reschedule my appointment?',
    answer:
        'Yes, you can reschedule your appointment once. However, rescheduling is not allowed less than 2 hours before the appointment time.',
  ),
  FaqItem(
    question: 'When can I leave a review for a doctor?',
    answer:
        'You can leave a review after completing at least 3 appointments with the same doctor.',
  ),
];
