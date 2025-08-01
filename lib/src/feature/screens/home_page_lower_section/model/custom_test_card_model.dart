class CustomTestCardModel{
  final String cardTitle;
  final String cardDate;
  final int leftDays;
  final List<String>? topics;

  CustomTestCardModel({
    required this.cardTitle,
    required this.cardDate,
    required this.leftDays,
    this.topics,
});
}