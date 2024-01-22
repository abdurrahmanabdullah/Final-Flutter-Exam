import 'package:exam_2/core/enums/view_state.dart';
import 'package:exam_2/core/view_models/list_view_model.dart';
import 'package:exam_2/ui/route_navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_view.dart';

class LIstView extends StatelessWidget {
  const LIstView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<ListViewModel>(
      onModelReady: (model) async {
        final SharedPreferences preferences =
            await SharedPreferences.getInstance();
        final String? accessToken = preferences.getString('access_token');

        if (accessToken != null) {
          model.getListAPI(accessToken);
        } else {
          print('Access token not found');
        }
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
        ),
        body: SafeArea(
          child: Center(
            child: model.state == ViewState.idle
                ? ListView.builder(
                    itemCount: model.listModel!.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              // const Text('dfd'),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteNavigation.listDetails,

                                      ///--------for specific details
                                      arguments: model.listModel?.data?[index]
                                          ?.mobileNumber);
                                },
                                child: Text(
                                  model.listModel?.data?[index]?.name ??
                                      "Not found",
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  )
                : const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}