String getInitials(String name) {
  List<String> namesArray = name.split(' ');
  return namesArray[0][0] + namesArray[1][0];
}
