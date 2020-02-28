import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tkd_tournament/common/dialog.dart';
import 'package:tkd_tournament/create_tournament/create_tournament.dart';
import 'package:tkd_tournament/home.dart';
import 'package:tkd_tournament/repo/tournament_repo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          buttonTheme: ButtonThemeData(buttonColor: Colors.blue, highlightColor: Colors.yellow)),
      home: MyHomePage(title: 'Home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _addNewTournament() async {
    print('Ny turnering');
    final resp = await asyncInputDialog(context, 'Ønsker du å opprette en ny turnering?', DialogType.DIALOG_YESNO);
    if (resp == "YES") Navigator.push(context, MaterialPageRoute(builder: (context) => CreateTournament()));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RepoTournament>(create: (_) => RepoTournament()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Consumer<RepoTournament>(
              builder: (context, tournamentRepo, child) => HomeScreen(tournamentRepo),
            ),
            MaterialButton(
              onPressed: () => print('x'),
              child: Text('test'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addNewTournament(),
          tooltip: 'Add tournament',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
