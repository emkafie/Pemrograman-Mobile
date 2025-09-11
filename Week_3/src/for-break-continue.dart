void main() {
  for (int i = 10; i < 27; i++) {
    print(i);
    if (i == 21) {
      break;
    } else if (i > 1 || i < 7) {
      print(i);
      continue;
    }
  }
}
