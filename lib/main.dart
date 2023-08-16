import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.abc),
          title: const Text(
            'AppBar',
            style: TextStyle(fontFamily: 'italic'),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.access_time_filled),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Icon(Icons.abc),
              Icon(Icons.abc_outlined),
              Icon(Icons.abc_rounded),
            ],
          )),
      body: TabBarView(
        controller: _tabController,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: Image.asset(
              "/Users/inskim/inskim/flutter/forecast/pic.jpeg",
            ),
          ),
          const Text(
            'Tab Controller 2',
            style: TextStyle(fontSize: 100, color: Colors.red),
          ),
          Table(
            columnWidths: const {
              0: FixedColumnWidth(100),
              1: FixedColumnWidth(20),
            },
            children: 
              List.generate(7, (index) => {
                return const TableRow(children: [TableCell(child: Text('1')), TableCell(child: Text('2'))]);
              });
            ,
          ),
          // ConstrainedBox(
          //   constraints: const BoxConstraints(maxWidth: 10, maxHeight: 10),
          //   child: const Text(
          //     'Constraind Box',
          //     style: TextStyle(fontSize: 100),
          //   ),
          // ),

          // const Text(
          //   'Tab Controller 3',
          //   style: TextStyle(fontSize: 100, color: Colors.lightBlue),
          // ),
        ],
      ),
    );
  }
}
