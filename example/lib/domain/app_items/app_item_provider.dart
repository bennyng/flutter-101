import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:kaios_store_client/api/api.dart';

import 'app_item_model.dart';

// TODO: use BLoc / redux pattern for better state management, scope in assignment is fine with Provider

class AppItemProvider extends ChangeNotifier {
  final String audienceCode;
  final KaiStoreApi api;

  final List<AppItem> _items = [];
  int _totalCount = -1;
  int _currentPage = 1;
  int _defaultPageSize = 21;
  UnmodifiableListView<AppItem> get items => UnmodifiableListView(_items);

  AppItemProvider({
    @required this.audienceCode,
    @required this.api,
  });

  Future<List<AppItem>> fetchNextPage() async {
    // TODO: add a layer between API model and domain model, now assume backend responds exactly
    final ApiCollectionResponse<AppItem> response =
        await this.api.fetchAppItems(
              audienceCode: this.audienceCode,
              page: this._currentPage,
              pageSize: this._defaultPageSize,
            );

    final appItems = response.items;

    if (appItems.length > 0) {
      this._items.addAll(appItems);
      this._currentPage = this._currentPage + 1;
    }

    if (this._totalCount == -1) {
      this._totalCount = response.totalCount;
    }

    // TODO: update current page

    notifyListeners();
    return appItems;
  }

  int get totalCount => this._totalCount;
}
