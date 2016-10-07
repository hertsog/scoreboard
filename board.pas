unit board;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TfrmBoard }

  TfrmBoard = class(TForm)
    lblFaults: TLabel;
    lblHomeFaults: TLabel;
    lblHomeTimeouts: TLabel;
    lblHomePossess: TLabel;
    lblVisitorFaults: TLabel;
    lblTimeouts: TLabel;
    lblPossess: TLabel;
    lblTimer: TLabel;
    lblHomescore: TLabel;
    lblHome: TLabel;
    lblVisitorTimeouts: TLabel;
    lblVisitorscore: TLabel;
    lblVisitor: TLabel;
    lblShotclock: TLabel;
    lblVisitorPossess: TLabel;
    shpShotclock: TShape;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    { private declarations }
  public
    { public declarations }
    procedure ReAlign;
  end;

var
  frmBoard: TfrmBoard;

implementation

{$R *.lfm}

{ TfrmBoard }

procedure TfrmBoard.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmBoard.ReAlign;
begin
  // Shotclock box
  shpShotclock.Height := trunc(frmBoard.Height * 0.4);
  shpShotclock.Width := shpShotclock.Height;
  shpShotclock.Top := 8;
  shpShotclock.Left := (frmBoard.Width div 2) - (shpShotclock.Width div 2);

  // Shotclock
  lblShotclock.Top := 10;
  lblShotclock.Left := shpShotclock.Left + 2;
  lblShotclock.Height := shpShotclock.Height - 4;
  lblShotclock.Width := shpShotclock.Width - 4;

  // Home label
  lblHome.Top := 0;
  lblHome.Left := 8;
  lblHome.Width := shpShotclock.Left - 16;
  lblHome.Height := shpShotclock.Height div 2;

  // Visitor label
  lblVisitor.Top := 0;
  lblVisitor.Left := shpShotclock.Left + shpShotclock.Width + 8;
  lblVisitor.Width := shpShotclock.Left - 16;
  lblVisitor.Height := shpShotclock.Height div 2;

  // Home score
  lblHomescore.Top := shpShotclock.Height div 2;
  lblHomescore.Left := 8;
  lblHomescore.Width := Trunc((shpShotclock.Left - 16) * 0.7);
  lblHomescore.Height := shpShotclock.Height div 2;

  // Visitor score
  lblVisitorscore.Top := shpShotclock.Height div 2;
  lblVisitorscore.Left := shpShotclock.Left + shpShotclock.Width + 8;
  lblVisitorscore.Width := Trunc((shpShotclock.Left - 16) * 0.7);
  lblVisitorscore.Height := shpShotclock.Height div 2;

  // Game timer
  lblTimer.Top := shpShotclock.Top + shpShotclock.Height + 8;
  lblTimer.Left := shpShotclock.Left;
  lblTimer.Width := shpShotclock.Width;
  lblTimer.Height := trunc(frmBoard.Height * 0.2);

  // Faults label
  lblFaults.Top := trunc(frmBoard.Height * 0.6);
  lblFaults.Left := shpShotclock.Left;
  lblFaults.Width := shpShotclock.Width;
  lblFaults.Height := trunc(frmBoard.Height * 0.13);

  // Home faults
  lblHomeFaults.Top := trunc(frmBoard.Height * 0.6);
  lblHomeFaults.Left := 0;
  lblHomeFaults.Width := trunc(shpShotclock.Left * 0.8);
  lblHomeFaults.Height := trunc(frmBoard.Height * 0.13);

  // Visitor faults
  lblVisitorFaults.Top := trunc(frmBoard.Height * 0.6);
  lblVisitorFaults.Left := trunc(shpShotclock.Left * 1.2 + shpShotclock.Width);
  lblVisitorFaults.Width := trunc(shpShotclock.Left * 0.8);
  lblVisitorFaults.Height := trunc(frmBoard.Height * 0.13);

  // Timeouts label
  lblTimeouts.Top := trunc(frmBoard.Height * 0.73);
  lblTimeouts.Left := shpShotclock.Left;
  lblTimeouts.Width := shpShotclock.Width;
  lblTimeouts.Height := trunc(frmBoard.Height * 0.13);

  // Home timeouts
  lblHomeTimeouts.Top := trunc(frmBoard.Height * 0.73);
  lblHomeTimeouts.Left := 0;
  lblHomeTimeouts.Width := trunc(shpShotclock.Left * 0.8);
  lblHomeTimeouts.Height := trunc(frmBoard.Height * 0.13);

  // Visitor timeouts
  lblVisitorTimeouts.Top := trunc(frmBoard.Height * 0.73);
  lblVisitorTimeouts.Left := trunc(shpShotclock.Left * 1.2 + shpShotclock.Width);
  lblVisitorTimeouts.Width := trunc(shpShotclock.Left * 0.8);
  lblVisitorTimeouts.Height := trunc(frmBoard.Height * 0.13);

  // Possession label
  lblPossess.Top := trunc(frmBoard.Height * 0.86);
  lblPossess.Left := shpShotclock.Left;
  lblPossess.Width := shpShotclock.Width;
  lblPossess.Height := trunc(frmBoard.Height * 0.13);

  // Home possession
  lblHomePossess.Top := trunc(frmBoard.Height * 0.86);
  lblHomePossess.Left := 0;
  lblHomePossess.Width := trunc(shpShotclock.Left * 0.8);
  lblHomePossess.Height := trunc(frmBoard.Height * 0.13);

  // Visitor possession
  lblVisitorPossess.Top := trunc(frmBoard.Height * 0.86);
  lblVisitorPossess.Left := trunc(shpShotclock.Left * 1.2 + shpShotclock.Width);
  lblVisitorPossess.Width := trunc(shpShotclock.Left * 0.8);
  lblVisitorPossess.Height := trunc(frmBoard.Height * 0.13);
end;

end.

