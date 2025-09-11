void main() {
  String nama = "Farrel Muchammad Kafie";
  String nim = "2341720176";

  for (int i = 0; i <= 201; i++) {
    print(i);
    if (isPrime(i)) {
      print("$i adalah bilangan prima - $nama - $nim");
    }
  }
}

bool isPrime(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}
