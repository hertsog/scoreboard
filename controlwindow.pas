unit controlwindow;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  board;

type

  { TfrmControl }

  TfrmControl = class(TForm)
    btnShowBoard: TSpeedButton;
    procedure btnShowBoardClick(Sender: TObject);
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
  if Screen.MonitorCount < 2 then
  begin
    ShowMessage('Error: Second monitor not found');
    exit;
  end;

  // Find monitor of control window
  // Show scoreboard on other monitor
  for i := 0 to Screen.MonitorCount - 1 do
  begin
    if (Top >= Screen.Monitors[i].Top)
    and (Top < Screen.Monitors[i].Top + Screen.Monitors[i].Height)
    and (Left >= Screen.Monitors[i].Left)
    and (Left < Screen.Monitors[i].Left + Screen.Monitors[i].Width) then
    begin
      boardScreen := (i + 1) mod Screen.MonitorCount;
      frmBoard.Top := Screen.Monitors[boardScreen].Top;
      frmBoard.Left := Screen.Monitors[boardScreen].Left;
      frmBoard.Show;
      frmBoard.WindowState := wsMaximized;
      break;
    end;
  end;

end;

end.

