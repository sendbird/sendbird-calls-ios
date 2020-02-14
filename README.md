# SendBirdCalls for iOS

## Table of Contents
- [Introduction](#introduction)
- [Functional Overview](#functional-overview)
- [SDK Prerequisites](#sdk-prerequisites)
- [SDK Dependencies](#sdk-dependencies)
- [Installation](#installation)
  * [CocoaPods](#cocoapods)
  * [Carthage](#carthage)
- [Configure the Application for the SDK](#configure-the-application-for-the-sdk)
  * [Background Mode](#background-mode)
  * [Configure Your App's Info.plist File](#configure-your-apps-infoplist-file)
- [Initialize the SendBirdCall instance in a client app](#initialize-the-sendbirdcall-instance-in-a-client-app)
- [Authenticate a user and register a push token](#authenticate-a-user-and-register-a-push-token)
- [Register event handlers](#register-event-handlers)
  * [SendBirdCallDelegate](#sendbirdcalldelegate)
  * [DirectCallDelegate](#directcalldelegate)
- [Make a call](#make-a-call)
- [Receive a call](#receive-a-call)
- [Handle a current call](#handle-a-current-call)
- [End a call](#end-a-call)
- [Deauthenticate a user and unregister a push token](#deauthenticate-a-user-and-unregister-a-push-token)
  * [Deauthenticate a user](#deauthenticate-a-user)
  * [Unregister a push token or unregister user's all push tokens](#unregister-a-push-token-or-unregister-users-all-push-tokens)
- [Retrieve a call information](#retrieve-a-call-information)
- [Retrieve call history](#retrieve-call-history)
- [Additional information](#additional-information)
  * [call results](#call-results)
- [TroubleShootings](#troubleshootings)
  * [Library not loaded WebRTC.framework](#library-not-loaded-webrtcframework)

## Introduction
SendBirdCalls is a new product enabling real-time calls between users registered within a SendBird application. SDKs are provided for JavaScript, Android, and iOS. Using any one of these, developers can quickly integrate calling functions into their own applications that will allow users to make and receive real-time voice calls on the SendBird platform.

## Functional Overview
When implemented, the **SendBirdCalls** SDK provides the framework to both make and receive one-to-one calls, referred to in the SDK as “direct calls” (analogous to “direct messages” / “DMs” in a messaging context). Direct calls are made when a caller identifies a user on the SendBird application and initializing a call request (dialing). The callee, with the SDK’s event handlers implemented, is notified on all authenticated devices, and can choose to accept the call.  If accepted, a network route is established between the caller and callee, and the direct call begins. Application administrators can then review call logs in the “Calls” section of the SendBird dashboard.

## SDK Prerequisites
* iOS 9.0 or later
* Swift 4 or later, Objective-C
* Xcode 9 or later, macOS Sierra or later.
* Installation of **[Git Large File Storage](https://git-lfs.github.com)**
* Real devices. **The iOS simulator is NOT supported**

## SDK Dependencies
* [WebRTC framework](https://github.com/sendbird/sendbird-webrtc-ios): it will be integrated by CocoaPods

## Installation
You **MUST** install **[Git Large File Storage](https://git-lfs.github.com)** first. If not, you will suffer [the trouble](#library-not-loaded-webrtcframework).
```
brew install gif-lfs
```

### CocoaPods
[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects. For usage and installation CocoaPods instructions, visit [their website]((https://cocoapods.org/). To integrate SendBirdCalls into your Xcode project using CocoaPods, specify it in your `Podfile`:
```
pod 'SendBirdCalls'
```
> Note: The `SendBirdCalls` SDK relies on the` SendBirdWebRTC` framework. `SendBirdWebRTC` is based on` GoogleWebRTC` and recompiled with `bitcode` enabled. Since Cocoapod in `SendBirdCalls` has already declared a dependency with ` SendBirdWebRTC`, you can see `SendBirdWebRTC.framework` after installing Cocoapod.

> **IMPORTANT**: After installing Cocoapod, there **MUST** be `SendBirdWebRTC` binary whose size is over 800MB in your `Pods/SendBirdWebRTC.framework`. If not, you can fix this by following [Troubleshooting](#library-not-loaded-webrtcframework)
<br/>

### Carthage
[Carthage](https://github.com/Carthage/Carthage#quick-start) is a another dependency manager for Xcode projects. You can integrate SendBirdCalls into your Xcode project with `Carthage`, by following:
1. Get Carthage by running `brew install carthage` or choose [another installation method](https://github.com/Carthage/Carthage#installing-carthage)
2. Create a [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile) in the same directory where your .xcodeproj or .xcworkspace is
3. List the desired dependencies in the [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile), like this:
```
github "sendbird/sendbird-calls-ios"
github "sendbird/sendbird-webrtc-ios"
```
4. Run `carthage update`
5. A `Cartfile.resolved` file and a `Carthage` directory will appear in the same directory where your `.xcodeproj` or `.xcworkspace` is
6. Drag the built `.framework` binaries from `Carthage/Build/iOS` into your application’s Xcode project. 
7. On your application targets’ `Build Phases` settings tab, click the `+` icon and choose `New Run Script Phase`. Create a `Run Script` in which you specify your shell (ex: `/bin/sh`), add the following contents to the script area below the shell:
```
/usr/local/bin/carthage copy-frameworks
```
* Add the paths to the frameworks you want to use under “Input Files". For example:
```
$(SRCROOT)/Carthage/Build/iOS/SendBirdCalls.framework
$(SRCROOT)/Carthage/Build/iOS/WebRTC.framework
```
* Add the paths to the copied frameworks to the “Output Files”. For example:
```
$(BUILT_PRODUCTS_DIR)/$(FRAMEWORKS_FOLDER_PATH)/SendBirdCalls.framework
$(BUILT_PRODUCTS_DIR)/$(FRAMEWORKS_FOLDER_PATH)/WebRTC.framework
```
Another approach when having multiple dependencies is to use `.xcfilelists`. This is covered in If you´re building for `iOS`

For an in depth guide, read on from [Carthage's ReadMe](https://github.com/Carthage/Carthage#quick-start)
<br/>

## Configure the Application for the SDK

### Background Mode
To support background operation, your VoIP app must have `Background Mode` enabled in the `Xcode Project > Signing&Capabilities` pane. Select the checkbox for `Voice over IP` and `Remote notifications`.

To receive push notifications, your app also must have `Push Notifications` enabled in the `Xcode Project > Signing&Capabilities` pane. 
> For more information about VoIP push notification and PushKit, see Apple's [CallKit](https://developer.apple.com/documentation/callkit) and [PushKit](https://developer.apple.com/documentation/callkit)
<br/>

### Configure Your App's Info.plist File
iOS requires that your app provide static messages to display to the user when the system asks for microphone permission :
* If your app uses device microphones, include the [NSMicrophoneUsageDescription](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/uid/TP40009251-SW25) key in your app’s Info.plist file.
<br/>

## Initialize the SendBirdCall instance in a client app
As shown below, the `SendBirdCall` instance must be initiated when a client app is launched. If another initialization with another APP_ID takes place, all existing data will be deleted and the `SendBirdCall` instance will be initialized with the new APP_ID.
```swift
SendBirdCall.configure(appId: APP_ID)
```

## Authenticate a user and register a push token

In order to make and receive calls, authenticate the user with SendBird server with the the `SendBirdCall.authenticate()` method. To receive calls while an app is in the background or closed, a device registration token must be registered to the server. Register a device push token during authentication by either providing it as a parameter in the authenticate() method, or after authentication has completed using the `SendBirdCall.registerPushToken()` method.
```swift
// Authenticate
let params = AuthenticateParams(userId: userId, accessToken: accessToken)
SendBirdCall.authenticate(params: params) { user, error in
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
        SendBirdCall.register(pushToken: pushCredentials.token, unique: true) { (error) in
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

### SendBirdCallDelegate
Register a device-specific `SendBirdCallDelegate` event handler using the `SendBirdCall.addDelegate(:)` method. Responding to device-wide events (e.g. incoming calls) is then managed as shown below:

```swift
SendBirdCall.addDelegate(self, identifier: UNIQUE_HANDLER_ID)
func didEnterRinging(_ call: DirectCall) {
}
```
<br/>

| Method        | Description                                |
|---------------|--------------------------------------------|
|didEnterRinging()    | Called when incoming calls are received.   |

### DirectCallDelegate
Register a call-specific `DirectCallDelegate` event handler using the `call.delegate = self` method. Responding to call-specific events (e.g. call connected) is then managed as shown below:

```swift
func didEstablish(_ call: DirectCall)
 
func didConnect(_ call: DirectCall)
 
func didRemoteAudioSettingsChange(_ call: DirectCall)
 
func didEnd(_ call: DirectCall)
```
<br/>

| Method                        | Description                                                                                                       |
|-------------------------------|-------------------------------------------------------------------------------------------------------------------|
|didEstablish()                | Called when the callee has accepted the call, but not yet connected to media devices.                             |
|didConnect()                  | Called when media devices between the caller and callee are connected and can start the call using media devices. |
|didEnd()                      | Called when the call has ended.                                                                                   |
|didRemoteAudioSettingsChange() | Called when the peer changes audio settings.

## Make a call
Initiate a call by providing the callee’s user id into the `SendBirdCall.dial()` method.  Use the `CallOptions` object to choose initial call configuration (e.g. muted/unmuted) 

```swift
let directCall = SendBirdCall.dial(to: CALLEE_ID, callOptions: CallOptions()) { directCall, error in
    // 
}

directCall.delegate = self
```


## Receive a call
Receive incoming calls by registering the `SendBirdCallDelegate`. Accept or decline incoming calls using the `directCall.accept()` or the `directCall.end()` methods. If the call is accepted, a media session will be established by the SDK. The `directCall.delegate` must be registered through the event handler before accepting a call. Once registered, this delegate enables reacting to mid-call events via callbacks methods.

```swift
class MyClass: SendBirdCallDelegate {
    func didEnterRinging(_ call: DirectCall) { 
        call.delegate = self
    }
}
```

Incoming calls are received either via the application's persistent internal server connection, or (if the application is in the background) via PushKit. **PushKit messages received by the `SendBirdCall` instance must be delivered to the SDK.**

```swift
class MyClass: PKPushRegistryDelegate {
    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion: @escaping () -> Void) {
        SendBirdCall.pushRegistry(registry, didReceiveIncomingPushWith: payload, for: type) { uuid in
      
            // IMPORTANT: You MUST report incoming call to CallKit when you receive a pushkit push. 
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

While a call is in progress, mute or unmute the caller’s audio using the `directCall.muteMicrophone()` or `directCall.unmuteMicrophone()` method(s). If the callee changes their audio settings, the caller is notified via the `DirectCallDelegate.didRemoteAudioSettingsChange()` delegate.

```swift
// mute my microphone
call.muteMicrophone();

// unmute my microphone
call.unmuteMicrophone();

// receives the event
class MyClass: DirectCallDelegate {
    ...
    func didRemoteAudioSettingsChange(_ call: DirectCall) {
        if (call.isRemoteAudioEnabled) {
            // The peer has been unmuted.            
        } else {
            // The peer has been muted.
        }
    }
    ...
}
```

## End a call
A caller ends using the `directCall.end()` method. The event is then processed via the `DirectCallDelegate.didEnd(call:)` delegate. This delegate is also used when if the callee ends call.

```swift
// End a call
call.end();

// receives the event
class MyClass: DirectCallDelegate {
    ...
    func didEnd(_ call: DirectCall) {
        // 
    }
    ...
}
```

## Deauthenticating a user and unregistering a device token
### Deauthenticating a user
When a user signs out of SendBird Calls, you should deauthenticate the user with the `SendBirdCall.deauthenticate(pushToken:completionHandler:)` method. If the method is called without a user's VoIP device token, the user will continue to receive calls even though the app is terminated or runs in the background.
``` swift
class MyClass {
    func signOut() {
        SendBirdCall.deauthenticate(pushToken: myVoIPPushToken) { error in
            guard error == nil else {
                // handle error
                return
            }

            // ...
        }
    }
}
```

### Unregistering one or all device tokens
The user won't receive push notifications for calls if the VoIP device token is deleted by calling the `unregister(pushToken:completionHandler:)` method. If you don't want to send any calls to the user's devices, call the `unregisterAllPushTokents(completionHandler:)` method.
```swift
class MyClass {
    func removeVoIPPushToken() {
        SendBirdCall.unregister(pushToken: myVoIPPushToken) { error in
        guard error == nil else { return }
        // Unregistered successfully
    }

    func removeAllOfVoIPPushTokens() {
        func unregisterAllPushTokens(completionHandler: ErrorHandler?) {
            guard error == nil else { return }
            // Unregistered all push tokens successfully
        }
    }
}
```
 
## Retrieve a call information
The local or remote user’s information is available via the `directCall.localUser` and `directCall.remoteUser` properties.

## Retrieve call history
A user’s call history is available via a `DirectCallLogListQuery` instance.

```swift
let params = DirectCallLogListQuery.Params()
let query = SendBirdCall.createDirectCallLogListQuery(with: params)
query.next(completionHandler: { callLogs, error in
    //
}
```

| Method           | Description                                                                                                                                                                                                                                                                                                       |
|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|next()            | Used to query call history from SendBirdCall server.                                                                                                                                                                                                                                                              |
|hasNext         | If true, there is more call history to be retrieved.                                                                                                                                                                                                                                                              |
|isLoading       | If true, call history is being retrieved from SendBirdCall server.                                                                                                                                                                                                                                                |
|limit      | Specifies the number of call logs to return at once.                                                                                                                                                                                                                                                              |
|myRole     | Returns call logs of the specified role. For example, the setMyRole(Callee) returns only the callee’s call logs.                                                                                                                                                                                                  |
|endResults | Returns the call logs for specified results. If you specify more than one result, they are processed as OR condition and all call logs corresponding with the specified end results will be returned. For example, [.noAnswer, .canceled], only the .noAnswer or .canceled call logs will be returned.|

## Additional information 
### call results
| EndResult        | Description                                                                                                            |
|------------------|------------------------------------------------------------------------------------------------------------------------|
| noAnswer            | The callee hasn’t either accepted or declined the call for a specific period of time.                              |
| canceled             | The caller has canceled the call before the callee accepts or declines.                                            |
| declined             | The callee has declined the call.                                                                                  |
| completed            | The call has ended by either the caller or callee after completion.                                                |
| timedOut            | SendBird server failed to establish a media session between the caller and callee within a specific period of time.|
| connectionLost      | Data streaming from either the caller or the callee has stopped due to a WebRTC connection issue while calling.    |
| dialFailed          | The dial() method call has failed.                                                                                 |
| acceptFailed        | The accept() method call has failed.                                                                               |
| otherDeviceAccepted | When the call is accepted on one of the callee’s devices, all the other devices will receive this call result.     |

## TroubleShootings
We don't want you to suffer [Karoshi](https://en.wikipedia.org/wiki/Karoshi). You can have a good night with following trouble shootings
### Library not loaded WebRTC.framework
If you face the following error, you can fix the issue by following the next step. 
```
dyld: Library not loaded: @rpath/WebRTC.framework/WebRTC
  Referenced from: /private/var/containers/Bundle/Application/{UUID}/{YOUR-APPLICATION}.app/Frameworks/SendBirdCalls.framework/SendBirdCalls
Reason: image not found
```
This is because of the lack of `Git Large File Storage`. The size of `SendBirdWebRTC.framework` is over 800MB (the size of `WebRTC` binary is about 849MB), but normal `Git` can't download a huge file. Your project may have downloaded a fake framework file. You need to install `git-lfs` to install the entire framework file. 
But since Cocoapods has already cached `SendBirdWebRTC.framework` without the entire binary, just installing` git-lfs` will not solve the problem. You can fix this by removing all the caches associated with `SendBirdWebRTC.framework`.

However, you couldn't solve the problem only by installing `git-lfs` since your Cocoapods already cached `SendBirdWebRTC.framework` without the whole binary. You can fix the issue by removing all of the caches related with `SendBirdWebRTC.framework`. Follow the next steps: 
1. Install `git-lfs`
```
// in the directory of your project
brew install git-lfs
```
2. Remove all of the caches
```
pod cache clean --all

rm -rf ~/Library/Caches/CocoaPods/*
rm -rf ~/Libaray/Developer/Xcode/DerivedData/*
```
If you don't want remove all of the caches that are not related with `SendBirdWebRTC.framework`, you can remove only `SendBirdWebRTC.framework`
```
pod cache clean 'SendBirdWebRTC' --all

rm -rf ~/Library/Caches/CocoaPods/Pods/Release/SendBirdWebRTC
rm -rf ~/Library/Caches/CocoaPods/Pods/Specs/Release/SendBirdWebRTC
rm -rf ~/Library/Developer/Xcode/DerivedData/{YOUR-PROJECT-NAME}-{UUID}
```
3. Re-setup Cocoapod
```
pod deintegrate
pod setup
```
4. Re-install Cocoapod
```
pod install
```
