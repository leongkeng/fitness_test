import 'package:fitness_app/controller/challenge_controller.dart';
import 'package:fitness_app/enum/challenge_progress_states.dart';
import 'package:fitness_app/widget/challenge_progress_widget.dart';
import 'package:fitness_app/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ChallengePage extends StatelessWidget {
  const ChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChallengeController>(
        init: ChallengeController(),
        builder: (controller) {
          return Scaffold(
              body: Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() => Text(
                          "${controller.rewardPoints} Points",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white, fontSize: 15.0
                          ),
                          textAlign: TextAlign.center,
                        )),
                        Obx(() => ChallengeProgressWidget(progress: controller.progress)),
                        const SizedBox(height: 20),
                        Obx(() => CustomButton(buttonText:
                        controller.isChallengeAccepted == ChallengeProgressStates.notAccepted
                            ? "Join Challenge"
                            : controller.isChallengeAccepted == ChallengeProgressStates.accepted
                            ? "Check in"
                            : "Completed",
                            onPressed: () {
                              if (controller.progress != 100.0) {
                                if (controller.isChallengeAccepted == ChallengeProgressStates.accepted) {
                                  controller.updateProgress();
                                } else if (controller.isChallengeAccepted == ChallengeProgressStates.notAccepted) {
                                  controller.acceptChallenge();
                                }
                              }
                            })),
                      ],
                    )),
              ));
        });
  }
}
