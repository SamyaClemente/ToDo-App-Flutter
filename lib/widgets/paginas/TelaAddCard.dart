import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task {
  String title;
  String description;
  DateTime selectedDate;

  Task({required this.title, required this.description, required this.selectedDate});
}

class TelaAddCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TelaAddCardState();
  }
}

class TelaAddCardState extends State<TelaAddCard> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<Task> _tasks = [];
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escreva um Objetivo'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: titleController,
                      style: const TextStyle(fontSize: 24, color: Colors.black87),
                      decoration: const InputDecoration(
                        labelText: 'Título',
                        labelStyle: TextStyle(fontSize: 20),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira um título.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: descriptionController,
                      style: const TextStyle(fontSize: 24, color: Colors.black87),
                      decoration: const InputDecoration(
                        labelText: 'Descrição',
                        labelStyle: TextStyle(fontSize: 20),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira uma descrição.';
                        }
                        return null;
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        child: const Text(
                          'Selecionar Data',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2024),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              _selectedDate = pickedDate;
                            });
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        child: const Text(
                          'Adicionar',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate() && _selectedDate != null) {
                            setState(() {
                              _tasks.add(
                                Task(
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  selectedDate: _selectedDate!,
                                ),
                              );
                            });
                            titleController.clear();
                            descriptionController.clear();
                            _selectedDate = null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final task = _tasks[index];
                  final formattedDate = DateFormat('dd/MM/yyyy').format(task.selectedDate);
                  return Card(
                    color: const Color(0xff3e977a),
                    child: ListTile(
                      title: Text(
                        task.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.description,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Data: $formattedDate',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _tasks.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
