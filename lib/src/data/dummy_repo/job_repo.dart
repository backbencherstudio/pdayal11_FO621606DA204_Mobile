import 'dart:convert';
<<<<<<< HEAD
=======

import 'package:pdayal1_mobile/src/data/models/job_model.dart';

>>>>>>> 0222bc3c00ec2a7ae226b8672897da9e2cf483f8
import '../dummy_data/job_data.dart';
import '../models/job_model.dart';

class JobRepo{
  Future<List<Job>> fetchJobs() async {
    await Future.delayed(Duration(milliseconds: 300));
    List<dynamic> jobDataJson = jsonDecode(dummyJobData);
    return jobDataJson.map((data) => Job.fromJson(data)).toList();
  }
}