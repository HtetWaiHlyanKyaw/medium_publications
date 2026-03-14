class ApiService {
  Future<List<Map<String, dynamic>>> getCats() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      // mock cats data retured from server after 1 seconds of delay
      final result = [
        {
          'name': 'Shwe Wah',
          'color': 'Orange',
          'age': '1 year',
          'gender': 'Male',
        },
        {
          'name': 'Phyu Lone',
          'color': 'White',
          'age': '2 years',
          'gender': 'Female',
        },
        {
          'name': 'Mel Mel',
          'color': 'Black',
          'age': '3 years',
          'gender': 'Male',
        },
      ];

      // in real app, we will make a request to the server like this.
      // final result = await client.call(parameters, domain etc.);

      // convert the loosely type List<dynamic> to List<Map<String, dynamic>>
      // ignore: unnecessary_type_check
      if (result.isNotEmpty && result is List) {
        return result.map((cat) => cat as Map<String, dynamic>).toList();
      }

      // assume that the result is empty
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
