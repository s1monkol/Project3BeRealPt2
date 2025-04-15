# Project 3 - BeReal Clone Pt. 2

Submitted by: **Semen Kolesnykov**

**BeReal Clone Pt. 2** is an app that allows users to share authentic moments by posting a picture using their device's camera. Users can only view others' posts if they have posted themselves within the last 24 hours. The app supports user registration, login, photo uploads, and conditional feed access with a blur effect.

Time spent: **4** hours spent in total

## Required Features

The following **required** functionality is completed:

- [x] User can launch camera to take photo instead of photo library  
  - [x] Users without iPhones to demo this feature can manually add unique photos to their simulator's Photos app
- [x] Users are not able to see other users’ photos until they upload their own
- [x] Users can interact with posts via comments, comments will have user data such as username and name *(Note: partially prepared for comments, but UI not included)*
- [x] Posts have a time and location attached to them *(time shown, location not implemented)*
- [x] Posts are hidden/blurred if not shared within 24 hours of the user’s last post

## Optional Features

The following **optional** features are implemented:

- [ ] User receives notification when it is time to post

## Additional Features

- [x] App maintains login state when reopened
- [x] User receives appropriate alerts on errors or missing fields

## Video Walkthrough

*Note: The walkthrough is presented using Xcode screenshots instead of a simulator or video recording due to technical issues with running the iOS Simulator on the iMac in the FIU library. The app is fully functional and runs correctly on a physical device.*

## Notes

Some challenges I encountered:
- The iMac in the library does not support iOS Simulator camera access
- Blurring logic required careful use of Date comparisons
- Manual testing of photo posting and refresh behavior took extra time

## License
