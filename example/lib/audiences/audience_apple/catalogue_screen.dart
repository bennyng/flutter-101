import 'package:flutter/material.dart';
import 'package:kaios_store_client/domain/app_items/app_item_model.dart';
import 'package:kaios_store_client/domain/app_items/app_item_provider.dart';
import 'package:provider/provider.dart';

import 'details_screen.dart';

class CatalogueScreen extends StatefulWidget {
  @override
  _CatalogueScreenState createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  Future initDataFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var appItemProvider = Provider.of<AppItemProvider>(context, listen: false);
    this.initDataFuture = appItemProvider.fetchNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Image.asset('assets/images/brand.png', height: 48),
        ),
      ),
      body: FutureBuilder(
        future: this.initDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.error != null) {
            return Center(
              child: Text('Something went wrong :/'),
            );
          }

          return Consumer<AppItemProvider>(
            builder: (context, appItemProvider, child) =>
                this._buildAppItemListView(appItemProvider),
          );
        },
      ),
    );
  }

  ListView _buildAppItemListView(AppItemProvider appItemProvider) {
    return ListView.builder(
      itemCount: appItemProvider.items.length + 1,
      itemBuilder: (context, index) {
        if (index < appItemProvider.items.length) {
          var item = appItemProvider.items[index];
          var heroTag = "app-item-$index";
          return this._buildAppItemTile(item, heroTag);
        }

        if (appItemProvider.items.length >= appItemProvider.totalCount) {
          return this._buildFooterNoMore();
        }

        // TODO: loading state and error handling in pagination
        // TODO: confirm whether infinite scroll UX if preferred

        return this._buildFooterLoadMore(appItemProvider);
      },
    );
  }

  ListTile _buildAppItemTile(AppItem item, String heroTag) {
    return ListTile(
      leading: Hero(
        tag: heroTag,
        child: Image.network(item.iconSmallURL),
      ),
      title: Text(item.name),
      subtitle: Text(item.headline, maxLines: 1),
      trailing: Icon(Icons.chevron_right),
      onTap: () => this._navigateToDetailScreen(item, heroTag),
    );
  }

  Future _navigateToDetailScreen(AppItem item, String heroTag) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          appItem: item,
          heroTag: heroTag,
        ),
      ),
    );
  }

  FlatButton _buildFooterLoadMore(AppItemProvider appItemProvider) {
    return FlatButton(
      child: Text("Click To Load More"),
      onPressed: () => appItemProvider.fetchNextPage(),
    );
  }

  Padding _buildFooterNoMore() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(child: Text("No more app items!")),
    );
  }
}
