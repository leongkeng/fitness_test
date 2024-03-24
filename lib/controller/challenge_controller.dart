import 'package:fitness_app/challenge_list_model.dart';
import 'package:fitness_app/enum/challenge_progress_states.dart';
import 'package:fitness_app/service/challenge_service.dart';
import 'package:fitness_app/service/exception/server_exception.dart';
import 'package:fitness_app/utils/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChallengeController extends GetxController {
  static const tag = "ChallengeController";

  final _progress = 0.0.obs;
  double get progress => _progress.value;

  final _isChallengeAccepted = ChallengeProgressStates.notAccepted.obs;
  ChallengeProgressStates get isChallengeAccepted => _isChallengeAccepted.value;

  final RxList<ChallengeListModel> _challengeList = <ChallengeListModel>[].obs;
  List<ChallengeListModel> get challengeList => _challengeList;

  final _rewardPoints = 0.0.obs;
  double get rewardPoints => _rewardPoints.value;

  @override
  void onInit() {
    super.onInit();
    getChallengeList();
  }

  void acceptChallenge() {
    _isChallengeAccepted.value = ChallengeProgressStates.accepted;
  }

  void updateProgress() {
    // Usually i will put all bottom sheet UI under a DialogUtils file
    Get.bottomSheet(
        Container(
          padding: const EdgeInsets.only(top: 13.0),
          decoration: const BoxDecoration(
            borderRadius:
            BorderRadius.only(topLeft: Radius.circular(22.0),
                topRight: Radius.circular(22.0)),
            color: Colours.colorTabBar,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 40.0,
                  height: 4.0,
                  color: Colours.grey300,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: 150.0,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      initialValue: "0000",
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {

                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _progress.value = _progress.value + 20.0;
                      if (_progress.value == 100.0) {
                        _isChallengeAccepted.value =
                            ChallengeProgressStates.completed;
                        _rewardPoints.value = _rewardPoints.value + 100.0;
                      }
                      Get.back();
                    },
                    child: Text("Verify Code"),
                  )
                ],
              )
            ],
          ),
        )
    );
  }

  getChallengeList() async {
    try {
      var challengeList = await ChallengeService().fetchChallengeProgress();
      if (challengeList.isNotEmpty) {
        _challengeList.value = challengeList;
        update(); //To update the UI, only use this if theres alot of reactive variable to update.
        // Otherwise wrapping Obx() widget will do the job.
      }
    } catch (e) {
      if (e is ServerErrorException) {
        debugPrint("Error: $e");
      }
    }
  }
}