class Building {
  final String buildingName;
  final String abbreviation;
  final String? roomName;
  final String buildingId;

  const Building(this.buildingName, this.abbreviation, this.buildingId,
      {this.roomName});
}

List<Building> allBuilding = [
  const Building('G Bloack', 'G', '1023'),
  const Building('F Block', 'F', '1024'),
  const Building('B Block', 'B', '1025'),
  const Building('A Block', 'A', '1026'),
  const Building('CSED Building', 'L', '1027'),
  const Building('TAN Building', 'TAN', '10238'),
  const Building('C Block', 'C', '1029'),
  const Building('Lecture Theatre', 'LT', '1030'),
  const Building('Lecture Practical', 'LP', '1031'),
];
