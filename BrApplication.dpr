program BrApplication;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  BroadcastReceiver in 'BroadcastReceiver.pas',
  Unit3 in 'Unit3.pas' {DM: TAndroidService};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
