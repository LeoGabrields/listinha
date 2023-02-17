import 'package:flutter/material.dart';
import 'package:listinha/src/home/widgets/custom_drawer.dart';
import 'package:listinha/src/home/widgets/task_card.dart';
import 'package:listinha/src/shared/services/realm/models/task_model.dart';
import 'package:listinha/src/shared/widgets/user_image_button.dart';
import 'package:realm/realm.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: const Text('Tarefas'),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: UserImageButton(),
            )
          ],
        ),
        body: Center(
          child: Stack(
            children: [
              ListView.separated(
                padding: EdgeInsets.only(
                  top: size.height * .08,
                  left: 30,
                  right: 30,
                  bottom: size.height * .1,
                ),
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemBuilder: (_, index) {
                  final board = TaskBoard(
                    Uuid.v4(),
                    'Nova lista de tarefas 1',
                    tasks: [
                      Task(Uuid.v4(), '', completed: true),
                      Task(Uuid.v4(), '', completed: true),
                      Task(Uuid.v4(), '', completed: true),
                      Task(Uuid.v4(), '', completed: true),
                      Task(Uuid.v4(), '', completed: true),
                    ],
                  );
                  return TaskCard(board: board, height: size.height * .17);
                },
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SegmentedButton<int>(
                    segments: const [
                      ButtonSegment(
                        value: 0,
                        label: Text('Todos'),
                      ),
                      ButtonSegment(
                        value: 1,
                        label: Text('Pendentes'),
                      ),
                      ButtonSegment(
                        value: 2,
                        label: Text('Concluídas'),
                      ),
                      ButtonSegment(
                        value: 3,
                        label: Text('Desativadas'),
                      ),
                    ],
                    selected: const {0},
                    onSelectionChanged: (values) {},
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.of(context).pushNamed('./edit'),
          icon: const Icon(Icons.edit),
          label: const Text('Nova Lista'),
        ),
      ),
    );
  }
}
