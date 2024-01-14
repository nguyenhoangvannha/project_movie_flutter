# project_movie_flutter

## Download
[Lastest release](https://github.com/nguyenhoangvannha/project_movie_flutter/releases/tag/v1.0)

## Screenshot
| | | |
|:-------------------------:|:-------------------------:|:-------------------------:|
|<img width="1604" src="readme/Screenshot1.jpg">   |  <img width="1604" src="readme/Screenshot2.jpg">|<img width="1604" src="readme/Screenshot3.jpg">|
|<img width="1604" src="readme/Screenshot4.jpg">  |  <img width="1604" src="readme/Screenshot5.jpg">|<img width="1604" src="readme/Screenshot6.jpg">|
|<img width="1604" src="readme/Screenshot7.jpg">  |  <img width="1604" src="readme/Screenshot8.jpg">|<img width="1604" src="readme/Screenshot9.jpg">|

## Architecture
![Clean-Architecture-Flutter-Diagram](readme/Clean-Architecture-Flutter-Diagram.png "Clean-Architecture-Flutter-Diagram") 
---
[Image Source](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/)

## Build apk
flutter pub get

flutter build apk --split-per-abi

## To gererate code
1. flutter packages pub run build_runner clean
2. flutter packages pub run build_runner build //watch (--delete-conflicting-outputs)
- flutter packages pub run build_runner build --delete-conflicting-outputs
