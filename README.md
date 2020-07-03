# SendBirdCalls for iOS

![iOS 9.0+](https://img.shields.io/badge/iOS-9.0+-lightgray.svg) [![Languages](https://img.shields.io/badge/language-swift-blue.svg)](https://github.com/sendbird/sendbird-calls-ios) [![Languages](https://img.shields.io/badge/language-objc-blue.svg)](https://github.com/sendbird/sendbird-calls-ios) [![Coverage](https://img.shields.io/badge/coverage-84.51%25-brightgreen.svg)](https://github.com/sendbird/sendbird-calls-ios) [![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SendBirdCalls.svg)](https://img.shields.io/cocoapods/v/SendBirdCalls.svg) [![Commercial License](https://img.shields.io/badge/license-Commercial-brightgreen.svg)](https://github.com/sendbird/sendbird-calls-ios/blob/master/LICENSE.md) 
  
## Introduction
`SendBird Calls` is the latest addition to our product portfolio. It enables real-time calls between users within a SendBird application. SDKs are provided for iOS, Android, and JavaScript. Using any one of these, developers can quickly integrate voice and video call functions into their own client apps, allowing users to make and receive web-based real-time voice and video calls on the SendBird platform.

> If you need any helps or have any issue / question, please visit [our community](https://community.sendbird.com) 

## Functional Overview
The SendBird Calls iOS SDK provides a framework to make and receive voice and video calls. “Direct calls” in the SDK refers to one-to-one calls, comparable to “direct messages” (DMs) in messaging services. To make a direct voice or video call, the caller specifies the user ID of the intended callee, and dials. Upon dialing, all of the callee’s authenticated devices will receive incoming call notifications. The callee then can choose to accept the call from any one of the devices. When the call is accepted, a connection is established between the caller and the callee. This marks the start of the direct call. Call participants may mute themselves, as well as select the audio and video hardware used in the call. Calls may be ended by either party. The SendBird Dashboard displays call logs in the Calls menu for application owners and admins to review.

## SDK Prerequisites
* iOS 9.0 or later
* Swift 4 or later, Objective-C
* Xcode 9 or later, macOS Sierra or later.
* Installation of **[Git Large File Storage](https://git-lfs.github.com)**

> **IMPORTANT**: **MAKE SURE to install Git LFS before installing the pod**. Check the size of `WebRTC.framework` in SendBirdWebRTC folder. It MUST be over 800 MB. If the loaded SendBirdWebRTC framework is smaller than that, check the *Git Large File Storage* settings and download again. Refer to [the troubleshooting section](#Library-not-loaded-WebRTC.framework).

## SDK Dependencies
* [WebRTC framework](https://github.com/sendbird/sendbird-webrtc-ios), which can be integrated by CocoaPods or direct install.

## Installation
To use SendBird Calls, first add our custom-built WebRTC framework to the project. [Git Large File Storage](https://git-lfs.github.com) must be installed to use the WebRTC framework along with the SendBirdCalls framework.
- Run `brew install git-lfs` in the project directory. 

### CocoaPods
[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects. For usage and installation CocoaPods instructions, visit [their website](https://cocoapods.org/). SendBirdCalls can be integrated into the Xcode project using CocoaPods by doing the following:
1. Install CocoaPods into the project by running `pod init` in the project directory.
2. Run `open Podfile`
3. In the opened Podfile, include `pod ‘SendBirdCalls’` to the configuration under the project target.
4. Install the SendBirdCalls framework by running `pod install` in the project directory. 

> **Note**: The `SendBirdCalls` SDK relies on the` SendBirdWebRTC` framework. `SendBirdWebRTC` is based on `GoogleWebRTC` and is recompiled with `bitcode` enabled. Since `SendBirdWebRTC` is included in `SendBirdCalls` as a dependency, it doesn't need to be explicitly downloaded.

> **IMPORTANT**: After installing the framework, there **MUST** be a 800+MB `SendBirdWebRTC` binary inside `Pods/SendBirdWebRTC.framework`. If not, follow [this troubleshooting guide](#library-not-loaded-webrtcframework).

### Direct Install
If you do not prefer to use CocoaPods to install Calls SDK, you can choose to integrate SendBirdCalls directly into your project. SendBirdCalls framework is provided as fat `.framework` file and `.xcframework` file. 
1. Grab the framework file by one of the following:
    - Direct download from git releases
    - Git Submodules
    - Other package managers
2. Copy the downloaded framework file into your project directory. 
3. Go to `General` tab of your Xcode Project Navigator, and scroll down to `Frameworks, Libraries, and Embedded Content` menu. 
4. Click the `+` button, choose `Add other...` drop down menu, and select `Add files...` option. 
5. From the file navigator, select the framework that you've previously downloaded. 
6. Select `Embed & Sign` option in the `Embed` menu of the selected framework. 

Because `SendBirdCalls` requires `SendBirdWebRTC` as a dependency, you need to install `SendBirdWebRTC` as well. 
- Navigate to [SendBirdWebRTC Repository](https://github.com/sendbird/sendbird-webrtc-ios) and perform the above steps 1-6 similarly. 

### ~~Carthage~~

> To ensure backwards compatibility, and because Carthage hasn't been updated for a long time, we are no longer officially supporting the use of Carthage to integrate Sendbird Calls. Instead, you can choose to integrate Sendbird Calls framework directly from the provided `.framework` file or `.xcframework` file.

[Carthage](https://github.com/Carthage/Carthage#quick-start) is a another dependency manager for Xcode projects. SendBirdCalls can be integrated into an Xcode project with `Carthage` by following these steps:
1. Get Carthage by running `brew install carthage`, or choose [another installation method](https://github.com/Carthage/Carthage#installing-carthage).
2. Create a [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile) in the same directory `.xcodeproj` or `.xcworkspace` is.
3. List the desired dependencies in the [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile), like this:
```
github "sendbird/sendbird-calls-ios"
github "sendbird/sendbird-webrtc-ios"
```
4. Run `carthage update`.
5. A `Cartfile.resolved` file and a `Carthage` directory will appear in the same directory as  `.xcodeproj` or `.xcworkspace` .
6. Drag the built `.framework` binaries from `Carthage/Build/iOS` into the application’s Xcode project.
7. On the application targets’ `Build Phases` settings tab, click the `+` icon and choose `New Run Script Phase`. Create a `Run Script` that specifies the desired shell (e.g. `/bin/sh`), then add the following contents to the script area below the shell:
```
/usr/local/bin/carthage copy-frameworks
```
8. Add the paths to the desired frameworks under “Input Files.” For example:
```
$(SRCROOT)/Carthage/Build/iOS/SendBirdCalls.framework
$(SRCROOT)/Carthage/Build/iOS/WebRTC.framework
```
9. Add the paths to the copied frameworks to the “Output Files.” For example:
```
$(BUILT_PRODUCTS_DIR)/$(FRAMEWORKS_FOLDER_PATH)/SendBirdCalls.framework
$(BUILT_PRODUCTS_DIR)/$(FRAMEWORKS_FOLDER_PATH)/WebRTC.framework
```
Another approach when having multiple dependencies is to use `.xcfilelists`. This is covered when building for `iOS`

For an in depth guide, read on from [Carthage’s ReadMe](https://github.com/Carthage/Carthage#quick-start)

## Configure the Application for the SDK

### Background Mode
To support background operation, VoIP-enabled apps must have `Background Mode` enabled in the `Xcode Project > Signing&Capabilities` pane. Select the checkbox for `Voice over IP`.

To receive push notifications, the app also must have `Push Notifications` enabled in the `Xcode Project > Signing&Capabilities` pane. 
> For more information about VoIP push notification and PushKit, see Apple's [CallKit](https://developer.apple.com/documentation/callkit) and [PushKit](https://developer.apple.com/documentation/pushkit)


### Configure The App’s `Info.plist` File
iOS requires that apps display authorization message to grant the app access to the camera and microphone:
* Microphone-enabled apps must include the [NSMicrophoneUsageDescription](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/uid/TP40009251-SW25) key in the app’s `Info.plist` file.
* Camera-enabled apps must include the [NSCameraUsageDescription](https://developer.apple.com/documentation/bundleresources/information_property_list/nscamerausagedescription) key in the app’s `Info.plist` file.

## Initialize the SendBirdCall instance in a client app
As shown below, the `SendBirdCall` instance must be initiated when a client app is launched. If another initialization with another `APP_ID` takes place, all existing data in the app will be deleted and the `SendBirdCall` instance will be initialized with the new `APP_ID`.
```swift
SendBirdCall.configure(appId: APP_ID)
```

## Authenticate a user and register a push token
In order to make and receive calls, authenticate the user with SendBird server with the `SendBirdCall.authenticate(with:)` method and **register a VoIP push token** to SendBird. Register a VoIP push token by either providing it as a parameter in the `authenticate()` method during authentication, or by using the `SendBirdCall.registerVoIPPush(token:)` method after authentication has completed. VoIP Push Notification will also enable receiving calls even when the app is in the background or terminated state. A valid APNS certificate also needs to be registered on the `SendBird Dashboard` : `Application` → `Settings` → `Notifications` → `Add certificate`. For more details on registering push tokens, please refer to [SendBirdCalls QuickStart](https://github.com/sendbird/quickstart-calls-ios#registering-push-tokens).

```swift
// Authenticate
let params = AuthenticateParams(userId: userId, accessToken: accessToken)
SendBirdCall.authenticate(with: params) { user, error in
    guard let user = user, error == nil else {
        return
    }
    // The user has been authenticated successfully
}

// Update push token
class AppDelegate: PKPushRegistryDelegate {
    func voipRegistration() {
        self.voipRegistry = PKPushRegistry(queue: DispatchQueue.main)
        self.voipRegistry?.delegate = self
        self.voipRegistry?.desiredPushTypes = [.voIP]
    }

    ...
    func pushRegistry(_ registry: PKPushRegistry, didUpdate pushCredentials: PKPushCredentials, for type: PKPushType) {
        SendBirdCall.registerVoIPPush(token: pushCredentials.token, unique: true) { (error) in
            guard let error = error else {
                return
            }
            // The Push Token has been registered successfully
        }
    }
    ...
}
```

## Register event handlers
The SDK provides two types of event handlers for various events that client apps may respond to: `SendBirdCallDelegate` and `DirectCallDelegate.`

### SendBirdCallDelegate
Register a device-specific `SendBirdCallDelegate` event handler using the `SendBirdCall.addDelegate(:)` method. Prior to adding `SendBirdCallDelegate`, users will be unable to handle the `didStartRinging(:)` delegate event. It is therefore recommended that this event handler be added during app initialization. `SendBirdCallDelegate` is removed upon app termination. After the `SendBirdCallDelegate` is added, responding to device-wide events (e.g. incoming calls) is handled as shown below:

```swift
SendBirdCall.addDelegate(self, identifier: UNIQUE_HANDLER_ID)
func didStartRinging(_ call: DirectCall) {
    // Process incoming call
}
```
<br/>

| Method        | Invoked when                                |
|---------------|--------------------------------------------|
|didStartRinging()    | Incoming calls are received in the callee’s device. |

### DirectCallDelegate
Register a call-specific `DirectCallDelegate` event delegate using `call.delegate`. Responding to call-specific events (e.g. sucessfull call connection) is then managed as shown below:

```swift
func didEstablish(_ call: DirectCall)

func didConnect(_ call: DirectCall)

func didEnd(_ call: DirectCall)

func didRemoteAudioSettingsChange(_ call: DirectCall)

func didRemoteVideoSettingsChange(_ call: DirectCall)

func didUpdateCustomItems(call: DirectCall, updatedKeys: [String])

func didDeleteCustomItems(call: DirectCall, deletedKeys: [String])

func didStartReconnecting(_ call: DirectCall)

func didReconnect(_ call: DirectCall)

func didAudioDeviceChange(_ call: DirectCall, 
                          session: AVAudioSession, 
                          previousRoute: AVAudioSessionRouteDescription, 
                          reason: AVAudioSession.RouteChangeReason)

```
<br/>

| Method                        | Invocation Criteria                                                                                                       |
|-------------------------------|-------------------------------------------------------------------------------------------------------------------|
| didEstablish()                | The callee accepted the call using the method `directCall.accept()`, but neither the caller or callee’s devices are as of yet connected to media devices. |
| didConnect()                  | Media devices (e.g. microphone and speakers) between the caller and callee are connected and the voice or video call can begin. |
| didEnd()                      | The call has ended on either the caller or the callee’s devices. This is triggered automatically when either party runs the method `directCall.end()`. This event listener is also invoked if the call is ended for other reasons. See the bottom of this readme for a list of all possible reasons for call termination.  |
| didRemoteAudioSettingsChange() | The other party changed their audio settings. |
| didRemoteVideoSettingsChange() | The other party changed their video settings. |
| didUpdateCustomItems()         | One or more of `DirectCall`’s custom items (metadata) have been updated. |
| didDeleteCustomItems()         | One or more of `DirectCall`’s custom items (metadata) have been deleted. |
| didStartReconnecting()               | `DirectCall` started attempting to reconnect to the other party after a media connection disruption. |
| didReconnect()                | The disrupted media connection reconnected. |
| didAudioDeviceChange()         | The audio device used in the call has changed. |


## Make a call
Initiate a call by first preparing the `DialParams` call parameter object.  This contains the initial call configuration, such as callee’s user id, audio or video capabilities, as well as a `CallOptions` object. Further configure media settings with the `CallOptions` object. Once prepared, the `DialParams` object is then passed into the `SendBirdCall.dial()` method to start the call.

```swift
let dialParams = DialParams(calleeId: CALLEE_ID, isVideoCall: false, callOptions: CallOptions(), customItems: [:])

let directCall = SendBirdCall.dial(with: dialParams) { directCall, error in
    //
}

directCall.delegate = self
```


## Receive a call
Receive incoming calls by first registering `SendBirdCallDelegate`. Accept or decline incoming calls using the `directCall.accept()` or the `directCall.end()` methods. If the call is accepted, a media session will automatically be established by the SDK.

Before accepting any calls, the `directCall.delegate` must be registered upfront in the `SendBirdCallDelegate`. Once registered,  `DirectCallDelegate` enables reacting to in-call events via callbacks methods.

```swift
class MyClass: SendBirdCallDelegate {
    func didStartRinging(_ call: DirectCall) { 
        call.delegate = self
    }
}
```

When the app is in the foreground, incoming call events are received via the SDK’s persistent internal server connection. However, when the app is terminated or in the background, incoming calls are received via PushKit. **PushKit messages received by the `SendBirdCall` must be delivered to the `SendBirdCall.pushRegistry(_:didReceiveIncomingPushWith:for:)` method.**

```swift
class MyClass: PKPushRegistryDelegate {
    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion: @escaping () -> Void) {
        SendBirdCall.pushRegistry(registry, didReceiveIncomingPushWith: payload, for: type) { uuid in
      
            // IMPORTANT: Incoming calls MUST be reported when receiving a pushkit push. 
            let provider = CXProvider(configuration: CXProviderConfiguration)
            let update = CXCallUpdate()
            update.remoteHandle = CXHandle(type: .generic, value: HANDLE_VALUE)
            provider.reportNewIncomingCall(with: uuid, update: update) { error in
                completion()
            })
        }
    }
}
```

## Handle a current call

During an ongoing call, mute or unmute the caller’s microphone using the `directCall.muteMicrophone()` or `directCall.unmuteMicrophone()` methods. If the remote user changes the audio settings, the local user will be notified via the `DirectCallDelegate.didRemoteAudioSettingsChange()` delegate method. 

The caller may start or stop video using the `directCall.startVideo()` or `directCall.stopVideo()` methods. If the remote user changes the video settings, the local user will be notified via the `DirectCallDelegate.didRemoteVideoSettingsChange()` listener. The current video device can be changed by using `directCall.selectVideoDevice(_:completionHandler)`.

```swift
// mute my microphone
call.muteMicrophone();

// unmute my microphone
call.unmuteMicrophone();

// starts to show video
directCall.startVideo();

// stops showing video
directCall.stopVideo();

// changes current video device
directCall.selectVideoDevice(videoDevice) { error in
    // handle error
}

// receives the event
class MyClass: DirectCallDelegate {
    ...
    func didRemoteAudioSettingsChange(_ call: DirectCall) {
        if call.isRemoteAudioEnabled {
            // The peer has been unmuted.            
        } else {
            // The peer has been muted.
        }
    }
    
    func didRemoteVideoSettingsChange(_ call: DirectCall) {
        if call.isRemoteVideoEnabled {
            // The peer has been unmuted.
        } else {
            // The peer has been muted.
        }
    }
    ...
}
```

## End a call
Users may end a call using the `directCall.end()` method. The event will then be processed via the `DirectCallDelegate.didEnd(call:)` delegate. This delegate is also triggered if the remote user ends the call.

```swift
// End a call
call.end();

// receives the event
class MyClass: DirectCallDelegate {
    ...
    func didEnd(_ call: DirectCall) {
        // Consider releasing or destroying call-related view from here.
    }
    ...
}
```

## Deauthenticating a user and unregistering a VoIP push token
### Deauthenticating a user
Users are deauthenticated (i.e. “logged out”) with `SendBirdCall.deauthenticate(voipPushToken:completionHandler:)` method. Failing to include the VoIP push token will result in the logged-out user continually receiving incoming calls despite the app being closed.

``` swift
class MyClass {
    func signOut() {
        SendBirdCall.deauthenticate(voipPushToken: myVoIPPushToken) { error in
            guard error == nil else {
                // handle error
                return
            }

            // ...
        }
    }
}
```

### Unregistering one or all VoIP push tokens
Users will no longer receive call notifications after the VoIP push token has been unregistered via the `unregisterVoIPPush(token:completionHandler:)` method. To stop sending notification to all of the user’s logged in devices, call the `unregisterAllVoIPPushTokens(completionHandler:)` method.
```swift
class MyClass {
    func removeVoIPPushToken() {
        SendBirdCall.unregisterVoIPPush(token: myVoIPPushToken) { error in
        guard error == nil else { return }
        // Unregistered successfully
    }

    func removeAllOfVoIPPushTokens() {
        func unregisterAllVoIPPushTokens(completionHandler: ErrorHandler?) {
            guard error == nil else { return }
            // Unregistered all push tokens successfully
        }
    }
}
```
 
## Retrieve a call information
The local or remote user’s information is available via the `directCall.localUser` and `directCall.remoteUser` properties.

## Retrieve call history
The SendBird server automatically stores details of calls, which can be retrieved later to display call history for users. A user’s call history is available via a `SendBirdCall.DirectCallLogListQuery` instance.

```swift
let params = DirectCallLogListQuery.Params()
let query = SendBirdCall.createDirectCallLogListQuery(with: params)

query.next(completionHandler: { [weak query] callLogs, error in
    if query?.hasNext == true, query?.isLoading == false {
        // query.next() can be called once more.
        // If a user wants to fetch more call logs.
    }
})
```

| Method           | Description                                                                                                                                                                                                                                                                                                       |
|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|next()            | Used to query the call history from `SendBirdCall` server. |
|hasNext         | If true, there are additional call history entries yet to be retrieved. |
|isLoading       | If true, the call history is being retrieved from the server.  |
|limit      | Specifies the number of call history entries to return at once. |
|myRole     | Returns the call history of the specified role. (e.g. the `params.myRole = .callee` returns only the callee’s call history.)  |
|endResults | Filters the results based on the call end result (e.g. `.completed`,`.noAnswer`,etc.) If multiple values are specified, they are processed as an `OR` condition. For example, `add(endResult:.noAnswer)`, only the history entries that resulted in `.noAnswer` will be returned. |

## Additional information 

### Callback and delegate thread handling
Callbacks may be designated to run on specific background threads to keep main threads undisturbed.  To specify a thread, run `SendBirdCall.executeOn(queue: CUSTOM_QUEUE)`. Otherwise, `SendBirdCall` will run asynchronously on `DispatchQueue.main`.
> However, because VoIP PushKit **requires** immediate and synchronous handling of callbacks, `SendBirdCallDelegate.didStartRinging(_)` and completion handler of `SendBirdCall.pushRegistry(_:didReceiveIncomingPushWith:for:completion:)` will run synchronously on the threads that called them. In other words, only these two processes will not run on the thread specified in `SendBirdCall.executeOn(queue:)`.
```swift
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let callbackQueue = DispatchQueue(label: QUEUE_LABEL)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Set specific callback queue.
        SendBirdCall.executeOn(queue: self.callbackQueue)

        ...
    }
}

extension AppDelegate: SendBirdCallDelegate {

    func didStartRinging(_ call: DirectCall) {
    // This delegate may not be executed on the thread set by SendBirdCall.executeOn(queue:).
        ...
    }

}

extension AppDelegate: DirectCallDelegate {

    // Runs on the custom thread.
    // In this sample code, runs on the callbackQueue above.
    func didEstablish(_ call: DirectCall) { ... }
    func didConnect(_ call: DirectCall) { ... }
    func didEnd(_ call: DirectCall) { ... }
    
    ...
}
```

### call results
| EndResult        | Description                                                                                                            |
|------------------|------------------------------------------------------------------------------------------------------------------------|
| noAnswer            | The callee failed to either accept or decline the call within a specific amount of time. |
| canceled             | The caller canceled the call before the callee could accept or decline. |
| declined             | The callee declined the call.  |
| completed            | The call ended after either party ended it. |
| timedOut            | The SendBird server failed to establish a media session between the caller and callee within a specific amount of time. |
| connectionLost      | The data stream from either the caller or the callee has stopped due to a WebRTC connection issue. |
| dialFailed          | The `dial()` method call has failed. |
| acceptFailed        | The `accept()` method call has failed. |
| otherDeviceAccepted | The incoming call was accepted on a different device. This device received an incoming call notification, but the call ended when a different device accepted it. |

## Encoding Configurations
| Category | Value | Note |
|---|---|---|
| Frames per second | 24 fps | |
| Maximum resolution | 720p | 1280x720 px; standard HD |
| Audio Codec | OPUS | |
| Video Codec| H.264, VP8 | H.264 is used between iOS devices as a default codec. |

## Troubleshooting 
### Library not loaded WebRTC.framework
Error message:
```
dyld: Library not loaded: @rpath/WebRTC.framework/WebRTC
  Referenced from: /private/var/containers/Bundle/Application/{UUID}/{APPLICATION_NAME}.app/Frameworks/SendBirdCalls.framework/SendBirdCalls
Reason: image not found
```
Above error is caused by the lack of `Git Large File Storage`. The size of `SendBirdWebRTC.framework` is over 800MB (the size of `WebRTC` binary is about 849MB), but  `Git` cannot normally download a file that large. To install the entire framework file, installing `git-lfs` is required.
However, because Cocoapods has already cached the faulty `SendBirdWebRTC.framework` binary, simply installing `git-lfs` will not solve the problem. All caches associated with `SendBirdWebRTC.framework` must be cleared:
1. Install `git-lfs`
```
// in the project directory
brew install git-lfs
```
2. Remove all caches
```
pod cache clean --all

rm -rf ~/Library/Caches/CocoaPods/*
rm -rf ~/Libaray/Developer/Xcode/DerivedData/*
```
Or, to avoid removing all of the caches not related to `SendBirdWebRTC.framework`, simply remove caches related to `SendBirdWebRTC.framework`.
```
pod cache clean 'SendBirdWebRTC' --all

rm -rf ~/Library/Caches/CocoaPods/Pods/Release/SendBirdWebRTC
rm -rf ~/Library/Caches/CocoaPods/Pods/Specs/Release/SendBirdWebRTC
rm -rf ~/Library/Developer/Xcode/DerivedData/{PROJECT-NAME}-{UUID}
```
3. Setup Cocoapods again
```
pod deintegrate
pod setup
```

> Note
 > `[!] A valid Xcode project file is required.`
 > This error message will appear if you have multiple .xcodeproject or .xcworkspace files in the directory. Make sure to have only 1 copy of each file.
 > If the same error message appears again, check if your current directory is the folder that contains your .xcodeproject: `$ ls`.

4. Re-install Cocoapods dependencies
```
pod install
```
