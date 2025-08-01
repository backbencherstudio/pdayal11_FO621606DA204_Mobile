enum Status { pending, completed, reported,all }

String statusToString(Status status) {
  return status.toString().split('.').last;
}

class Job {
  final String id;
  final DateTime createDate;
  final DateTime endDate;
  final Status status;

  Job({
    required this.id,
    required this.createDate,
    required this.endDate,
    required this.status,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      createDate: DateTime.parse(json['createDate']),
      endDate: DateTime.parse(json['endDate']),
      status: Status.values.firstWhere((e) => e.toString() == 'Status.${json['status']}'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createDate': createDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'status': statusToString(status),
    };
  }
}
