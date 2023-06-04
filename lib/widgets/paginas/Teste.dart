import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TestePage extends StatefulWidget {
  @override
  _TestePageState createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Map<DateTime, List<Task>> _events = {}; // Mapa de eventos por data

  List<Task> _tasks = [
    // Exemplo de lista de tarefas
    Task(
      title: 'Tarefa 1',
      description: 'Descrição da Tarefa 1',
      selectedDate: DateTime.now(),
    ),
    Task(
      title: 'Tarefa 2',
      description: 'Descrição da Tarefa 2',
      selectedDate: DateTime.now().add(const Duration(days: 1)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadEvents(); // Carregar eventos no mapa
  }

  void _loadEvents() {
    // Mapear as tarefas com as datas correspondentes
    for (final task in _tasks) {
      final date = task.selectedDate;
      if (_events[date] == null) {
        _events[date] = [];
      }
      _events[date]?.add(task);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        firstDay: DateTime.utc(2023, 1, 1),
        lastDay: DateTime.utc(2023, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: Colors.yellow,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        eventLoader: (day) {
          return _events[day] ?? []; // Retornar os eventos da data
        },
      ),
    );
  }
}

class Task {
  String title;
  String description;
  DateTime selectedDate;

  Task({required this.title, required this.description, required this.selectedDate});
}
