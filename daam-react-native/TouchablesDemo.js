import React from 'react';

import { Button, Image, Text, TouchableHighlight, TouchableNativeFeedback, TouchableOpacity, TouchableWithoutFeedback, View } from 'react-native';

const styles = {
  container: {
    flex: 1,
    justifyContent: 'center',
    alignContent: 'center',
  },
  buttonContainer: {
    alignSelf: 'center',
    borderWidth: 1,
    borderRadius: 5,
    padding: 5,
  },
  logo: {
    width: 50, height: 50,
  },
}
export function TouchablesDemo() {

  return (
    <View style={styles.container}>

      <Button title="Press me" onPress={handlePress} />

      <TouchableOpacity onPress={handlePress} style={styles.buttonContainer}>
        <View>
          <Image
            style={styles.logo}
            source={require('./assets/daam.png')}
          />
        </View>
      </TouchableOpacity>


      <TouchableHighlight style={styles.buttonContainer}>
        <View>
          <Image
            style={styles.logo}
            source={require('./assets/daam.png')}
          />
        </View>
      </TouchableHighlight>

      <TouchableWithoutFeedback onPress={handlePress} style={styles.buttonContainer}>
        <View>
          <Image
            style={styles.logo}
            source={require('./assets/daam.png')}
          />
        </View>
      </TouchableWithoutFeedback>

      <TouchableNativeFeedback onPress={handlePress} style={styles.buttonContainer}>
        <View>
          <Image
            style={styles.logo}
            source={require('./assets/daam.png')}
          />
        </View>
      </TouchableNativeFeedback>

    </View>
  )

  function handlePress(e) {
    console.log(e.nativeEvent);
  }
}