void main() {
  var gifts = <String, String>{
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings',
  };

  var nobleGases = <int, String>{2: 'helium', 10: 'neon', 18: 'argon'};

  var mhs1 = <String, String>{};
  var mhs2 = <int, String>{};

  // Tambahkan nama dan NIM ke gifts
  gifts['nama'] = 'Farrel Muchammad Kafie';
  gifts['nim'] = '2341720176';

  // Tambahkan nama dan NIM ke nobleGases
  nobleGases[99] = 'Farrel Muchammad Kafie';
  nobleGases[100] = '2341720176';

  // Tambahkan nama dan NIM ke mhs1
  mhs1['nama'] = 'Farrel Muchammad Kafie';
  mhs1['nim'] = '2341720176';

  // Tambahkan nama dan NIM ke mhs2
  mhs2[1] = 'Farrel Muchammad Kafie';
  mhs2[2] = '2341720176';

  print('gifts: $gifts');
  print('nobleGases: $nobleGases');
  print('mhs1: $mhs1');
  print('mhs2: $mhs2');
}
