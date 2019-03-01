import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/rest/ApiProvider.dart';
import 'package:flutter_app/ui/details/DetailsScreen.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:transparent_image/transparent_image.dart';

class FirstTab extends StatefulWidget {
  final values;

  FirstTab(this.values);

  @override
  State<StatefulWidget> createState() => FirstTabState(values);
}

class FirstTabState extends State<FirstTab> {
  var apiProvider = kiwi.Container().resolve<ApiProvider>();
  final _values;

  FirstTabState(this._values);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text("Home screen"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        physics: AlwaysScrollableScrollPhysics();
        return Container(
          padding: EdgeInsets.all(8),
          child: Material(
            elevation: 2,
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          CircularProgressIndicator(),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsScreen(tag: index)),
                              );
                            },
                            child: Hero(
                              tag: index,
                              child: FadeInImage.memoryNetwork(
                                width: 128,
                                height: 128,
                                placeholder: kTransparentImage,
                                image: "https://picsum.photos/300/300/?$index",
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 128,
                        child: FlatButton(
                          textTheme: ButtonTextTheme.primary,
                          onPressed: () {
                            updateData("Loading...", index);
                            var fetchPosts = apiProvider.fetchQuoteOfDay();
                            fetchPosts
                                .then((result) => updateData(
                                    result.quote.quoteFormatted(), index))
                                .catchError(
                                    (e) => updateData("No internet!", index),
                                    test: (e) => e is SocketException)
                                .catchError(
                                    (e) => updateData(e.toString(), index),
                                    test: (e) => true);
                          },
                          child: Text('Load qoute'),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(getStatusDescription(index),
                        textAlign: TextAlign.justify),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  String getStatusDescription(int index) {
    var value = _values[index];
    return value == null ? "" : value;
  }

  bool updateData(String result, int index) {
    _values[index] = result;
    setState(() {});
    return false;
  }
}
