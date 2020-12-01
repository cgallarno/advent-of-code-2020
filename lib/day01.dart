int findEntryTotal(List<int> entries, {bool useThreeEntries = false}){
  if(useThreeEntries){
    for(var entry in entries){
      for(var entryTwo in entries){
        int value = entry + entryTwo;
        if(value >= 2020){
          continue;
        }

        for(var entryThree in entries){
          if(value + entryThree == 2020){
            return entry * entryTwo * entryThree;
          }
        }
      }
    }
  }else{
    for(var entry in entries){
      int matchingValue = entries.firstWhere((otherEntry) => entry + otherEntry == 2020, orElse: (){});
      if(matchingValue != null){
        return matchingValue * entry;
      }
    }
  }

  return 0;
}
