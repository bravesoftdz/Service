unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Androidapi.JNIBridge,
  Androidapi.JNI.Embarcadero, Androidapi.Helpers, BroadcastReceiver,
  Androidapi.JNI.JavaTypes, Androidapi.JNI.GraphicsContentViewText;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FMyListener: TMyReceiver;
    FBroadcastReceiver: JFMXBroadcastReceiver;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
var
  Filter: JIntentFilter;
begin
  FMyListener := TMyReceiver.Create;
  FBroadcastReceiver := TJFMXBroadcastReceiver.JavaClass.init(FMyListener);
  Filter := TJIntentFilter.JavaClass.init;
  Filter.addAction(TJIntent.JavaClass.ACTION_VIEW);
  TAndroidHelper.context.getApplicationContext.registerReceiver(FBroadcastReceiver, Filter);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  TAndroidHelper.context.getApplicationContext.unregisterReceiver(FBroadcastReceiver);
end;

end.
