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
  bool isLoading = false;
  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var appItemProvider = Provider.of<AppItemProvider>(context, listen: false);
    this.initDataFuture = appItemProvider.fetchNextPage();

    this.scrollController.addListener(
      () async {
        if (this.scrollController.position.pixels ==
            this.scrollController.position.maxScrollExtent) {
          if (!this.isLoading) {
            setState(() {
              this.isLoading = true;
            });

            await appItemProvider.fetchNextPage();

            setState(() {
              this.isLoading = false;
            });
          }
        }
      },
    );
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
                this._buildAppItemGridView(appItemProvider),
          );
        },
      ),
      bottomSheet: isLoading
          ? SizedBox(
              height: 50,
              child: Center(child: CircularProgressIndicator()),
            )
          : SizedBox.shrink(),
    );
  }

  Widget _buildAppItemGridView(AppItemProvider appItemProvider) {
    return GridView.count(
      controller: this.scrollController,
      crossAxisCount: 3,
      childAspectRatio: 1.0,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: appItemProvider.items.map((item) {
        return GridTile(child: this._buildAppItemTile(item));
      }).toList(),
    );
  }

  Widget _buildAppItemTile(AppItem item) {
    return GestureDetector(
      onTap: () => this._navigateToDetailScreen(item),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(item.iconSmallURL),
              ),
            ),
            Text(
              item.name,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  Future _navigateToDetailScreen(AppItem item) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(appItem: item),
      ),
    );
  }
}
