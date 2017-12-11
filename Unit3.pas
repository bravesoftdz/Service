unit Unit3;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Android.Service,
  AndroidApi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Os,
  Androidapi.Helpers;

type
  TDM = class(TAndroidService)
    function AndroidServiceStartCommand(const Sender: TObject;
      const Intent: JIntent; Flags, StartId: Integer): Integer;
    procedure AndroidServiceCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses
  Androidapi.JNI.App;

procedure TDM.AndroidServiceCreate(Sender: TObject);
var
  intent: JIntent;
begin
  intent:= TJIntent.Create;
  intent.setType(StringToJString('text/pas'));
  intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
  intent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString('Hello from service!'));
  TAndroidHelper.Context.sendBroadcast(intent);
end;

function TDM.AndroidServiceStartCommand(const Sender: TObject;
  const Intent: JIntent; Flags, StartId: Integer): Integer;
begin
  Result := TJService.JavaClass.START_NOT_STICKY;
end;

end.
