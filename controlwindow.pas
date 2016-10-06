unit controlwindow;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  StdCtrls, board, windows;

type

  { TfrmControl }

  TfrmControl = class(TForm)
    btnShowBoard: TSpeedButton;
    procedure btnShowBoardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmControl: TfrmControl;

implementation

{$R *.lfm}

{ TfrmControl }

procedure TfrmControl.btnShowBoardClick(Sender: TObject);
var
  boardScreen: Integer;
  i: Integer;
begin
  //if Screen.MonitorCount < 2 then
  //begin
  //  ShowMessage('Error: Second monitor not found');
  //  exit;
  //end;

  // Find monitor of control window
  // Show scoreboard on other monitor
  //for i := 0 to Screen.MonitorCount - 1 do
  //begin
  //  if (Top >= Screen.Monitors[i].Top)
  //  and (Top < Screen.Monitors[i].Top + Screen.Monitors[i].Height)
  //  and (Left >= Screen.Monitors[i].Left)
  //  and (Left < Screen.Monitors[i].Left + Screen.Monitors[i].Width) then
  //  begin
  //    boardScreen := (i + 1) mod Screen.MonitorCount;
  //    frmBoard.Top := Screen.Monitors[boardScreen].Top;
  //    frmBoard.Left := Screen.Monitors[boardScreen].Left;
  //    break;
  //  end;
  //end;

  frmBoard.Show;
  frmBoard.BorderStyle := bsSizeable;
  //frmBoard.WindowState := wsMaximized;
  frmBoard.ReAlign;
end;

procedure TfrmControl.FormCreate(Sender: TObject);
begin
  AddFontResource('digital-7-mono.ttf');
  SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
  //Label1.Font.Name := 'Digital-7 Mono';
end;

procedure TfrmControl.FormDestroy(Sender: TObject);
begin
  RemoveFontResource('digital-7-mono.ttf');
  SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
end;

end.

