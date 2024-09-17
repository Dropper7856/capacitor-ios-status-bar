export interface IOSStatusBarPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  setStatusBarColor(options: { color: string }): Promise<void>
  setBottomBarColor(options: { color: string }): Promise<void>;
}
