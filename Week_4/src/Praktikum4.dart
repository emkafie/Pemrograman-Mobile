void main() {
  var list = [1, 2, null];
  var list2 = [0, ...list];

  var listNIM = [2341720176];
  var listGabungan = [...list, ...listNIM];

  bool promoActive = true;
  var nav = ['Home', 'Furniture', if (promoActive) 'Outlet'];
  print('promoActive true: $nav');

  promoActive = false;
  var nav2 = ['Home', 'Furniture', if (promoActive) 'Outlet'];
  print('promoActive false: $nav2');

  var login = 'Manager';
  var nav3 = [
    'Home',
    'Furniture',
    'Plants',
    if (login case 'Manager') 'Inventory',
  ];
  print('\n$nav3');

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);

  print('\nlist: $list');
  print('list2: $list2');
  print('list2.length: ${list2.length}');
  print('listNIM: $listNIM');
  print('listGabungan: $listGabungan');
}
