# Change Log

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
