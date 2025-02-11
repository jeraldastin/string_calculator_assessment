class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) 
        return 0;

    String delimiter = ',';

    if (numbers.startsWith("//")) {
      List<String> parts = numbers.split("\n");
      delimiter = parts[0].substring(2);
      numbers = parts.sublist(1).join("\n");
    }

    numbers = numbers.replaceAll("\n", delimiter);

    List<int> numList = numbers
        .split(delimiter)
        .map((num) => int.parse(num.trim()))
        .toList();

    List<int> negatives = numList.where((num) => num < 0).toList();
    if (negatives.isNotEmpty) {
      throw FormatException('Negatives not allowed: ${negatives.join(", ")}');
    }

    int sum = 0;
    for (var num in numList) {
      sum += num;
    }

    return sum;
  }
}
