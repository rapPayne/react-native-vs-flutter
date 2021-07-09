# react-native-vs-flutter
The exact same app developed in React Native and in Flutter. Allows an apples-to-apples comparison

## Accompanying Blog Posts

- [React Native or Flutter: Which should I choose? (Part 1)](https://archive.ph/rm5Hn)
- [React Native or Flutter: Which should I choose? (Part 2)](https://archive.ph/gDKv5)
- [React Native or Flutter: Which should I choose? (Part 3)](https://archive.ph/5UpkN)

## Comparison Metrics

### Lines of Code

![Screen Shot 2021-06-26 at 17 26 48](https://user-images.githubusercontent.com/1935696/123540221-46c21200-d73e-11eb-8558-e0b0378de5ea.png)

## Requirements
| Need          | Why we need it                     | Where to get it |
| ------------- | ---------------------------------- | ------------------------------------- |
| node and npm  | We run a RESTful API to serve data | [nodejs.org](http://nodejs.org/download) | 
| mongoDB       | For the movie database             | [mongoDB.com](https://www.mongodb.com/download-center#community) | 
| flutter tools | To run Flutter projects            | [flutter.io](https://flutter.dev/docs/get-started/install) |
| expo client   | To run React Native projects       | npm install --global expo@latest |

## To run the Flutter project
1. [Setup the database](#to-set-up-the-database)
2. [Run the node/Express web server](#to-run-the-node/express-web-server)
3. [Run the Flutter project](#to-run-the-flutter-project)

## To run the React Native project
1. [Setup the database](#to-set-up-the-database) (if you haven't already)
2. [Run the node/Express web server](#to-run-the-node/express-web-server)
3. [Run the React Native project](#to-run-the-react-native-project)

## To set up the database
1. Make sure a mongod server is running
2. Open a bash/Powershell/terminal window
3. cd to the "server" folder
4. npm install (You only need to do this once)
5. npm run setup
This will create a new mongoDB database called 'daam' and load it up
with realistic-looking data. You only need to do this one time, but feel free to do it as many times as you like to refresh the database.

## To run the node/Express web server
1. cd to the "server" folder
2. npm run server

## To run the Flutter project
1. Make sure a device is connected or an emulator is running
2. cd to the "daam_flutter" folder
3. flutter run
Or you can open the flutter project in your favorite IDE and run the project in the debugger. This has been tested in VS Code and Android Studio.

## To run the React Native project
1. Make sure a device is connected or an emulator is running
2. cd to the "daam-react-native" folder
3. npm run start
