import 'package:covid_data/data/models/covid_data.dart';
import 'package:covid_data/data/repositories/repo.dart';
import 'package:covid_data/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DataText extends StatefulWidget {
  final int id;

  DataText(this.id);

  @override
  _DataTextState createState() => _DataTextState();
}

class _DataTextState extends State<DataText> {
  Future<Global> data;

  @override
  void initState() {
    super.initState();
    data = AppRepo().getGlobalData();
  }

  String setText(AsyncSnapshot<Global> snap) {
    if (widget.id == 1) {
      return snap.data.totalConfirmed.toString();
    } else if (widget.id == 2) {
      return snap.data.totalDeaths.toString();
    } else if (widget.id == 3) {
      return snap.data.totalRecovered.toString();
    } else if (widget.id == 4) {
      return snap.data.newConfirmed.toString();
    } else {
      return "Error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Global>(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            setText(snapshot),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          );
        } else if (snapshot.hasError) {
          return Text("API Down?");
        }

        // By default, show a loading spinner.
        return Container(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class Stats {
  final String date;
  final int cases;

  Stats({
    @required this.date,
    @required this.cases,
  });
}

class SimpleBarChart extends StatelessWidget {
  final List<Stats> seriesList;

  SimpleBarChart(this.seriesList);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Stats, String>> series = [
      charts.Series(
        id: "Number of cases",
        data: seriesList,
        domainFn: (Stats series, _) => series.date,
        measureFn: (Stats series, _) => series.cases,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      )
    ];

    return Container(
      height: 400,
      padding: EdgeInsets.all(24),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text("Daily New Cases"),
            Expanded(
              child: charts.BarChart(
                series,
                animate: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StatsPage extends StatelessWidget {
  final List<Stats> statsData = [
    Stats(
      date: "1st",
      cases: 2424328,
    ),
    Stats(
      date: "2nd",
      cases: 3424328,
    ),
    Stats(
      date: "3rd",
      cases: 4424328,
    ),
    Stats(
      date: "4th",
      cases: 6424328,
    ),
    Stats(
      date: "5th",
      cases: 8424328,
    ),
    Stats(
      date: "6th",
      cases: 9424328,
    ),
    Stats(
      date: "7th",
      cases: 12424328,
    ),
    Stats(
      date: "8th",
      cases: 14424328,
    ),
    Stats(
      date: "9th",
      cases: 15424328,
    ),
    Stats(
      date: "10th",
      cases: 16624328,
    ),
    Stats(
      date: "11th",
      cases: 20424328,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 550,
                width: double.infinity,
                color: DashboardBlue,
              ),
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.menu,
                            size: 30.0,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.notifications_none,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(24.0),
                      child: Text(
                        "Global Statistics",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            left: 24.0,
                            top: 24.0,
                            bottom: 24.0,
                            right: 8.0,
                          ),
                          height: 120,
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(16.0),
                                child: Text(
                                  "Affected",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(16.0),
                                child: DataText(1),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Yellow,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 8.0,
                            top: 24.0,
                            bottom: 24.0,
                            right: 24.0,
                          ),
                          height: 120,
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(16.0),
                                child: Text(
                                  "Death",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(16.0),
                                child: DataText(2),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Red,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            left: 16.0,
                            top: 4.0,
                            bottom: 24.0,
                            right: 4.0,
                          ),
                          height: 120,
                          width: 110,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(16.0),
                                child: Text(
                                  "Recovered",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(16.0),
                                child: DataText(3),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Green,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 4.0,
                            top: 4.0,
                            bottom: 24.0,
                            right: 4.0,
                          ),
                          height: 120,
                          width: 110,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(16.0),
                                child: Text(
                                  "Active",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(16.0),
                                child: DataText(4),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: NeonBlue,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 4.0,
                            top: 4.0,
                            bottom: 24.0,
                            right: 16.0,
                          ),
                          height: 120,
                          width: 110,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(16.0),
                                child: Text(
                                  "Serious",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(16.0),
                                child: Text(
                                  "485434",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Violet,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 380,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                          ),
                        ),
                        Center(
                          child: SimpleBarChart(statsData),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
