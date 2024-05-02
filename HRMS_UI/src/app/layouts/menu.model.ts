// export interface MenuItem {
//   id?: number;
//   label?: any;
//   icon?: string;
//   link?: string;
//   subItems?: any;
//   isTitle?: boolean;
//   badge?: any;
//   parentId?: number;
//   isLayout?: boolean;
// }

export interface MenuItem {
  ScreenId: number;
  ScreenName: any;
  Icon: string;
  ScreenRoute: string;
  SubItems: any;
  IsTitle: boolean;
  Badge: any;
  ParentScreenId: number;
  IsLayout: boolean;
}