import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/botoes/task_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  List<Task> getTasksForSelectedDay(List<Task> tasks) {
    return tasks.where((task) => isSameDay(task.selectedDate, _selectedDay)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E977A),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, _) {
          final tasks = getTasksForSelectedDay(taskProvider.tasks);

          return Column(
            children: [
              TableCalendar(
                rowHeight: 50,
                daysOfWeekHeight: 30,
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2023, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                daysOfWeekStyle: const DaysOfWeekStyle(decoration: BoxDecoration(color: Color.fromARGB(255, 241, 253, 245))),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Color(0xff1e6951),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Color(0xFF3E977A),
                    shape: BoxShape.circle,
                  ),
                  rowDecoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 253, 245),
                  ),
                ),
                headerStyle: const HeaderStyle(
                    formatButtonDecoration: BoxDecoration(color: Color(0xFF3E977A), borderRadius: BorderRadius.all(Radius.circular(30))),
                    decoration: BoxDecoration(color: Color.fromARGB(255, 241, 253, 245)),
                    formatButtonTextStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      height: 1.2,
                    )),
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              Expanded(
                child: tasks.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 250,
                              height: 250,
                              color: Colors.transparent,
                              child: Opacity(
                                opacity: 0.5,
                                child: ClipRRect(
                                  child: Image.asset(
                                    'assets/svg/list-2-2.png',
                                    height: 250,
                                    width: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Você não tem tarefas para hoje',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: AutofillHints.location,
                                color: Color.fromARGB(255, 238, 241, 238),
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          final task = tasks[index];
                          final formattedDate = DateFormat('dd/MM/yyyy').format(task.selectedDate);
                          return Card(
                            color: const Color(0xff1e6951),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            shadowColor: Colors.black,
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
                                    taskProvider.removeTask(index);
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
