import 'package:api_calling/api_service.dart';
import 'package:api_calling/model/users_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<UserModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' API Calling Using Dio'),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_userModel![index].name),
                      SizedBox(height: 5),
                      Text(_userModel![index].email),
                      SizedBox(height: 5),
                      Text(_userModel![index].address.street +
                          " " +
                          _userModel![index].address.suite +
                          " " +
                          _userModel![index].address.city),
                      SizedBox(height: 5),
                      Text(_userModel![index].phone),
                      SizedBox(height: 5),
                      Text(_userModel![index].website),
                    ],
                  ),
                );
              }),
    );
  }
}
