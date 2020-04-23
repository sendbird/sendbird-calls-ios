# Change Log

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
