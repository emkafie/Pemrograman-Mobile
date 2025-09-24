void main() {
  final List<String?> list = List.filled(5, null);
  list[1] = "Farrel Muchammad Kafie";
  list[2] = "2341720176";

  for (int i = 0; i < list.length; i++) {
    if (list[i] == null) {
      list[i] = "Data ke-$i";
    }
  }

  print(list);
}
