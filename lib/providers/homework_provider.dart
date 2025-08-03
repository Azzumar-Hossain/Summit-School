import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:summit/models/homework_model.dart';

final homeworkProvider = FutureProvider.family<List<Homework>, String>((
  ref,
  userName,
) async {
  final response = await http.get(
    Uri.parse(
      'http://203.190.12.69/ems/summit/app/web_api/std_homework/std_homework_api.php?user_name=$userName',
    ),
  );

  final jsonData = jsonDecode(response.body);
  final List data = jsonData['data']['homework_list'];

  return data.map((item) => Homework.fromJson(item)).toList();
});
