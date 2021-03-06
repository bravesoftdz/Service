unit BroadcastReceiver;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.Embarcadero,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.Helpers,
  Androidapi.JNI.JavaTypes,
  FMX.Types;

type
  TMyReceiver = class(TJavaLocal, JFMXBroadcastReceiverListener)
  public
    constructor Create;
    procedure onReceive(context: JContext; intent: JIntent); cdecl;
  end;

implementation

constructor TMyReceiver.Create;
begin
  inherited;
end;

procedure TMyReceiver.onReceive(context: JContext; intent: JIntent);
begin
  Log.d('Broadcast Received = ' +
        JStringToString(intent.getAction));
end;

end.
