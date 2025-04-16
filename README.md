# Project 3 - BeReal Clone Pt. 2

Submitted by: **Semen Kolesnykov**

**BeReal Clone Pt. 2** is an iOS app that allows users to post a photo and see others’ posts only after sharing their own within the last 24 hours. The app supports login, camera photo uploads, and conditional access to the shared feed. Built using Parse and SwiftUI/UIKit hybrid.

Time spent: **~4 hours**

---

## ✅ Required Features

- [x] User can launch camera to take photo instead of photo library  
  - [x] Users without iPhones to demo this feature can manually add unique photos to their simulator's Photos app
- [x] Users are not able to see other users’ photos until they upload their own
- [x] Users can interact with posts via comments, comments will have user data such as username and name *(UI optional/partially implemented)*
- [x] Posts have a time and location attached *(time displayed, location not shown)*
- [x] Posts are hidden/blurred if not shared within 24 hours of user’s last post

---

## 🌟 Optional Features

- [ ] User receives notification when it is time to post

---

## 🚀 Additional Features

- [x] App maintains login state when reopened
- [x] User receives appropriate alerts on errors or missing fields

---

## 🎥 Walkthrough

> ⚠️ **Note:** This walkthrough is shown using screenshots and GIF because iMacs at the FIU library could not run the iOS simulator due to outdated and underpowered hardware. Third-party screen recorders like OBS also could not be installed.
>  
> The app is fully functional on a physical device.

![Walkthrough](https://github.com/s1monkol/Progect2BerealClone/blob/e30ebf0c634c72232df3e98fc88277c6e70fe680/berealpt1.gif)

---

## 📝 Notes

Challenges faced:
- Library computers don’t support iOS Simulator camera
- 24-hour logic needed careful date/time comparison
- Couldn’t test notifications due to limited environment

---

## 📄 License
