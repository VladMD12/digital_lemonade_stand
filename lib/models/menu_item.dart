class MenuItem {
  const MenuItem({
    required this.id,
    required this.name,
    required this.prices,
  });

  final String id;
  final String name;
  final Map<CupSize, double> prices;
}

enum CupSize { small, medium, large }

extension CupSizeLabelExt on CupSize {
  String get label {
    switch (this) {
      case CupSize.small:
        return 'S';
      case CupSize.medium:
        return 'M';
      case CupSize.large:
        return 'L';
    }
  }
}
