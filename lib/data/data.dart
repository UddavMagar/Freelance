import 'package:flutter/material.dart';
import 'package:freelance/Models/CurrentJobs.dart';
import 'package:freelance/Models/Inbox.dart';
import 'package:freelance/Models/Project.dart';
import 'package:freelance/Models/Transaction.dart';
import 'package:freelance/Models/profile.dart';

final List<currentJobs> currentjobs = [
    _job1,
    _job2,
    _job3,
   _job4,
  _job5,
];



final _job1 = currentJobs(jobName: 'Eshop App', jobDescription: 'Build android and ios ecommerce app');
final _job2 = currentJobs(jobName: 'Photo Edit', jobDescription: 'Merge two photos');
final _job3 = currentJobs(jobName: 'Video Edit', jobDescription: 'cut the unwanted scens');
final _job4 = currentJobs(jobName: 'cameo Website', jobDescription: 'Build Website');
final _job5 = currentJobs(jobName: 'database', jobDescription: 'manage database');


final List<Projects> projects = [
  _project1,
  _project2,
  _project3,
  _project4,
  _project5,
];



final _project1 = Projects(projectName: 'Daraz App',
    projectDescription: 'Build android and ios ecommerce app',
    icon: Icons.apps,
    projectPrice: 10000,
    requirement: ['app developer','UI design','UX design'],
);
final _project2 = Projects(projectName: 'Video Edit',
    projectDescription: 'cut the unwanted scens',
    icon: Icons.video_label,
    projectPrice: 5000,
  requirement: ['Maya','video Editing','animation'],
);
final _project3 = Projects(projectName: 'Ios app',
    projectDescription: 'Build ios ecommerce app',
    icon: Icons.apps,
    projectPrice: 15000,
  requirement: ['app developer','UI design','UX design','swift'],
);
final _project4 = Projects(projectName: 'cameo Website',
    projectDescription: 'Build Website',
    icon: Icons.web_asset,
    projectPrice: 10000,
  requirement: ['web developer','react','nodejs','UI design','UX design'],
);
final _project5 = Projects(projectName: 'database',
    projectDescription: 'manage database',
    icon: Icons.system_update_alt,
    projectPrice: 20000,
  requirement: ['Excel','cloud','database'],
);



final List<Transact> transaction = [
    _transact1,
  _transact2,
  _transact3,
  _transact4,
  _transact5,
];


final _transact1 = Transact(transactionamount: -5000,transactionday: 14,transactionmonth: 'Feb',transactionBy: 'You');
final _transact2 = Transact(transactionamount: 10000,transactionday: 3,transactionmonth: 'Feb',transactionBy: 'Freelance');
final _transact3 = Transact(transactionamount: -1000,transactionday: 30,transactionmonth: 'Jan',transactionBy: 'You');
final _transact4 = Transact(transactionamount: 2000,transactionday: 15,transactionmonth: 'Jan',transactionBy: 'Freelance');
final _transact5 = Transact(transactionamount: 1000,transactionday: 1,transactionmonth: 'Jan',transactionBy: 'Freelance');


final List<InboxMessage> inboxmessage = [
  _inboxmessage1,
  _inboxmessage2,
  _inboxmessage3,
  _inboxmessage4,
  _inboxmessage5,

];

final _inboxmessage1 = InboxMessage(inboxTitle: 'Photo Edit project',inboxMessage: 'Your Proposal Has been Accepted for photo edit project. This project will be added to your current jobs',
    inboxMonth: 'Feb',inboxDay: 30);
final _inboxmessage2 = InboxMessage(inboxTitle: 'Eshop app project',inboxMessage: 'Your Proposal Has been Accepted for Eshop app project.',
    inboxMonth: 'Feb',inboxDay: 21);
final _inboxmessage3 = InboxMessage(inboxTitle: 'Drone project',inboxMessage: 'Your Proposal Has been Rejected for Drone buinding project.',
    inboxMonth: 'Feb',inboxDay: 11);
final _inboxmessage4 = InboxMessage(inboxTitle: 'Translation project',inboxMessage: 'Your Proposal Has been Accepted for Translation project.',
    inboxMonth: 'Jan',inboxDay: 25);
final _inboxmessage5 = InboxMessage(inboxTitle: 'Database project',inboxMessage: 'Your Proposal Has been Rejected for photo edit project.',
    inboxMonth: 'Jan',inboxDay: 2);


final List<profilemodel> profileModel = [
  _profilemodel1
];

final _profilemodel1 = profilemodel(skill: 'Android Developer',
    profiledescription: 'I have been Designing and developing advanced applications for the Android platform for 7 years. My strengths are Unit-testing code for robustness, including edge cases, usability, general reliability, Bug fixing and improving application performance',
    hourlyrate: 32,totalEarning: 10,totalJobs: 30,hoursworked: 1500,currentEarning:1000,expertise: ['Excel','cloud','database','app developer','UI design','UX design','swift']
);


