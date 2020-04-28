import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api/api.dart';
import 'audiences/audience_provider.dart';
import 'domain/app_items/app_item_provider.dart';
import 'mock_api/mock_api.dart';

void main() => runApp(createAppInfrastructure(child: MyApp()));

Widget createAppInfrastructure({@required child}) {
  return MultiProvider(
    providers: [
      Provider<KaiStoreApi>(
        create: (BuildContext context) => MockApi(),
      ),
      Provider<AudienceProvider>(
        create: (BuildContext context) => AudienceProvider(),
      ),
      ChangeNotifierProxyProvider<KaiStoreApi, AppItemProvider>(
        create: (BuildContext context) => null,
        update: (_, api, __) => AppItemProvider(
          audienceCode: 'apple',
          api: api,
        ),
      ),
    ],
    child: child,
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String audienceCode;
  AudienceProvider audienceProvider;

  @override
  void initState() {
    super.initState();

    this.audienceProvider =
        Provider.of<AudienceProvider>(context, listen: false);

    Random random = Random();
    this.audienceCode = this.audienceProvider.availableCodes[
        random.nextInt(this.audienceProvider.availableCodes.length)];
  }

  @override
  Widget build(BuildContext context) {
    var audienceProvider = Provider.of<AudienceProvider>(context);

    return MaterialApp(
      title: 'App Store',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        // primarySwatch: Colors.blue,
        // brightness: Brightness.dark,
      ),
      home: audienceProvider.getAudienceByCode(this.audienceCode).entryScreen,
    );
  }
}
