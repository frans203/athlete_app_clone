String getInitials(String name) {
  List<String> namesArray = name.split(' ');
  if (namesArray.length > 1) {
    return namesArray[0][0] + namesArray[1][0];
  } else {
    return namesArray[0][0];
  }
}
