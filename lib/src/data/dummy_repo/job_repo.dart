import 'dart:convert';
import 'package:pdayal1_mobile/src/data/models/job_model.dart';
import '../dummy_data/job_data.dart';

class JobRepo{
  Future<List<Job>> fetchJobs() async {
    await Future.delayed(Duration(milliseconds: 300));
    List<dynamic> jobDataJson = jsonDecode(dummyJobData);
    return jobDataJson.map((data) => Job.fromJson(data)).toList();
  }
}