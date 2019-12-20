# SendBirdCalls for iOS

## Introduction
SendBirdCalls is a new product enabling real-time calls between users registered within a SendBird application. SDKs are provided for JavaScript, Android, and iOS. Using any one of these, developers can quickly integrate calling functions into their own applications that will allow users to make and receive real-time voice calls on the SendBird platform.

## Functional Overview
When implemented, the **SendBirdCalls** SDK provides the framework to both make and receive one-to-one calls, referred to in the SDK as “direct calls” (analogous to “direct messages” / “DMs” in a messaging context). Direct calls are made when a caller identifies a user on the SendBird application and initializing a call request (dialing). The callee, with the SDK’s event handlers implemented, is notified on all authenticated devices, and can choose to accept the call.  If accepted, a network route is established between the caller and callee, and the direct call begins. Application administrators can then review call logs in the “Calls” section of the SendBird dashboard.

## SDK Prerequisites
* iOS 9.0 or later
* Swift 4 or later, Objective-C
* Installation of [Git Large File Storage](https://git-lfs.github.com)
* [WebRTC framework](https://github.com/sendbird/sendbird-webrtc-ios): it will be integrated by CocoaPods
* Real devices. **The iOS simulator is NOT supported**

## Install and configure the SDK
### CocoaPods
[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate SendBirdCalls into your Xcode project using CocoaPods, specify it in your `Podfile`:
```
pod 'SendBirdCalls'
pod 'SendBirdWebRTC', :git => 'https://github.com/sendbird/SendBird-WebRTC-iOS.git', :tag => 'v1.0' // supports bitcode
```
<br/>

### Background Mode
To support background operation, your VoIP app must have `background mode` enabled in the `Xcode Project > Signing&Capabilities` pane. Select the checkbox for Voice over IP. 
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

## Additional information: call results
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
