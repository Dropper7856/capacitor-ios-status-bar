export interface IOSStatusBarPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
