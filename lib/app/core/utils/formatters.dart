String? formatDate(String date) {
  try {
    final dateArray = date.split('-');

    final day = dateArray[2].padLeft(2, '0');
    final month = dateArray[1].padLeft(2, '0');
    final year = dateArray[0];

    return '$day/$month/$year';
  } catch (e) {
    throw Exception('O valor informado não é uma data no formato YYYY-MM-DD');
  }
}
