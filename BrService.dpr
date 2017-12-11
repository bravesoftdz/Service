program BrService;

uses
  System.Android.ServiceApplication,
  Unit3 in 'Unit3.pas' {DM: TAndroidService};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
