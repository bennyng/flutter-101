class AppItem {
  final String appId;
  final String name;
  final String headline;
  final String description;
  final String iconSmallURL;
  final String iconMediumURL;
  final String iconLargeURL;

  AppItem({
    this.appId,
    this.name,
    this.headline,
    this.description,
    this.iconSmallURL,
    this.iconMediumURL,
    this.iconLargeURL,
  });

  AppItem copyWith({
    String appId,
    String name,
    String headline,
    String description,
    String iconSmallURL,
    String iconMediumURL,
    String iconLargeURL,
  }) {
    return AppItem(
      appId: appId ?? this.appId,
      name: name ?? this.name,
      headline: headline ?? this.headline,
      description: description ?? this.description,
      iconSmallURL: iconSmallURL ?? this.iconSmallURL,
      iconMediumURL: iconMediumURL ?? this.iconMediumURL,
      iconLargeURL: iconLargeURL ?? this.iconLargeURL,
    );
  }
}
