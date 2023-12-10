import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/task.controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                color: Colors.transparent,
              )),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text('To Do App'),
        forceMaterialTransparency: true,
        
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final taskList = ref.watch(taskControllerProvider);
          return ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              final task = taskList[index];
              return Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(31, 52, 52, 52),
                      offset: Offset(2, 2),
                      blurRadius: 4.0,
                      spreadRadius: 6.0,
                    ),
                    BoxShadow(
                      color: Color.fromARGB(255, 250, 250, 250),
                      offset: Offset(-4, -4),
                      blurRadius: 4.0,
                      spreadRadius: 4.0,
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(task.title),
                  trailing: GestureDetector(
                    onTap: () {
                      ref
                          .read(taskControllerProvider.notifier)
                          .toggleTask(task);
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: task.completed
                            ? const [
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(4, 4),
                                  blurRadius: 4.0,
                                  spreadRadius: 2,
                                ),
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(-4, -4),
                                  blurRadius: 4.0,
                                  spreadRadius: 2,
                                ),
                              ]
                            : const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(1, 1),
                                  blurRadius: 2.0,
                                  spreadRadius: 4.0,
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-3, -3),
                                  blurRadius: 4.0,
                                  spreadRadius: 4.0,
                                ),
                              ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(taskControllerProvider.notifier).addTask();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
