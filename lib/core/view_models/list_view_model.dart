import 'package:exam_2/core/enums/view_state.dart';
import 'package:exam_2/core/models/list_model.dart';
import 'package:exam_2/core/services/list_api.dart';
import 'package:exam_2/locator.dart';

import 'base_view_model.dart';

class ListViewModel extends BaseViewModel {
  final ListApi _ListApi = locator<ListApi>();
  ListModel? listModel;
  // List<ListModel> profile = [];

  Future<void> getListAPI(String token) async {
    setViewState(ViewState.busy);

    listModel = await _ListApi.getAllList(token);

    print('-----------------------------------------------');

    setViewState(ViewState.idle);
  }
}
