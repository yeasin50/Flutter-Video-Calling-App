# webRTC

###  <font color="yellow"> Flutter: 1.22.6</font> &nbsp; <font color="pink"> Dart: 2.10.5</font> 
* ### [``flutter_webrtc: 0.5.8``](https://pub.dev/packages/flutter_webrtc)
* ###  [`flutter_foreground_plugin: ^0.6.0`](https://pub.dev/packages/flutter_foreground_plugin)
* ### [`permission_handler: ^5.1.0+2`](https://pub.dev/packages/permission_handler) ``for double check``

* ### [`sdp_transform`](https://pub.dev/packages/sdp_transform)   
  

It's better to visit [official doc.](https://pub.dev/packages/flutter_webrtc)  

android:minSdkVersion="23" for webRTC forground service

## `Provide your own width, height and frame rate here`  
if it's larger than your screen , it wount showUP
    

[Breakdown of an SDP (Session Description Protocol)](https://webrtchacks.com/sdp-anatomy/)


---- 
# work flow 
* click Offer on 1st tab
  * get token and paste on 2nd tab and press set remote desc
* click answer on 2nd tab and copy sdp
  * copy and paste on 1st then set remote description
  * click answer on 2nd tab copy and paste 
  * set remote descript on 1st tab 
  * 
  * next add candidate from 2nd tab
  * copy candidate from 2nd tab
  * paste on 1st tab and set as candidate 
  * congo 

--------



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
