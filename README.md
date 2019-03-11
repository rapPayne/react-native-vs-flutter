# react-native-vs-flutter
The exact same app developed in React Native and in Flutter. Allows an apples-to-apples comparison

## To run the Flutter project
1. Setup the database
2. Run the node/Express web server
3. Run the Flutter project

## To run the React Native project
1. Setup the database (if you haven't already)
2. Run the node/Express web server
3. Run the React Native project

## To set up the database
1. Make sure a mongod server is running
2. Open a bash/Powershell/terminal window
3. cd to the "server" folder
4. npm run setup
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
