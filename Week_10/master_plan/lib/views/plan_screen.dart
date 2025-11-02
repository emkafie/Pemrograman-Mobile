import '../models/data_layer.dart';
import 'package:flutter/material.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

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
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return ValueListenableBuilder<List<Plan>>(
      valueListenable: plansNotifier,
      builder: (context, plans, child) {
        Plan currentPlan = plans.firstWhere(
          (p) => p.name == widget.plan.name,
          orElse: () =>
              const Plan(),
        );

        return Scaffold(
          appBar: AppBar(
            title: Text(currentPlan.name),
          ),
          body: Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          ),
          floatingActionButton: _buildAddTaskButton(context, currentPlan),
        );
      },
    );
  }

  Widget _buildAddTaskButton(BuildContext context, Plan currentPlan) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        int planIndex = planNotifier.value.indexWhere(
          (p) => p.name == currentPlan.name,
        );

        if (planIndex == -1) {
          return;
        }

        List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
          ..add(const Task());

        planNotifier.value = List<Plan>.from(planNotifier.value)
          ..[planIndex] = Plan(name: currentPlan.name, tasks: updatedTasks);
      },
    );
  }

  Widget _buildList(Plan currentPlan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: currentPlan.tasks.length,
      itemBuilder: (context, index) {
        // Kirim 'currentPlan' (data terbaru) dan 'index' ke tile
        return _buildTaskTile(currentPlan, index, context);
      },
    );
  }

  Widget _buildTaskTile(Plan currentPlan, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    Task task = currentPlan.tasks[index];

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {

          int planIndex = planNotifier.value.indexWhere(
            (p) => p.name == currentPlan.name,
          );

          if (planIndex == -1) return; // Guard clause

          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(
                  description: task.description, // Gunakan data task saat ini
                  complete: selected ?? false,
                ),
            );
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {

          int planIndex = planNotifier.value.indexWhere(
            (p) => p.name == currentPlan.name,
          );

          if (planIndex == -1) return; // Guard clause

          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete, // Gunakan data task saat ini
                ),
            );
        },
      ),
    );
  }
}
