int findEntryTotal(List<int> entries, {bool useThreeEntries = false}) {
  for (var entry in entries) {
    for (var entryTwo in entries) {
      if (useThreeEntries) {
        int matchingValue = entries.firstWhere(
            (thirdEntry) => entry + entryTwo + thirdEntry == 2020,
            orElse: () {});

        if (matchingValue != null) {
          return matchingValue * entry * entryTwo;
        }
      } else {
        if (entry + entryTwo == 2020) {
          return entry * entryTwo;
        }
      }
    }
  }
  return 0;
}
