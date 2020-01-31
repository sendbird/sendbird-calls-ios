# Change Log

### 0.6.10 (Jan 31, 2020)
* Deprecated `SendBirdCall.appId` setter.
* Deprecated `CallOption.isVideoCall` property.
* New initializer of `CallOption`, `init(isAudioEnabled:)`.
* Deprecated `SendBirdCall.dial(to:callOptions:completionHandler:)`.
* New method to dial `dial(to:isVideoCall:callOptions:completionHandler:)`.
* Increase stability.

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