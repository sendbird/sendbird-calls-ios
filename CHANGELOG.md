# Change Log

### 1.10.20 (Jun 11, 2024)
* Fixed an issue where Room Invitation wouldn't be canceled after 10 seconds. Now, updates to room invitation will be available for 60 seconds before the SDK disconnects from the websocket. 

### 1.10.19 (Jun 3, 2024)
* Fixed an issue where using local recording would sometimes result in a crash. 
* Fixed an issue where incoming Room invitation would not get canceled. 

### 1.10.18 (Apr 4, 2024)
* Updated iOS deployment target to 12.0
* Updated Xcode version to 15.0
* Added PrivacyInfo.xcprivacy for Apple Privacy Manifest

### 1.10.17 (Mar 14, 2024)
* Updated WebRTC dependency version to M118.
* Improved WebRTC internal logging.

### 1.10.16 (Feb 27, 2024)
* Fix an issue where Push Notifications won't arrive for Rooms Invitations.

### 1.10.15 (Feb 8, 2024)
* Stability improvements.

### 1.10.14 (Dec 14, 2023)
* When a direct call is ended before connecting, the call will have an end result of `DirectCallEndResult.notConnected`
 
### 1.10.13 (Aug 16, 2023)
* Fixed an issue where call will not be properly reconnected after network connection has been lost.

### 1.10.12 (Aug 10, 2023)
* Fix an issue where Direct Call quality statistics won't be collected when the call is being reconnected. 
* Fix an issue where camera would be incorrectly mirrored in Direct Calls. 
* Added a feature to track push notification delivery status within the SDK. 
    * Added `SendBirdCall.markPushNotificationAsDelivered`
    
### 1.10.11 (Aug 2, 2023)
* Fix an issue where Direct Call's Connection Quality would report 'Unavailable' for a few seconds after connecting the call.
 
### 1.10.10 (Jul 31, 2023)
* Added support for Direct Call quality monitoring in Sendbird Dashboard.

### 1.10.9 (Jun 23, 2023)
* Added `DirectCall.ringingSource`, which indicates the source of the dial event in DirectCall.
* Added `SendbirdCall.incomingCalls`, which returns a list of incoming calls to the current user.

### 1.10.8 (Jun 16, 2023)
* Added `DirectCallDelegate.didCalleeReceiveDial` to notify the caller when the calle has received the call. This delegate method will be called when the callee has received the `SendBirdCallDelegate.didStartRinging` event. 

### 1.10.7 (May 23, 2023)
* Added `SendBirdCall.retrieveMissedDirectCalls` to get incoming direct calls that were not received via push notifications. 
* Added `SendBirdCallDelegate.didReceiveVoIPException` to handle any incorrectly received voip push notifications. 

### 1.10.6 (Apr 21, 2023)
* Improved connection quality delegate in Direct Calls.

### 1.10.5 (Apr 12, 2023)
- Added a feature to detect connection qualities in ongoing Direct Calls.
  - Added `ConnectionQualityDelegate`
  - Added `ConnectionMetrics`
  
### 1.10.4 (Mar 22, 2023 UTC)
* Fixed a "virtual filesystem overlay file not found" bug on Xcode. 
    
### 1.10.3 (Mar 10, 2023 UTC)
* Added a feature to kick other participants in a room with the same user id as the current user.
    * Added `Room.EnterParams.kickSiblings`

### 1.10.2 (Feb 17, 2023 UTC)
* Fix a bug in Direct Call where the audio output would automatically changes back to earpiece after the call connects. 

### 1.10.1 (Feb 14, 2023 UTC)
* Added room delegates methods to detect local participant's connection with the server.
    * Added `RoomDelegate.didLocalParticipantDisconnect`
    * Added `RoomDelegate.didLocalParticipantReconnect`

### 1.10.0 (Jan 31, 2023 UTC)
* Added a feature to invite users to enter a room.
    * Added `room.sendInvitation(inviteeId:completionHandler:)`.
    * Added `RoomInvitation` class to manage invitation.
    * Added `roomInvitation.accept`, `roomInvitation.decline`, `roomInvitation.cancel`. 
    * Added `RoomDelegate.onInvitationAccepted`, `RoomDelegate.onInvitationDeclined`, `RoomDelegate.onInvitationCanceled`.
* Added a new interface to delete a room. 
    * Added `room.delete`.

### 1.9.7 (Nov 14, 2022 UTC)
* Fixed an error where audio recording would stop when the audio is put on mute. 

### 1.9.6 (Oct 13, 2022 UTC)
* Improve stability.
 
### 1.9.5 (Aug 3, 2022 UTC)
* Fixed an issue where dial tone will play randomly either from earpiece rather than speaker.
* Updated SendBirdWebRTC dependency to 1.6.0.

### 1.9.4 (Jun 1, 2022 UTC)
* Fixed a bug where statistics for direct calls sometimes returned incorrect values. 
* Improve stabilty.  

### 1.9.3 (Apr 20, 2022 UTC)
* Fixed a bug where isAudioEnabled and isVideoEnabled in CallOptions didn't work properly. 
* Removed i386 architecture from the framework.
* Updated SendBirdWebRTC dependency version to 1.5.0.

### 1.9.2 (Dec 15, 2021 UTC)
* Improved stability.

### 1.9.0 (Dec 9, 2021 UTC)
For 1.9.0, a new feature to delete a room in Group call is released.

Here is what's been updated:
*  Added `didDelete()` in `RoomDelegate` which is invoked when the room has been deleted by the Platform API.

### 1.8.2 (Nov 19, 2021 UTC)
* Improved stability.

### 1.8.1 (Nov 19, 2021 UTC)
* Improved stability.

### 1.8.0 (Oct 27, 2021 UTC)
For 1.8.0, a new feature is released for both Group call and Direct call features respectively.
For the Group call feature, you can now add and manage custom items to store additional information for a room.
Here are the details of the update:
    * Added `customItems` in `Room`.
    * Added `customItems` in `RoomParams`.
    * Added `updateCustomItems(customItems:completionHandler)` and `deleteCustomItems(customItemKeys:completionHandler:)` in `Room`.
    * Added `didUpdateCustomItems(updatedKeys:)` and `didDeleteCustomItems(deletedKeys:)` in `RoomDelegate`.
For the Direct call feature, you can now hold and resume calls which allows you to accept an incoming call or switch between calls.
Here are the details of the update:
    * Added `hold(completionHandler:)` and `unhold(force:completionHandler)` in `DirectCall`.
    * Added `isOnHold` in `DirectCall`.
    * Added `holdActiveCall` in `DialParams` and `AcceptParams`.
    * Added `didUserHoldStatusChange(call:isLocalUser:isUserOnHold:)` in `DirectCallDelegate`.
* Added `getOngoingCalls()` in `SendBirdCall` to retrieve a list of ongoing Direct Calls in the Calls SDK.
* API reference is updated for all platforms. 
* Fixed an issue where some characters in `userId` were incorrectly encoded during authentication.
* Added support for Swift Package Manager.
* Improved stability.

### 1.7.1 (June 15, 2021 UTC)
* Fixed Invalid Bundle error from enabled LLVM instrumentation.

### 1.7.0 (June 4, 2021 UTC) 
* Added capability to query rooms. 
    * Added `RoomListQuery`.
    * Added `RoomListQueryParams`.
    * Added `createRoomListQuery(with:)` in `SendBirdCall`.
* Added `SendBirdRange`.
* Added `embed(in:)` to `SendBirdVideoView`.
* Xcode 12 is now required to build SendBirdCalls.
* Improved stability. 

### 1.6.2 (May 13, 2021 UTC)
* Improved stability. 

### 1.6.1 (May 11, 2021 UTC)
* Improved stability. 

### 1.6.0 (Apr 22, 2021 UTC)
* Sendbird Calls now supports making group calls in a room.
    * Added `Room`.
        * Added `createRoom(with:completionHandler:)` in `SendBirdCall`.
        * Added `fetchRoom(by:completionHandler:)` in `SendBirdCall`.
        * Added `getCachedRoom(by:completionHandler:)` in `SendBirdCall`. 
        * Added `RoomType`.
        * Added `RoomParams`.
        * Added `State` in `Room`.
        * Added `EnterParams` in `Room`.
        * Added `RoomDelegate`.
    * Added `Participant`, `LocalParticipant` and `RemoteParticipant`.
        * Added `Participant.State`.
* Improved stability.

### 1.5.7 (Apr 8, 2021 UTC)
* Improved stability.

### 1.5.6 (Apr 7, 2021 UTC)
* Improved stability.

### 1.5.5 (Mar 17, 2021 UTC)
* Fixed issue where `DirectCall.startedAt` would return incorrect value. 

### 1.5.4 (Mar 12, 2021 UTC)
* Added support for screen share in `DirectCall`.
    * Added `startScreenShare(completionHandler:)` in `DirectCall`.
    * Added `stopScreenShare(completionHandler:)` in `DirectCall`.
    * Added `isLocalScreenShareEnabled` in `DirectCall`.

### 1.5.3 (Mar 3, 2021 UTC)
* Improved stability.

### 1.6.0-beta (Feb 17, 2021 UTC)
Supports the early access program for group calling. New concepts introduced in this version center around **rooms** and **participants**.
* Added New methods to existing classes
    * Added `createRoom(with:completionHandler:)` in `SendBirdCall`
    * Added `fetchRoom(by:)` to `SendBirdCall`
    * Added `getCachedRoom(by:)` to `SendBirdCall`
* Added new classes
    * Added `Room`
    * Added `Room.EnterParams`
    * Added `Participant`
    * Added `LocalParticipant`
    * Added `RemoteParticipant`
* Added new protocols
    * Added `RoomDelegate`
* Added new enums
    * Added `Room.State`
    * Added `Participant.State`

### 1.5.2 (Jan 27, 2021 UTC)
* Improved stability.

### 1.5.1 (Dec 21, 2020 UTC)
* Improved stability.

### 1.5.0 (Dec 11, 2020 UTC)
* Added support for integration with Sendbird Chat.
    * Added `SendBirdChatOptions`.
    * Added `sendbirdChatOptions` parameter to `DialParams`.
* Added support for enabling dialing sound in silent mode. 
    * Added `setDirectCallDialingSoundOnWhenSilentMode(isEnabled:)` to `SendBirdCall` class.
* Improved WebSocket handling in background.
* Added support for `Call summary` on the dashboard.
* Improved backend scalability.
* Enhanced security for compliance.

### 1.4.0 (Nov 2, 2020 UTC)
* Added Remote Recording Progress Event.
    * Added `DirectCallDelegate.didRemoteRecordingStatusChange(call: DirectCall)`.
    * Added `RecordingStatus` enumeration.
    * Added `DirectCall.localRecordingStatus`.
    * Added `DirectCall.remoteRecordingStatus`.
    * Deprecated `DirectCall.isRecording`. Please see `DirectCall.localRecordingStatus` instead.
* Improved stability.

### 1.3.0 (Sep 23, 2020)
* Added media recording feature
    * `SendBirdRecordingDelegate` protocol.
    * `addRecordingDelegate(_:identifier:)`  method in `SendBirdCall` class.
    * `removeRecordingDelegate(identifier:)`  method in `SendBirdCall` class.
    * `removeAllRecordingDelegates()` method in `SendBirdCall` class.
    * `startRecording(options:recordingStartedHandler:)`  method in `DirectCall` class.
    * `stopRecording(recordingId:)`  method in `DirectCall` class.
* Added screen capture feature
    * `captureRemoteVideoView(completionHandler:)` method in `DirectCall` class.
    * `captureLocalVideoView(completionHandler:)` method in `DirectCall` class.
* Added sound effects feature
    * `addDirectCallSound(_:bundle:forType:)` method in `SendBirdCall` class.
    * `addDirectCallSound(_:forType:)` method in `SendBirdCall` class.
    * `removeDirectCallSound(forType:)` method in `SendBirdCall` class.
* Improved permission handling 
    * You must acquire permission to use the camera to enable local camera device.

### 1.2.6 (Sep 11, 2020)
* Fixed issue where VoIP Push notifications would intermittently cause crashes.  

### 1.2.5 (Aug 31, 2020)
* Improved stability.

### 1.2.4 (Aug 21, 2020)
* Improved stability.

### 1.2.3 (Aug 11, 2020)
* Fixed issue where caller's local video view wouldn't appear while dialing.

### 1.2.2 (July 30, 2020)
* Fixed issue where callee's remote video view wouldn't properly appear.

### 1.2.1 (July 28, 2020)
* Improved stability.

### 1.2.0 (July 16, 2020)
* Added support for Peer-to-peer call.
    * The Peer-to-peer option can be configured on the dashboard.
* Added getting ongoing call count and ongoing status of `DirectCall`.
    * Added `getOngoingCallCount()` to `SendBirdCall`.
    * Added `isOngoing` to DirectCall.
* Added `setCallConnectionTimeout(_:)`  to `SendBirdCall`.
    * The call connection timer starts when the callee accepts the call. The timer will end the call after the specified timeout interval.
* Added Equatable conformance to `DirectCall`, `DirectCallLog`, `User`, `DirectCallUser`.
* Removed deprecated interfaces.
* Improved stability.

### 1.1.6 (July 14, 2020)
* Improved stability.

### 1.1.5 (July 13, 2020)
* Improved stability.

### 1.1.4 (Jun 30, 2020)
* Fix error where Objective-C interface wouldn't appear for iOS Simulator build destinations.

### 1.1.3 (Jun 17, 2020)
* Improved stability.

### 1.1.2 (Jun 16, 2020)
* Improved stability.

### 1.1.1 (Jun 12, 2020)
* Fix bug where video call starts with receiver mode.

### 1.1.0 (May 22, 2020)
* Added property `callLog` in `DirectCall`.
* Added property `isFromServer` in `DirectCallLog`.
* Improved Logger features.
    * Added `setLoggerLevel(_:)`.
    * Added `Logger.Level` enum.
* VoIP Push Token Unregistration in deauthenticate method is now deprecated. 
    * Deprecated `deauthenticate(voipPushToken:completionHandler:)`.
    * Added `deauthenticate(completionHandler:)`.
* Renamed Objective-C methods
    * `addWithReceiver:` to `addLogReceiver:` in `SBCLogger` class.
    * `removeWithReceiver:` to `removeLogReceiver:` in `SBCLogger` class.
* Stability Improvements. 

### 1.0.9 (May 6, 2020)
* Fixed Bitcode error with LLVM Profiling issue.  

### 1.0.8 (May 6, 2020)
* Enabled Bitcode

### 1.0.7 (May 5, 2020)
* Fixed error where WebSocket would intermittently fail. 

### 1.0.6 (May 1, 2020)
* Added `SBCError.errorCode` to access the `SBCError.ErrorCode` enum value of the error.
* Added more cases to `SBCError.ErrorCode` enum to reflect the errors from the server.

### 1.0.5 (Apr 30, 2020) 
* VoIP Push Token Registration through AuthenticateParams is now deprecated. Please register by `SendBirdCall.registerVoIPPush(token:unique:completionHandler:)`.
* Added `DirectCall.switchCamera(completionHandler:)` for switching the camera between front and back cameras.
* Added `SendBirdCall.setRingingTimeout(_:)` to change the timeout period before unanswered ringing or dialing calls expires and ends.
* Improved Remote Push Notification Handling
* Stability Improvements. 

### 1.0.4 (Apr 29, 2020) 
* Fixed a bug where VoIP Push Notifications weren’t being parsed.

### 1.0.3 (Apr 23, 2020) 
* Added Remote Push Notification Capabilities.
    * Added `application(_:didReceiveRemoteNotification:)`.
    * Added `registerRemotePush(token:unique:completionHandler:)`.
    * Added `unregisterRemotePush(token:completionHandler:)`.
    * Added `unregisterAllRemotePushTokens(completionHandler:)`.
* Optimized FPS for video calls.
* Improved stability. 

### 1.0.2 (Apr 3, 2020)
* Added `audioSessionDidActivate` and `audioSessionDidDeactivate` for updating audio session to handle CallKit events.
* Stability Improvements.

### 1.0.1 (Mar 27, 2020)
* Improved stability.

### 1.0.0 (Mar 24, 2020)
* Added camera selection feature.
    * Updated  `init(isAudioEnabled:isVideoEnabled:localVideoView:remoteVideoView:useFrontCamera:)` in `CallOptions`.
    * Added `useFrontCamera` in `CallOptions`.
    * Added `VideoDevice` class.
    * Added `VideoDevice.Position` enum.
    * Added `availableVideoDevices` in `DirectCall`.
    * Added `currentVideoDevice` in `DirectCall`.
    * Added `selectVideoDevice(_:completionHandler:)` method in `DirectCall`.
* Renamed Objective-C methods.
    * `getCallForCallId:` to `callForCallId:` in `SBCSendBirdCall` class.
    * `getCallForUUID:` to `callForUUID:` in `SBCSendBirdCall` class.
* Removed deprecated methods.

### 0.9.0 (Mar 18, 2020)
* Changed endpoint domain.
* Added Completion Handler to `DirectCall.end` for more flexible usage. 
* Improved stability.

### 0.8.3 (Mar 13, 2020)
* Fixed a bug that could not render local video view.

### 0.8.2 (Mar 12, 2020)
* Improved stability.

### 0.8.1 (Mar 11, 2020)
* Stability improvements. 

### 0.8.0 (Mar 11, 2020)
* Added video call feature.
        * Added `SendBirdVideoView` class.
        * Added `isLocalVideoEnabled` and `isRemoteVideoEnabled` in `DirectCall`.
        * Added `startVideo()` and `stopVideo()` in `DirectCall`.
        * Added `updateLocalVideoView(_:)` and `updateRemoteVideoView(_:)` in `DirectCall`.
        * Added `init(isAudioEnabled:isVideoEnabled:localVideoView:remoteVideoView:)` in `CallOptions`.
        * Added `didRemoteVideoSettingsChange(call:)` method in `DirectCallDelegate`.
* Renamed `PushToken` to `VoIPPushToken`.  Previous methods were deprecated, and will be removed in 1.0.0.
* Modified `CallOptions` and `DialParams` to conform `NSCopying`
* Removed deprecated methods.
* Allowed to receive incoming calls without CallKit.
* Improved stability.

### 0.7.1 (Feb 24, 2020)
* Improved WebSocket Connection Stability.

### 0.7.0 (Feb 20, 2020)
* Replaced `didEnterRinging(_:)` with `didStartRinging(_:)` in `SendBirdCallDelegate`.
* New feature of `CustomItems`.
	* `updateCustomItems(customItems:completionHandler:)` in `DirectCall` class.
	* `deleteCustomItems(customItemKeys:completionHandler:)` in `DirectCall` class.
	* `deleteAllCustomItems(completionHandler:)` in `DirectCall` class.
	* `updateCustomItems(callId:customItems:completionHandler:)` in `SendBirdCall` class.
	* `deleteCustomItems(callId:customItemKeys:completionHandler:)` in `SendBirdCall` class.
	* `deleteAllCustomItems(callId:completionHandler:)` in `SendBirdCall` class.
	* `didUpdateCustomItems(call:updatedKeys:)` in `DirectCallDelegate` protocol.
	* `didDeleteCustomItems(call:deletedKeys:)` in `DirectCallDelegate` protocol.
	* Read-only property `customItems` in `DirectCall`.
* New methods related to change of audio route.
	* `didAudioDeviceChange(_:session:previousRoute:reason:)` in `DirectCallDelegate` protocol.
	* `routePickerView(frame:)` in `SendBirdCall` class.
* New protocol of call reconnection.
	* `didStartReconnecting(_:)` 
	* `didReconnect(_:)`
* New parameter Classes for Dial, `DialParams` `AcceptParams`.
	* Replaced `dial(to:isVideoCall:completionHandler:)` with `dial(with:completionHandler:)`.
	* Replaced `accept(callOptions:)` with `accept(with:)`.	
* Replaced `authenticate(params:completionHandler:)` with `authenticate(with:completionHandler:)`.	
* Replaced `EndResult` enum with `DirectCallEndResult`.
* Renamed Objective-C methods
	* `addWithEndResult:` to `addEndResult:` in `SBCDirectCallLogListQueryParams` class.
	* `removeWithEndResult:` to `removeEndResult:` in `SBCDirectCallLogListQueryParams` class.
	* `initWithIsAudioEnabled:` to `initWithAudioEnabled:` in `CallOptions` class.
	* `createDirectCallLogListQueryWith:` to `createDirectCallLogListQueryWithParams:` in `SendBirdCall` class.
* Increased stability.

### 0.6.10 (Jan 31, 2020)
* Deprecated `SendBirdCall.appId` setter.
* Deprecated `CallOption.isVideoCall` property.
* New initializer of `CallOption`, `init(isAudioEnabled:)`.
* Deprecated `SendBirdCall.dial(to:callOptions:completionHandler:)`.
* New method to dial `dial(to:isVideoCall:callOptions:completionHandler:)`.
* Increased stability.

### 0.6.3 (Jan 3, 2020)
* Support `DirectCall.duration` when a call is active.
* Fixed a bug with `didRemoteAudioSettingChange()` delegate.
* Changed `DirectCallDelegate` methods from `optional` to `required`
    * didConnect()
    * didEnd()
* Changed return type of `SendBirdCall.configure()` to `discardableResult`

### 0.6.2 
Deprecated

### 0.6.1 (Dec 23, 2019)
* Support prior swift version and Xcode.

### 0.6.0 (Dec 21, 2019)
* First release.
