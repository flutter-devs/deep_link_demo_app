import 'package:flutter/material.dart';

import '../../../api_services/api_services.dart';
import '../../../core/constants/constant_imports.dart';
import '../../../core/helper/helper_imports.dart';

class ShowApiDataScreen extends StatefulWidget {
  const ShowApiDataScreen({this.deepLinkPath = 'Show Api Data Screen',Key? key}) : super(key: key);
  final String deepLinkPath;

  @override
  _ShowApiDataScreenState createState() => _ShowApiDataScreenState();
}

class _ShowApiDataScreenState extends State<ShowApiDataScreen> {
  List listData = [];
  bool isLoading = false;

  _fetchApiData() async {
    listData = await ApiServices.fetchData();
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    _fetchApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.fetchDataFromApi),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: isLoading
          ? Container(
              padding: PaddingConstants.screen,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(Dimensions.px8),
                    decoration: const BoxDecoration(color: ColorConstants.alto),
                    child: Column(
                      children: [
                        Container(
                          height: Dimensions.px90,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(Dimensions.px30),
                            child: Image.network(
                                '${listData[index]['download_url']}'),
                          ),
                        ),
                        SizeHelper.h05(),
                        Text(
                          'ID:' '${listData[index]['id']}',
                          style: const TextStyle(fontSize: Dimensions.px16),
                        ),
                        SizeHelper.h05(),
                        Text(
                          'Author:' '${listData[index]['author']}',
                          style: const TextStyle(fontSize: Dimensions.px16),
                        ),
                      ], //just for testing, will fill with image later
                    ),
                  );
                },
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
