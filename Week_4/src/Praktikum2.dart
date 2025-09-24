void main() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

  var names1 = <String>{};
  Set<String> names2 = {}; // This works, too.

  names1.add('Farrel Muchammad Kafie');
  names2.addAll({'2341720176'});

  print('Halogens: $halogens');
  print('Nama: $names1');
  print('NIM : $names2');
}
