program scoreboard;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, board,
  { you can add units after this }
  windows;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;

  AddFontResource('digital-7-mono.ttf');

  Application.CreateForm(TfrmBoard, frmBoard);

  Application.Run;

  RemoveFontResource('digital-7-mono.ttf');
end.

