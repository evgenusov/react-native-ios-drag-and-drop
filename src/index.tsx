import {
  NativeSyntheticEvent,
  requireNativeComponent,
  ViewStyle,
} from 'react-native';

export type DropEvent = {
  url: string;
  width: number;
  height: number;
  size: number;
  mime: string;
};

type DragAndDropViewProps = {
  enabled: boolean;
  onDrop: (event: NativeSyntheticEvent<DropEvent>) => void;
  style: ViewStyle;
};

export const DragAndDropView =
  requireNativeComponent<DragAndDropViewProps>('IosDragAndDropView');
