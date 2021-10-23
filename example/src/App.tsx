import * as React from 'react';
import { useState } from 'react';

import { StyleSheet, Text, Image } from 'react-native';
import DragAndDropView from 'react-native-ios-drag-and-drop';

export default function App() {
  const [draggedImage, SetDraggedImage] = useState();


  const onDrag = ({nativeEvent}) => {
    SetDraggedImage(nativeEvent.url);
  }


  return (
    <DragAndDropView style={styles.box} enabled={true} onDrag={onDrag}>
      <Text>Drag image here</Text>
      {draggedImage && (
        <Image source={{
          uri: draggedImage
        }} style={{
          width: 300,
          height: 300,
        }}/>
      )}
    </DragAndDropView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: '100%',
    height: '100%',
    justifyContent: 'center',
    alignItems: 'center',
  },
});
