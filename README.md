# react-native-ios-drag-and-drop

Implementation iOS drag and drop feature for React Native

## Installation

```sh
yarn add react-native-ios-drag-and-drop
```

## Usage

```tsx
import { DragAndDropView, DropEvent } from 'react-native-ios-drag-and-drop';

// Add View
<DragAndDropView style={...} enabled={true} onDrop={onDrop}>
...
</DragAndDropView>

// Define onDrop callback


const onDrop = ({ nativeEvent }: NativeSyntheticEvent<DropEvent>) => {
    ...
};

```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
