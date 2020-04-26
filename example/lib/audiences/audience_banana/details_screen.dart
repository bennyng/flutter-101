import 'package:flutter/material.dart';
import 'package:kaios_store_client/domain/app_items/app_item_model.dart';

class DetailScreen extends StatefulWidget {
  final AppItem appItem;

  DetailScreen({@required this.appItem});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // TODO: move to state layer
  var installed = false;

  @override
  Widget build(BuildContext context) {
    final appItem = this.widget.appItem;

    return Scaffold(
      appBar: AppBar(title: Text(appItem.name)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              this._buildSummary(appItem, context),
              this._buildDescription(appItem, context),
            ],
          ),
        ),
      ),
      bottomSheet: this._buildActionButton(),
    );
  }

  Widget _buildActionButton() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        padding: EdgeInsets.all(0),
        onPressed: () {
          // TODO: move to state layer
          setState(() {
            this.installed = !this.installed;
          });
        },
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              this.installed ? 'Open' : 'Install',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummary(AppItem appItem, BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Image.network(
              appItem.iconSmallURL,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    appItem.name,
                    style: TextStyle(fontSize: 18),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        appItem.headline,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).textTheme.caption.color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(AppItem appItem, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        appItem.description,
        textAlign: TextAlign.justify,
        style: TextStyle(
            height: 1.5,
            fontSize: 15,
            color: Theme.of(context).textTheme.body1.color.withOpacity(0.7)),
      ),
    );
  }
}
