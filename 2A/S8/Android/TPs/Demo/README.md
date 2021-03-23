# Teaching Samples

This is a collection of sample that are presented during the classes. They cover simple cases of Android programming, from Intents to the use of the Camera.

### HelloEnseeiht

A hello world kind of example used as introduction to Android programming to show the development environment and the simplest application that can be realized using the wizard of Android Studio.


## Intents

A collection of simple applications that show the use of intents in Android.

### Simple Camera Intent

A simple application to show how to take a picture using the defaulc Camera application. It does not more that showing a button that launch the intent for captureing a picture.

### ComposeMail

A simple application to write a mail using the implicit intent. It shows some of the fields like the address and the subject that the user can edit and forward to the default email client on the device. It requires that the email client is set-up.

### CameraIntentWithResult

A variant of the simple camera application that retrieves the picture taken by default Camera application. It show how the result can be propagated back to the callee through a result intent. 

### IntentDemo

An application that demonstrates the various use of the intents, implicit Vs explicit intents, with or without result sent back to the callee.

### PlanetIntent

This is the application used in IntentDemo for responding to a specific intent.


## Android Camera

Some sample application that shows the use of the camera both with enhanced use of intents and managing the camera direcly inside the main application.

### CameraIntentWithResult2

A variant of the simple camera application that better handle the result from the default Camera application, loading the whole picture taken instead of just a small thumbnail.

### CameraSimplePreview

A simple Camera application that show the camera flow and allows to save a picture.

## JNI

Some samples to explain how JNI works

### Hello JNI!

The classical Hello World application in JNI sauce printing out the message using a native method.

### NDKDemo

A sample application that shows how to use either Java or JNI to compute the square root of a given number using an iteative method (Babylonian method).