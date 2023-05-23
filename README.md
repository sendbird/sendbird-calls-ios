# [Sendbird](https://sendbird.com) Calls SDK for iOS

![iOS 9.0+](https://img.shields.io/badge/iOS-9.0+-lightgray.svg) [![Languages](https://img.shields.io/badge/language-swift-blue.svg)](https://github.com/sendbird/sendbird-calls-ios) [![Languages](https://img.shields.io/badge/language-objc-blue.svg)](https://github.com/sendbird/sendbird-calls-ios) [![Coverage](https://img.shields.io/badge/coverage-88.70%25-brightgreen.svg)](https://github.com/sendbird/sendbird-calls-ios) [![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SendBirdCalls.svg)](https://img.shields.io/cocoapods/v/SendBirdCalls.svg) [![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Commercial License](https://img.shields.io/badge/license-Commercial-brightgreen.svg)](https://github.com/sendbird/sendbird-calls-ios/blob/master/LICENSE.md) 

## Table of contents

  1. [Introduction](#introduction)
  1. [Before getting started](#before-getting-started)
  1. [Getting started](#getting-started)
  1. [Configuring the application for the SDK](#configuring-the-application-for-the-sdk)
  1. [Making your first call](#making-your-first-call)
  1. [Implementation guide](#implementation-guide)  
  1. [Appendix](#appendix)
  1. [Troubleshooting](#troubleshooting)  

<br />

## Introduction

**Sendbird Calls** is the latest addition to our product portfolio. It enables real-time calls between users within a Sendbird application. SDKs are provided for iOS, Android, and JavaScript. Using any one of these, developers can quickly integrate voice and video call functions into their own client apps, allowing users to make and receive web-based real-time voice and video calls on the Sendbird platform.

> If you need any help in resolving any issues or have questions, please visit [our community](https://community.sendbird.com) 

### How it works

Sendbird Calls SDK for iOS provides a framework to make and receive voice and video calls. **Direct calls** in the SDK refers to one-to-one calls. To make a direct voice or video call, the caller specifies the user ID of the intended callee, and dials. Upon dialing, all of the callee’s authenticated devices will receive notifications for an incoming call. The callee then can choose to accept the call from any one of the devices. When the call is accepted, a connection is established between the devices of the caller and the callee. This marks the start of a direct call. Call participants can mute themselves, or call with either or both of the audio and video by using output devices such as speaker and microphone for audio, and front, rear camera for video. A call may be ended by either party. The [Sendbird Dashboard](https://dashboard.sendbird.com/auth/signin) displays call logs in the Calls menu for dashboard owners and admins to review.

### More about Sendbird Calls SDK for iOS

Find out more about Sendbird Calls for iOS on [Calls SDK for iOS doc](https://sendbird.com/docs/calls/v1/ios/getting-started/about-calls-sdk).

<br />

## Before getting started

This section shows the prerequisites you need to check to use Sendbird Calls SDK for iOS.

### Requirements

* iOS 11.0 or later
* Swift 5 or later, Objective-C
* Xcode 14.1 or later, macOS Sierra or later.

### SDK dependencies

* [WebRTC framework](https://github.com/sendbird/sendbird-webrtc-ios), which can be integrated by `Swift Package Manager`, `CocoaPods`, `Carthage`, or manual set-up.

<br />

## Getting started

This section gives you information you need to get started with Sendbird Calls SDK for iOS.

### Install Calls SDK

### Swift Package Manager

Go to your Swift Package Manager's `File` tab and select `Swift Packages`. Then choose `Add package dependency`.

Add the `SendBirdCalls` framework into your Package Repository with the following URL: `https://github.com/sendbird/sendbird-calls-ios`.

To add the package, select appropriate dependency rule and click `Add Package`.

### CocoaPods

[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects. The `SendBirdCalls` framework can be integrated into the Xcode project using `CocoaPods` by doing the following.

1. Install `CocoaPods` into the project by running `pod init` in the project directory.
2. Run `open Podfile`
3. In the opened Podfile, include `pod 'SendBirdCalls'` to the configuration under the project target.
4. Install the `SendBirdCalls` framework by running `pod install` in the project directory. 

For further details on the  usage and installation of `CocoaPods` instructions, refer to CocoaPods’ [website](https://cocoapods.org/). 

> **Note**: The Sendbird Calls SDK for iOS relies on the` SendBirdWebRTC` framework. `SendBirdWebRTC` is based on `GoogleWebRTC` and is recompiled with `bitcode` enabled. Since `SendBirdWebRTC` is included in `SendBirdCalls` as a dependency, it doesn't need to be explicitly downloaded.


### Carthage

[Carthage](https://github.com/Carthage/Carthage#quick-start) is another dependency manager for Xcode projects. The `SendBirdCalls` framework can be integrated into your Xcode project with `Carthage` by following these steps:

1. Get Carthage by running `brew install carthage`, or choose [another installation method](https://github.com/Carthage/Carthage#installing-carthage).
2. Create a [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile) in the same directory `.xcodeproj` or `.xcworkspace` is.
3. List the desired dependencies in the [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile) as show below.
```bash
github "sendbird/sendbird-calls-ios" ~> 1.10.7
github "sendbird/sendbird-webrtc-ios" ~> 1.7.0
```
4. Run `carthage update --use-xcframeworks`.
5. A `Cartfile.resolved` file and a `Carthage` directory will appear in the same directory as  `.xcodeproj` or `.xcworkspace` .
6. Drag the built `.framework` binaries from `Carthage/Build/iOS` into the application’s Xcode project.

For an in-depth guide, read on from [Carthage’s ReadMe](https://github.com/Carthage/Carthage#quick-start). If you encounter any issues when using `Carthage` to install the `SendBirdCalls`, make sure that you are using the latest version of `Carthage`.

### Manual set-up

If you do not prefer to use `CocoaPods` or `Carthage` to install the Calls SDK, here is an alternative: you can manually integrate the `SendBirdCalls` directly into your project. The `SendBirdCalls` framework is provided as a `.xcframework` file.

1. Download the framework file by one of the following.
    - Direct download from git releases
    - Git Submodules
    - Other package managers
2. Copy the downloaded framework file into your project directory. 
3. Go to **General** tab of your Xcode Project Navigator, and scroll down to **Frameworks, Libraries, and Embedded Content** menu. 
4. Click the **+** button, choose **Add other...** drop down menu, and select **Add files...** option. 
5. From the file navigator, select the framework that you've previously downloaded. 
6. Select **Embed & Sign** option in the **Embed** menu of the selected framework. 

Because `SendBirdCalls` requires `SendBirdWebRTC` as a dependency, you need to install `SendBirdWebRTC` as well. 

- Navigate to [SendBirdWebRTC Repository](https://github.com/sendbird/sendbird-webrtc-ios) and perform the above steps 1-6 similarly. 

<br />

## Configuring the application for the SDK

### Background Mode

To support background operation, VoIP-enabled apps must have `Background Mode` enabled in the **Xcode Project** > **Signing & Capabilities** pane. Select the checkbox for **Voice over IP**.

To receive push notifications, the app also must have **Push Notifications** enabled in the **Xcode Project** > **Signing & Capabilities** pane. 

> For more information about VoIP push notification and PushKit, see Apple's [CallKit](https://developer.apple.com/documentation/callkit) and [PushKit](https://developer.apple.com/documentation/pushkit)

### Configure the app’s Info.plist File

iOS requires that apps display authorization message to grant the app access to the camera and microphone.

- Microphone-enabled apps must include the [NSMicrophoneUsageDescription](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/uid/TP40009251-SW25) key in the app’s `Info.plist` file.
- Camera-enabled apps must include the [NSCameraUsageDescription](https://developer.apple.com/documentation/bundleresources/information_property_list/nscamerausagedescription) key in the app’s `Info.plist` file.

<br />

## Making your first call

Follow the step-by-step instructions below to authenticate and make your first call. 

### Step 1: Initialize the SendBirdCall instance in a client app

As shown below, the `SendBirdCall` instance must be initiated when a client app is launched. Initialize the `SendBirdCall` instance with the `APP_ID` of the Sendbird application you would like to use to make a call.

```swift
SendBirdCall.configure(appId: APP_ID)
```

> Note: If another initialization with another `APP_ID` takes place, all existing data in the app will be deleted and the `SendBirdCall` instance will be initialized with the new `APP_ID`.

### Step 2: Authenticate a user and register a push token

In order to make and receive calls, authenticate the user with SendBird server with the `SendBirdCall.authenticate(with:)` method and **register a VoIP push token** to Sendbird. Register a VoIP push token by using the `SendBirdCall.registerVoIPPush(token:)` method after authentication has completed. VoIP Push Notification will also enable receiving calls even when the app is in the background or terminated state. A valid APNS certificate also needs to be registered on the [Sendbird Dashboard](https://dashboard.sendbird.com/auth/signin): **Application** > **Settings** > **Notifications** > **Add certificate**. For more details on registering push tokens, refer to [Calls SDK for iOS doc](https://sendbird.com/docs/calls/v1/ios/guides/remote-notifications#2-remote-push-token-registration).

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

### Step 3: Add an event handler

The SDK provides two types of event handlers for various events that client apps may respond to: `SendBirdCallDelegate` and `DirectCallDelegate.`

#### - SendBirdCallDelegate

Register a device-specific `SendBirdCallDelegate` event handler using the `SendBirdCall.addDelegate(:)` method. Prior to adding `SendBirdCallDelegate`, users will be unable to handle the `didStartRinging(:)` delegate event. It is recommended to add the event handler during initialization because it is a prerequisite for detecting `didStartRinging(:)` delegate event. `SendBirdCallDelegate` is removed upon app termination. The code below shows the way device-wide events such as incoming calls are handled once the `SendBirdCallDelegate` is added. 

```swift
SendBirdCall.addDelegate(self, identifier: UNIQUE_HANDLER_ID)
func didStartRinging(_ call: DirectCall) {
    // Process incoming call
}
```

|Method|Invoked when|
|---|---|
|didStartRinging()|Incoming calls are received in the callee’s device.|

#### - DirectCallDelegate

Register a call-specific `DirectCallDelegate` event delegate using `call.delegate`. Responding to call-specific events, such as establishing a successful call connection, is then managed as shown below.

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

func didAudioDeviceChange(_ call: DirectCall, session: AVAudioSession, previousRoute: AVAudioSessionRouteDescription, reason: AVAudioSession.RouteChangeReason)
```
<br/>

|Method| Invocation criteria|
|---|---|
|didEstablish()| The callee accepted the call using the method `directCall.accept()`. However, neither the caller or callee’s devices are connected to media devices yet.|
|didConnect()|A connection is established between the caller and callee’s media devices such as microphones and speakers. The voice or video call can begin.|
|didEnd()| The call is ended on either the caller or the callee’s devices. When the `directCall.end()` method is used from either party, a call ends. directCall.end event listener is also invoked if the call is ended for other reasons. Refer to Call results in Appendix for all possible reasons for call termination.|
|didRemoteAudioSettingsChange()| The other party changed their audio settings.|
|didRemoteVideoSettingsChange()| The other party changed their video settings.|
|didUpdateCustomItems()| One or more of `DirectCall`’s custom items (metadata) have been updated.|
|didDeleteCustomItems()| One or more of `DirectCall`’s custom items (metadata) have been deleted.|
|didStartReconnecting()| `DirectCall` started attempting to reconnect to the other party after a media connection disruption.|
|didReconnect()| The disrupted media connection reestablished.|
|didAudioDeviceChange()| The audio device used in the call has changed.|

### Step 4: Make a call

First, prepare the `DialParams` call parameter object to initiate a call. The parameter contains the initial call configuration, such as callee’s user id, audio or video capabilities, and `CallOptions` object. Once prepared, the `DialParams` object is then passed into the `SendBirdCall.dial()` method to start the call.

```swift
let dialParams = DialParams(calleeId: CALLEE_ID, isVideoCall: false, callOptions: CallOptions(), customItems: [:])

let directCall = SendBirdCall.dial(with: dialParams) { directCall, error in
    //
}

directCall.delegate = self
```

### Step 5: Receive a call

Register `SendBirdCallDelegate` first to receive incoming calls. Accept or decline incoming calls using the `directCall.accept()` or the `directCall.end()` methods. If the call is accepted, a media session will automatically be established by the SDK.

Before accepting any calls, the `directCall.delegate` must be registered upfront in the `SendBirdCallDelegate`. Once registered, `DirectCallDelegate` enables reacting to in-call events through delegate methods.

```swift
class MyClass: SendBirdCallDelegate {
    func didStartRinging(_ call: DirectCall) { 
        call.delegate = self
    }
}
```

<br />

## Implementation guide

### Make a call

First, prepare the `DialParams` call parameter object to initiate a call. The parameter contains the initial call configuration, such as callee’s user id, audio or video capabilities, and `CallOptions` object. Once prepared, the `DialParams` object is then passed into the `SendBirdCall.dial()` method to start the call.

```swift
let dialParams = DialParams(calleeId: CALLEE_ID, isVideoCall: false, callOptions: CallOptions(), customItems: [:])

let directCall = SendBirdCall.dial(with: dialParams) { directCall, error in
    //
}

directCall.delegate = self
```

### Receive a call

Register `SendBirdCallDelegate` first to receive incoming calls. Accept or decline incoming calls using the `directCall.accept()` or the `directCall.end()` methods. If the call is accepted, a media session will automatically be established by the SDK.

Before accepting any calls, the `directCall.delegate` must be registered upfront in the `SendBirdCallDelegate`. Once registered, `DirectCallDelegate` enables reacting to in-call events through delegate methods.

```swift
class MyClass: SendBirdCallDelegate {
    func didStartRinging(_ call: DirectCall) { 
        call.delegate = self
    }
}
```

When the app is in the foreground, incoming call events are received through the SDK’s persistent internal server connection. However, when the app is terminated or in the background, incoming calls are received through PushKit. PushKit messages received by the `SendBirdCall` must be delivered to the `SendBirdCall.pushRegistry(_:didReceiveIncomingPushWith:for:)` method.

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

### Handle a current call

During an ongoing call, a caller may mute or unmute their microphone by using the `directCall.muteMicrophone()` or `directCall.unmuteMicrophone()` methods. 
`DirectCallDelegate.didRemoteAudioSettingsChange()` delegate method will notify any changes that a remote user makes on audio settings to the local user.

The caller may start or stop video using the `directCall.startVideo()` or `directCall.stopVideo()` methods. If the remote user changes the video settings, the local user will be notified through the `DirectCallDelegate.didRemoteVideoSettingsChange()` listener. The current video device can be changed by using the `directCall.selectVideoDevice(_:completionHandler)`.

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

### End a call

A caller may end a call using the `directCall.end()` method. The event will then be processed through the `DirectCallDelegate.didEnd(call:)` delegate. This delegate is also triggered if the remote user ends the call.

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

### Deauthenticate a user and unregister a VoIP push token

#### - Deauthenticate a user

When users log out of their call client apps, they must be deauthenticated with `SendBirdCall.deauthenticate(voipPushToken:completionHandler:)` method. Failing to include the VoIP push token will result in the logged-out user continually receiving incoming calls despite the app being closed.

```swift
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

#### - Unregister one or all VoIP push tokens

Users will no longer receive call notifications after the VoIP push token has been unregistered through the `unregisterVoIPPush(token:completionHandler:)` method. To stop sending notifications to all of the user’s logged in devices, call the `unregisterAllVoIPPushTokens(completionHandler:)` method.

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

### Mirror a SendBirdVideoView

You can set the current user’s local video view as mirrored or reversed when the camera is facing the user. In `UIView`, this can be easily done using the `CGAffineTransform(scaleX:y:)` method as shown below:   

```swift
// localSBView is SendBirdVideoView object
localSBView.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
```

If you want to reverse the local video view when the user switches the camera from front to back and vice versa, use the following method: 

```swift
func mirrorLocalVideoView(isEnabled: Bool) {
    guard let localSBView = self.localVideoView?.subviews.first else { return }
    switch isEnabled {
        // Show Mirrored view
        case true: localSBView.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        // Show original view
        case false: localSBView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }
} 


// Flipping camera
self.call.selectVideoDevice(oppositeCamera) { error in
    guard error == nil else { return }

    DispatchQueue.main.async { [weak self] in
        guard let self = self else { return }
        switch oppositeCamera.position {
            case .front: self.mirrorLocalVideoView(isEnabled: true)
            case .back: self.mirrorLocalVideoView(isEnabled: false)
            default: return
        }
    }
}
```
 
### Retrieve a call information

The local or remote user’s information is available via the `directCall.localUser` and `directCall.remoteUser` properties.

### Retrieve call history

Sendbird server automatically stores details of calls, which can be retrieved later to display call history for users. A user’s call history is available through a `SendBirdCall.DirectCallLogListQuery` instance.

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

|Method|Description|
|---|---|
|next()| Used to query the call history from Sendbird Calls server. |
|hasNext| If **true**, there are additional call history entries yet to be retrieved. |
|isLoading| If **true**, the call history is being retrieved from the server.  |
|limit| Specifies the number of call history entries to return at once. |
|myRole| Returns the call history of the specified role. For example, the `params.myRole = .callee` returns only the callee’s call history.)  |
|endResults| Filters the results based on the call end result such as `.completed`,`.noAnswer`, etc. If multiple values are specified, they are processed as an `OR` condition. For example, for `add(endResult:.noAnswer)`, only the history entries that resulted in `.noAnswer` will be returned. |

### Timeout options

The following table lists a set of methods of the `SendBirdCall` class.

```swift
SendBirdCall.setRingingTimeout(30)

SendBirdCall.setCallConnectionTimeout(30)
```

|Method|Description|
|---|---|
|setRingingTimeout(_:)| Sets the time limit for an unanswered call in seconds. The default value is **60** seconds.|
|setCallConnectionTimeout(_:)| Sets the time limit in seconds for a connecting call. The default value is **60** seconds. |

### Sound effects

#### - Sound types

|Type|Description|
|---|---|
|dialing|Refers to a sound that is played on a caller’s side when the caller makes a call to a callee. |
|ringing|Refers to a sound that is played on a callee’s side when receiving a call. |
|reconnecting|Refers to a sound that is played when a connection is lost, but immediately tries to reconnect. Users are also allowed to customize the ringtone. |
|reconnnected|Refers to a sound that is played when a connection is re-established. |

### Add sound

#### - addDirectCallSound(_:forType:) 

|Method|Description|
|---|---|
|addDirectCallSound(_:forType:) | Adds a specific sound such as a ringtone and an alert tone to a direct call with URL. If you use a bundle to play sound, use the `addDirectCallSound(_:bundle:forType:)` method below instead. |

|Parameter|Type|Description|
|---|---|---|
|url|string|Specifies the URL of your audio file.|
|forType|SoundType|Specifies the sound type to be used according to the event.|

#### - addDirectCallSound(_:bundle:forType:)

|Method|Description|
|---|---|
|addDirectCallSound(_:bundle:forType:)| Adds a specific sound such as a ringtone and an alert tone to a direct call with its file name and bundle. |

|Parameter|Type|Description|
|---|---|---|
|name|String|Specifies the name of the audio file. Make sure to specify a file extension as well. For example: dialing.mp3 |
|bundle|Bundle|Specifies the bundle object. The default is the main bundle.|
|forType|SoundType| Specifies the sound type to be used according to the event.|

### Remove sound

|Name|Description|
|---|---|
|removeDirectCallSound(forType: ) | Removes a specific sound from a direct call. |

|Parameter|Type|Description|
|---|---|--- |
|forType|SoundType| Specifies the sound type to be used according to the event. |


<br />

## Appendix 

### Callback and delegate thread handling

Callbacks may be designated to run on specific background threads to keep main threads undisturbed. To specify a thread, run `SendBirdCall.executeOn(queue: CUSTOM_QUEUE)`. Otherwise, `SendBirdCall` will run asynchronously on `DispatchQueue.main`.

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

### Call relay protocol

Sendbird Calls is based on WebRTC to enable real-time calls between users with P2P connections, but sometimes connectivity issues may occur for users due to network policies that won’t allow WebRTC communications through Firewalls and NATs (Network Address Translators). For this, Sendbird Calls uses two different types of protocols, **Session Traversal Utilities for NAT (STUN)** and **Traversal Using Relays around NAT (TURN)**. **STUN** and **TURN** are protocols that support establishing a connection between users.

> __Note__: See our [GitHub page](https://github.com/sendbird/guidelines-calls/tree/master/Recommendation%20on%20firewall%20configuration) to learn about the requirements and how to use the Calls SDKs behind a firewall.

---

#### How STUN and TURN works

Session Traversal Utilities for NAT (STUN) is a protocol that helps hosts to discover the presence of a NAT and the IP address, which eventually makes the connection between two endpoints. Traversal Using Relays around NAT (TURN) is a protocol that serves as a relay extension for data between two parties.

Sendbird Calls first try to make a P2P connection directly using the Calls SDK. If a user is behind a NAT/Firewall, Calls will discover the host's public IP address as a location to establish connection using STUN. In most cases, STUN server is only used during the connection setup and once the session has been established, media will flow directly between two users. If the NAT/Firewall still won't allow the two users to connect directly, TURN server will be used to make a connection to relay the media data between two users. Most of the WebRTC traffic is connected with STUN.

### Call results

|EndResult|Description|
|---|---|
| noAnswer| The callee failed to either accept or decline the call within a specific amount of time. |
| canceled | The caller canceled the call before the callee could accept or decline. |
| declined | The callee declined the call.  |
| completed | The call ended after either party ended it. |
| timedOut | Sendbird server failed to establish a media session between the caller and callee within a specific amount of time. |
| connectionLost | The data stream from either the caller or the callee has stopped due to a `WebRTC` connection issue. |
| dialFailed | The `dial()` method call has failed. |
| acceptFailed | The `accept()` method call has failed. |
| otherDeviceAccepted | The incoming call was accepted on a different device. This device received an incoming call notification, but the call ended when a different device accepted it. |

### Encoding Configurations

| Category | Value | Note |
|---|---|---|
| Frames per second | 24 fps | |
| Maximum resolution | 720p | 1280x720 px; standard HD |
| Audio Codec | OPUS | |
| Video Codec| H.264, VP8 | H.264 is used between iOS devices as a default codec. |

### iOS SDK Sizes

| File               | Raw Files | Compiled Size |
|--------------------|-----------|---------------|
| Calls SDK (1.7.0)  | 77.1 MB   | 2.32 MB       |
| WebRTC SDK (1.3.0) | 1.18 GB   | 6.32 MB       |

(Xcode 12.3, Any iOS Device (arm64))

*- Last Updated: June 18th, 2021*

<br />
