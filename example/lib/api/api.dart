import 'package:flutter/foundation.dart';

// TODO: add a layer between API model and domain model, now assume backend responds exactly
import 'package:kaios_store_client/domain/app_items/app_item_model.dart';

import 'config.dart';

class ApiCollectionResponse<T> {
  final List<T> items;
  final int totalCount;

  ApiCollectionResponse({
    @required this.items,
    @required this.totalCount,
  });
}

abstract class KaiStoreApi {
  KaiStoreApi({@required ApiConfig config});

  // Different audience may have different shape of data
  Future<ApiCollectionResponse<AppItem>> fetchAppItems({
    @required String audienceCode,
    @required int page,
    @required int pageSize,
  });

  // TODO: an endpoint for retrieving details of an app item (optimizing payload size in fetchAppItems)
  // Future<AppItem> fetchAppItem(String appId) async
}
