import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/botoes/task_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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

  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFF3E977A),
      appBar: AppBar(
          toolbarHeight: 60,
          title: const Text('Adicione um novo objetivo'),
          titleTextStyle: const TextStyle(
            color: Color(0xff1e6951),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          backgroundColor: Color.fromARGB(255, 241, 253, 245)),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: titleController,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1e6951),
                      ),
                      cursorColor: Color(0xff1e6951),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 156, 219, 199),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(33),
                          ),
                          borderSide: BorderSide(width: 2.0, color: Color.fromARGB(255, 156, 219, 199)),
                        ),
                        labelText: 'Título',
                        labelStyle: TextStyle(
                          fontSize: 20,
                          color: Color(0xff1e6951),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(33),
                          ), // Define o raio das bordas ao selecionar
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 156, 219, 199), // Define a cor da borda ao selecionar
                            width: 2.0, // Define a espessura da borda ao selecionar
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira um título.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: descriptionController,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1e6951),
                      ),
                      cursorColor: Color(0xff1e6951),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 156, 219, 199),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(33),
                            ),
                            borderSide: BorderSide(width: 2.0, color: Color.fromARGB(255, 156, 219, 199))),
                        labelText: 'Descrição',
                        labelStyle: TextStyle(
                          fontSize: 20,
                          color: Color(0xff1e6951),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(33),
                          ),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 156, 219, 199),
                            width: 2.0,
                          ),
                        ),
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
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1e6951),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          shadowColor: Colors.black,
                          elevation: 9,
                        ),
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
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1ea181),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          shadowColor: Colors.black,
                          elevation: 9,
                        ),
                        child: const Text(
                          'Adicionar',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate() && _selectedDate != null) {
                            setState(() {
                              taskProvider.addTask(
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
              child: Consumer<TaskProvider>(
                builder: (context, taskProvider, _) {
                  final tasks = taskProvider.tasks;
                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return Card(
                        color: const Color(0xff1e6951),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        shadowColor: Colors.black,
                        elevation: 9,
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
                                'Data: ${DateFormat('dd/MM/yyyy').format(task.selectedDate)}',
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
                                taskProvider.removeTask(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
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
