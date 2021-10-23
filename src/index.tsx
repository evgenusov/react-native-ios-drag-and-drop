import { requireNativeComponent, ViewStyle } from 'react-native';

type IosDragAndDropProps = {
  color: string;
  enabled: boolean;
  onDrag: (event: any) => void;
  style: ViewStyle;
};

export const IosDragAndDropViewManager = requireNativeComponent<IosDragAndDropProps>(
'IosDragAndDropView'
);

export default IosDragAndDropViewManager;
