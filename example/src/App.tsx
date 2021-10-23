import * as React from 'react';
import { useState } from 'react';

import { StyleSheet, Text, Image, NativeSyntheticEvent } from 'react-native';
import { DragAndDropView, DropEvent } from 'react-native-ios-drag-and-drop';

export default function App() {
  const [draggedImage, SetDraggedImage] = useState<DropEvent | null>();

  const onDrop = ({ nativeEvent }: NativeSyntheticEvent<DropEvent>) => {
    SetDraggedImage(nativeEvent);
  };

  return (
    <DragAndDropView style={styles.box} enabled={true} onDrop={onDrop}>
      <Text>Drag image here</Text>
      {draggedImage && (
        <>
          <Image
            resizeMode="contain"
            source={{
              uri: draggedImage.url,
            }}
            style={{
              width: 300,
              height: 400,
            }}
          />
          <Text>Data: {JSON.stringify(draggedImage)}</Text>
        </>
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
