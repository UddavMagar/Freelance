

class profilemodel{
  String skill;
  String profiledescription;
  int hourlyrate;
  int totalEarning;
  int totalJobs;
  int hoursworked;
  int currentEarning;
  List expertise;


  profilemodel({this.expertise,
      this.hourlyrate,
      this.hoursworked,
    this.profiledescription,
    this.skill,
    this.totalEarning,
    this.totalJobs,
    this.currentEarning
  });
}