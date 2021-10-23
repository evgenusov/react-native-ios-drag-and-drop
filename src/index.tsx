import { requireNativeComponent, ViewStyle } from 'react-native';

type IosDragAndDropProps = {
  color: string;
  style: ViewStyle;
};

export const IosDragAndDropViewManager = requireNativeComponent<IosDragAndDropProps>(
'IosDragAndDropView'
);

export default IosDragAndDropViewManager;
