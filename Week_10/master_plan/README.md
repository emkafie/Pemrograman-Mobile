# master_plan

## Farrel Muchammad Kafie
## 2341720176


# Praktikum 1

## Langkah 1 - 9

### task.dart
```dart
class Task {
  final String description;
  final bool complete;

  const Task({
    this.description = '',
    this.complete = false
    });
}
```

### plan.dart
```dart
import './task.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  const Plan({this.name = '', this.tasks = const []});
}
```

### data_layer.dart
```dart
export 'plan.dart';
export 'task.dart';
```

### main.dart
```dart
import 'package:flutter/material.dart';
import './views/plan_screen.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: PlanScreen(),
    );
  }
}
```

### plan_screen.dart
```dart
import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan plan = const Plan();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ganti ‘Namaku' dengan Nama panggilan
      appBar: AppBar(title: const Text('Master Plan Farrel M Kafie')),
      body: _buildList(),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        setState(() {
          plan = Plan(
            name: plan.name,
            tasks: List<Task>.from(plan.tasks)..add(const Task()),
          );
        });
      },
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index], index),
    );
  }

  Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: task.description,
                  complete: selected ?? false,
                ),
            );
          });
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(description: text, complete: task.complete),
            );
          });
        },
      ),
    );
  }
}
```

### Output
![Prak11_GIF](/img/prak1_langkah9.gif)

## Langkah 10 - 14

### Modifikasi plan_screen.dart

```dart
 late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
```

```dart
  Widget _buildList() {
    return ListView.builder(
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index], index),
      controller: scrollController,
      keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
    );
  }
```

### Output
![Prak1_GIF](/img/prak1_langkah14.gif)

# Tugas Praktikum 1

### Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?

Perintah export berfungsi untuk "meneruskan" semua isi (seperti class Plan dan class Task) dari file-file tersebut agar bisa diakses oleh file lain. Mengimpor satu file data_layer.dart jauh lebih ringkas dan rapi daripada mengimpor 10 file satu per satu.

### Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?

Variabel Plan plan adalah state (data) utama untuk _PlanScreenState. Variabel plan inilah yang menyimpan semua informasi yang perlu ditampilkan di layar, yaitu daftar tugas (plan.tasks). Widget _buildList() akan membaca data dari plan.tasks untuk menentukan berapa banyak ListTile yang harus dibuat.

### Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah buat!

Hasilnya adalah sebuah layar yang menampilkan:

AppBar: Sebuah bilah judul di bagian atas (dengan nama).

Floating Action Button (FAB): Tombol bulat '+' di kanan bawah (dari Langkah 7).

Daftar Tugas (ListView): Area utama layar (dari Langkah 8).

### Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?

* initState() (Langkah 11)

    * Dipanggil satu kali tepat saat State pertama kali dibuat dan dimasukkan ke dalam widget tree. Ini terjadi sebelum build() pertama kali dipanggil.

    * Ini adalah tempat yang ideal untuk melakukan inisialisasi satu kali.

* dispose() (Langkah 13)

    * Dipanggil saat State akan dihapus secara permanen dari widget tree (misalnya, saat pindah ke layar lain).

    *  Ini adalah tempat untuk membersihkan sumber daya yang buat di initState untuk mencegah kebocoran memori (memory leaks).


## Praktikum 2

### plan_provider.dart
```dart
import 'package:flutter/material.dart';
import '../models/data_layer.dart';

class PlanProvider extends InheritedNotifier<ValueNotifier<Plan>> {
  const PlanProvider({super.key, required Widget child, required
   ValueNotifier<Plan> notifier})
  : super(child: child, notifier: notifier);

  static ValueNotifier<Plan> of(BuildContext context) {
   return context.
    dependOnInheritedWidgetOfExactType<PlanProvider>()!.notifier!;
  }
}
```

### modifikasi main.dart
```dart
class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: PlanProvider(
        notifier: ValueNotifier<Plan>(const Plan()),
        child: const PlanScreen(),
      ),
    );
  }
}
```

### modifikasi plan.dart
```dart
import './task.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  const Plan({this.name = '', this.tasks = const []});

  int get completedCount => tasks.where((task) => task.complete).length;

  String get completenessMessage =>
      '$completedCount out of ${tasks.length} tasks';
}
```

### modifikasi plan.dart
```dart
import '../models/data_layer.dart';
import 'package:flutter/material.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ganti ‘Namaku' dengan Nama panggilan
      appBar: AppBar(title: const Text('Master Plan Farrel M Kafie')),
      body: ValueListenableBuilder<Plan>(
        valueListenable: PlanProvider.of(context),
        builder: (context, plan, child) {
          return Column(
            children: [
              Expanded(child: _buildList(plan)),
              SafeArea(child: Text(plan.completenessMessage)),
            ],
          );
        },
      ),
      // _buildAddTaskButton sekarang perlu 'context'
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = planNotifier.value;
        planNotifier.value = Plan(
          name: currentPlan.name,
          tasks: List<Task>.from(currentPlan.tasks)..add(const Task()),
        );
      },
    );
  }

  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index, context),
    );
  }

  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          Plan currentPlan = planNotifier.value;
          planNotifier.value = Plan(
            name: currentPlan.name,
            tasks: List<Task>.from(currentPlan.tasks)
              ..[index] = Task(
                description: task.description,
                complete: selected ?? false,
              ),
          );
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          Plan currentPlan = planNotifier.value;
          planNotifier.value = Plan(
            name: currentPlan.name,
            tasks: List<Task>.from(currentPlan.tasks)
              ..[index] = Task(description: text, complete: task.complete),
          );
        },
      ),
    );
  }
}
```

### Output
![prak2_GIF](/img/prak2.gif)

## Tugas Praktikum 2

### Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan InheritedNotifier?

Class InheritedNotifier adalah subclass (turunan) dari InheritedWidget. Jadi, ketika membuat PlanProvider yang extends InheritedNotifier, sebenarnya sedang membuat sebuah InheritedWidget dengan kemampuan tambahan.

Menggunakan InheritedNotifier (dan bukan InheritedWidget biasa) karena ingin widget turunan (seperti PlanScreen) secara otomatis diperbarui (di-rebuild) setiap kali datanya berubah.

### Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?

* int get completedCount => ...

    * Maksud: Ini adalah getter untuk menghitung jumlah tugas yang sudah selesai.

    * Cara kerjanya: Ia mengambil list tasks, menyaringnya (.where) untuk hanya menyisakan tugas yang properti complete-nya true, lalu menghitung jumlahnya (.length).

* String get completenessMessage => ...

    * Maksud: Ini adalah getter untuk membuat pesan status progres dalam bentuk String.

    * Cara kerjanya: Ia mengambil nilai dari completedCount (misal: 3) dan jumlah total tugas dari tasks.length (misal: 5), lalu menggabungkannya menjadi sebuah kalimat seperti "3 out of 5 tasks".


### Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah buat!

(gif pada output)

Satu perbedaan utama di UI: Di bagian bawah layar, kini ada teks status progres (misalnya: "0 out of 0 tasks").
Memisahkan data/logic (Model & Provider) dari tampilan (View) dan membuat tampilan tersebut reaktif terhadap perubahan data. Teks progres di bagian bawah adalah bukti visual bahwa semua komponen tersebut telah terhubung dengan benar.


# Praktikum 3

### modifikasi plan_provider

### Output
![prak3_GIF](/img/prak3.gif)

## Tugas Praktikum 3

### Berdasarkan Praktikum 3 yang telah Anda lakukan, jelaskan maksud dari gambar diagram berikut ini!
1. Diagram Sebelah Kiri (Layar Awal)
Ini adalah widget tree dari layar utama aplikasi, yaitu PlanCreatorScreen (yang atur sebagai home di main.dart pada Langkah 9).

    Layar ini berada di bawah PlanProvider sehingga ia bisa mengakses daftar rencana.

    Layar ini memiliki Column yang berisi TextField (untuk menambah rencana baru, dari Langkah 12) dan ListView (untuk menampilkan semua rencana yang ada, dari Langkah 14).

2. Panah "Navigator Push" (Aksi)
Ini adalah aksi yang terjadi pada Langkah 14, tepatnya di dalam widget _buildMasterPlans.

    Ketika mengetuk (onTap) salah satu ListTile (rencana) di ListView, memanggil perintah Navigator.of(context).push(...).

    Aksi ini "mendorong" atau menampilkan layar baru di atas layar PlanCreatorScreen.

3. Diagram Sebelah Kanan (Layar Tujuan)
Ini adalah widget tree dari layar baru yang muncul setelah aksi push, yaitu PlanScreen (yang sekarang berfungsi sebagai layar detail).

    Layar ini (ditandai hijau) menerima data plan yang spesifik dari layar sebelumnya.

    Layar ini kemudian menampilkan detail dari rencana tersebut, yang berisi ListView (untuk daftar tugas) dan Text di dalam SafeArea (untuk menampilkan completenessMessage atau progres).

### Lakukan capture hasil dari Langkah 14 berupa GIF, kemudian jelaskan apa yang telah Anda buat!

Mengubah arsitektur aplikasi secara signifikan, dari yang tadinya hanya mengelola satu rencana (to-do list) menjadi aplikasi yang bisa mengelola banyak rencana.

* Ini adalah perubahan utamanya:

    * State Management Diubah PlanProvider sekarang bertugas menyimpan `ValueNotifier<List<Plan>>` (daftar dari banyak rencana), bukan lagi `ValueNotifier<Plan>` (satu rencana).

    * Layar Utama Baru (PlanCreatorScreen) membuat screen baru (PlanCreatorScreen) yang sekarang menjadi home aplikasi. Layar ini memiliki dua fungsi utama:

    * Menambah Rencana: Memiliki TextField untuk membuat dan menambahkan Plan baru ke dalam list global di PlanProvider.

    * Menampilkan Semua Rencana: Memiliki ListView (_buildMasterPlans) yang membaca list dari PlanProvider dan menampilkan semua rencana yang telah dibuat.

    * PlanScreen Menjadi Layar Detail Layar PlanScreen (yang sebelumnya menjadi layar utama) kini diubah fungsinya menjadi layar detail.

    * Alur Navigasi Saat pengguna mengetuk salah satu rencana di PlanCreatorScreen, aplikasi akan bernavigasi ke PlanScreen sambil mengirimkan data plan yang spesifik untuk ditampilkan.

    * Logika Update Data Dirombak Setiap kali menambah atau mengedit tugas di PlanScreen, logikanya diubah total. PlanScreen sekarang harus:

    * Mencari tahu index dari rencana yang sedang diedit di dalam `List<Plan>` global.

    * Membuat salinan baru dari keseluruhan `List<Plan>` di PlanProvider, dengan mengganti rencana pada index tersebut dengan data yang sudah diperbarui.