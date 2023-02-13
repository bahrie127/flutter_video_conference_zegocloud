import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

import 'package:flutter_zego_video_conference/zego_config.dart';

class VideoConferencePage extends StatelessWidget {
  final String conferenceID;
  final String userName;
  const VideoConferencePage({
    Key? key,
    required this.conferenceID,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: ZegoConfig
            .appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: ZegoConfig
            .appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: userName,
        userName: userName,
        conferenceID: conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(
          leaveConfirmDialogInfo: ZegoLeaveConfirmDialogInfo(
            title: "Keluar Meeting?",
            message: "Apakah anda yakin untuk keluar?",
            cancelButtonName: "Tidak",
            confirmButtonName: "Ya",
          ),
          turnOnMicrophoneWhenJoining: false,
          avatarBuilder: (BuildContext context, Size size, ZegoUIKitUser? user,
              Map extraInfo) {
            return user != null
                ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://i.pravatar.cc/150?u=$userName',
                        ),
                      ),
                    ),
                  )
                : const SizedBox();
          },
        ),
      ),
    );
  }
}
