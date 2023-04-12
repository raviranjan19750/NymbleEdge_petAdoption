import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pet_adoption/model/pet_data.dart';
import 'package:pet_adoption/src/ui/utils/color_constants.dart';
import 'package:pet_adoption/src/ui/utils/di_module.dart';
import 'package:pet_adoption/src/ui/utils/material_color.dart';
import 'src/ui/utils/nav_key.dart';
import 'src/ui/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

          primarySwatch: primary,
          backgroundColor: Colors.white,
          snackBarTheme: const SnackBarThemeData(
            backgroundColor: ColorConstants.greenMatte,
            contentTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 10
            )
          ),
          dividerColor: Colors.black,
          indicatorColor: ColorConstants.greenMatte,
          shadowColor: Colors.grey.withOpacity(0.12),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
            bodyLarge: TextStyle( color: ColorConstants.greenMatte, fontWeight: FontWeight.w600, fontSize: 16),
            titleSmall: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10),
            titleLarge:  TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),
            titleMedium:  TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
            labelLarge: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),
            labelMedium: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 12),
            labelSmall: TextStyle(
                color: ColorConstants.greenMatte,
                fontWeight: FontWeight.w500,
                fontSize: 10),
          )),
      darkTheme: ThemeData(
          primarySwatch: primary,
          backgroundColor:ColorConstants.lightBlack,
          snackBarTheme: const SnackBarThemeData(
              backgroundColor: ColorConstants.greenMatte,
              contentTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 10
              )
          ),
          dividerColor: Colors.white,
          indicatorColor: Colors.white,
          shadowColor: Colors.white.withOpacity(0.12),
          textTheme: const TextTheme(
            bodyLarge: TextStyle( color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
            headlineLarge: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
            titleSmall: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 10),
            titleLarge:  TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
            titleMedium:  TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
            labelLarge: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            labelMedium: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 12),
            labelSmall: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10),
          )),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.splashScreen,
      navigatorKey: NavKey.navKey,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getInitialData();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Future<List<PetDataItem>> getInitialData() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/petData.json");
    List mapData = jsonDecode(data);

    List<PetDataItem> petData =
        mapData.map((e) => PetDataItem.fromJson(e)).toList();

    print("petdata ${petData.toString()}");
    return petData;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
