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
  Application.CreateForm(TfrmBoard, frmBoard);

  AddFontResource('digital-7-mono.ttf');
  SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);

  Application.Run;

  RemoveFontResource('digital-7-mono.ttf');
  SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
end.

