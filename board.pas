unit board;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, LCLType, Buttons, strutils, mmsystem, math;

type

  { TfrmBoard }

  TfrmBoard = class(TForm)
    btnHomeFaultsM1: TSpeedButton;
    btnShotclockRunning: TSpeedButton;
    btnVisitorPossess: TSpeedButton;
    btnHomeTimeoutsM1: TSpeedButton;
    btnHomePossess: TSpeedButton;
    btnHomeTimeoutsP1: TSpeedButton;
    btnVisitorFaultsM1: TSpeedButton;
    btnHomeFaultsP1: TSpeedButton;
    btnVisitorTimeoutsM1: TSpeedButton;
    btnVisitorFaultsP1: TSpeedButton;
    btnShotclockP1: TSpeedButton;
    btnReset24: TSpeedButton;
    btnReset14: TSpeedButton;
    btnReset1000: TSpeedButton;
    btnShotclockM1: TSpeedButton;
    btnTimerP1: TSpeedButton;
    btnTimerM1: TSpeedButton;
    btnVisitorTimeoutsP1: TSpeedButton;
    btnVisitorM1: TSpeedButton;
    btnHomeP3: TSpeedButton;
    btnHomeP1: TSpeedButton;
    btnHomeM1: TSpeedButton;
    btnVisitorP1: TSpeedButton;
    btnVisitorP2: TSpeedButton;
    btnVisitorP3: TSpeedButton;
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
    btnHomeP2: TSpeedButton;
    tmrTicker: TTimer;
    procedure btnHomeFaultsM1Click(Sender: TObject);
    procedure btnHomeFaultsP1Click(Sender: TObject);
    procedure btnHomeM1Click(Sender: TObject);
    procedure btnHomeP1Click(Sender: TObject);
    procedure btnHomeP2Click(Sender: TObject);
    procedure btnHomeP3Click(Sender: TObject);
    procedure btnHomePossessClick(Sender: TObject);
    procedure btnHomeTimeoutsM1Click(Sender: TObject);
    procedure btnHomeTimeoutsP1Click(Sender: TObject);
    procedure btnReset1000Click(Sender: TObject);
    procedure btnReset14Click(Sender: TObject);
    procedure btnReset24Click(Sender: TObject);
    procedure btnShotclockM1Click(Sender: TObject);
    procedure btnShotclockP1Click(Sender: TObject);
    procedure btnShotclockRunningClick(Sender: TObject);
    procedure btnTimerM1Click(Sender: TObject);
    procedure btnTimerP1Click(Sender: TObject);
    procedure btnVisitorFaultsM1Click(Sender: TObject);
    procedure btnVisitorFaultsP1Click(Sender: TObject);
    procedure btnVisitorM1Click(Sender: TObject);
    procedure btnVisitorP1Click(Sender: TObject);
    procedure btnVisitorP2Click(Sender: TObject);
    procedure btnVisitorP3Click(Sender: TObject);
    procedure btnVisitorPossessClick(Sender: TObject);
    procedure btnVisitorTimeoutsM1Click(Sender: TObject);
    procedure btnVisitorTimeoutsP1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmrTickerTimer(Sender: TObject);
  private
    { private declarations }
    HomeScore, VisitorScore: Integer;
    ShotClockTime, GameTime: Integer;
    HomeFaults, VisitorFaults: Integer;
    HomeTimeouts, VisitorTimeouts: Integer;
    TimeRunning, HomePossess: boolean;
  public
    { public declarations }
    procedure ReAlign;
    procedure InitVars;
    procedure UpdateBoard(Form: TfrmBoard);
    function RoundUp(f: Double): Integer;
    procedure CloseApplication;
  end;

var
  frmBoard: TfrmBoard;
  frmOtherBoard: TfrmBoard;

implementation

{$R *.lfm}

{ TfrmBoard }

procedure TfrmBoard.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  // To avoid segfault error
  if Tag = 0 then
    CloseApplication
  else
    Application.Terminate;
end;

procedure TfrmBoard.btnHomeP1Click(Sender: TObject);
var
  Key: Word = 49;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnHomeM1Click(Sender: TObject);
var
  Key: Word = 90;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnHomeFaultsP1Click(Sender: TObject);
var
  Key: Word = 51;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnHomeFaultsM1Click(Sender: TObject);
var
  Key: Word = 69;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnHomeP2Click(Sender: TObject);
var
  Key: Word = 81;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnHomeP3Click(Sender: TObject);
var
  Key: Word = 65;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnHomePossessClick(Sender: TObject);
var
  Key: Word = 37;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnHomeTimeoutsM1Click(Sender: TObject);
var
  Key: Word = 67;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnHomeTimeoutsP1Click(Sender: TObject);
var
  Key: Word = 68;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnReset1000Click(Sender: TObject);
var
  Key: Word = 112;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnReset14Click(Sender: TObject);
var
  Key: Word = 40;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnReset24Click(Sender: TObject);
var
  Key: Word = 38;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnShotclockM1Click(Sender: TObject);
var
  Key: Word = 114;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnShotclockP1Click(Sender: TObject);
var
  Key: Word = 113;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnShotclockRunningClick(Sender: TObject);
var
  Key: Word = 32;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnTimerM1Click(Sender: TObject);
var
  Key: Word = 116;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnTimerP1Click(Sender: TObject);
var
  Key: Word = 115;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnVisitorFaultsM1Click(Sender: TObject);
var
  Key: Word = 85;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnVisitorFaultsP1Click(Sender: TObject);
var
  Key: Word = 56;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnVisitorM1Click(Sender: TObject);
var
  Key: Word = 77;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnVisitorP1Click(Sender: TObject);
var
  Key: Word = 48;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnVisitorP2Click(Sender: TObject);
var
  Key: Word = 79;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnVisitorP3Click(Sender: TObject);
var
  Key: Word = 75;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnVisitorPossessClick(Sender: TObject);
var
  Key: Word = 39;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnVisitorTimeoutsM1Click(Sender: TObject);
var
  Key: Word = 66;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.btnVisitorTimeoutsP1Click(Sender: TObject);
var
  Key: Word = 72;
begin
  FormKeyDown(Self, Key, []);
end;

procedure TfrmBoard.FormCreate(Sender: TObject);
begin
  Font.Name := 'Digital-7 Mono';
  InitVars;
end;

procedure TfrmBoard.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Tag = 1 then
    exit;
  case (Key) of
    VK_ESCAPE: CloseApplication;

    49: HomeScore := HomeScore + 1;
    81: HomeScore := HomeScore + 2;
    65: HomeScore := HomeScore + 3;
    90: HomeScore := Max(HomeScore - 1, 0);

    32: TimeRunning := not TimeRunning;

    113: ShotClockTime := ShotClockTime + 10;
    114: ShotClockTime := Max(ShotClockTime - 10, 0);

    115: GameTime := GameTime + 10;
    116: GameTime := Max(GameTime - 10, 0);

    48: VisitorScore := VisitorScore + 1;
    79: VisitorScore := VisitorScore + 2;
    75: VisitorScore := VisitorScore + 3;
    77: VisitorScore := Max(VisitorScore - 1, 0);

    38: ShotClockTime := 240;
    40: ShotClockTime := 140;

    112: GameTime := 6000;

    37: HomePossess := True;
    39: HomePossess := False;

    51: HomeFaults := HomeFaults + 1;
    69: HomeFaults := Max(HomeFaults - 1, 0);

    56: VisitorFaults := VisitorFaults + 1;
    85: VisitorFaults := Max(VisitorFaults - 1, 0);

    68: HomeTimeouts := HomeTimeouts + 1;
    67: HomeTimeouts := Max(HomeTimeouts - 1, 0);

    72: VisitorTimeouts := VisitorTimeouts + 1;
    66: VisitorTimeouts := Max(VisitorTimeouts - 1, 0);
  end;

  tmrTicker.Enabled := TimeRunning;
  UpdateBoard(Self);
  if frmOtherBoard <> nil then
    UpdateBoard(frmOtherBoard);
end;

procedure TfrmBoard.FormResize(Sender: TObject);
begin
  ReAlign;
end;

procedure TfrmBoard.FormShow(Sender: TObject);
var
  i, boardScreen: Integer;
begin
  if (Tag = 0) then
  begin
    UpdateBoard(Self);
    BorderStyle := bsSizeable;
    if (Screen.MonitorCount > 1) then
    begin
      frmOtherBoard := TfrmBoard.Create(nil);
      frmOtherBoard.Tag := 1;

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
          frmOtherBoard.Show;
          frmOtherBoard.Top := Screen.Monitors[boardScreen].Top;
          frmOtherBoard.Left := Screen.Monitors[boardScreen].Left;
          break;
        end;
      end;

      frmOtherBoard.WindowState := wsMaximized;
      UpdateBoard(frmOtherBoard);
    end;
  end;

  if Tag = 1 then
  begin
    btnHomeFaultsM1.Hide;
    btnShotclockRunning.Hide;
    btnVisitorPossess.Hide;
    btnHomeTimeoutsM1.Hide;
    btnHomePossess.Hide;
    btnHomeTimeoutsP1.Hide;
    btnVisitorFaultsM1.Hide;
    btnHomeFaultsP1.Hide;
    btnVisitorTimeoutsM1.Hide;
    btnVisitorFaultsP1.Hide;
    btnShotclockP1.Hide;
    btnReset24.Hide;
    btnReset14.Hide;
    btnReset1000.Hide;
    btnShotclockM1.Hide;
    btnTimerP1.Hide;
    btnTimerM1.Hide;
    btnVisitorTimeoutsP1.Hide;
    btnVisitorM1.Hide;
    btnHomeP3.Hide;
    btnHomeP1.Hide;
    btnHomeM1.Hide;
    btnVisitorP1.Hide;
    btnVisitorP2.Hide;
    btnVisitorP3.Hide;
    btnHomeP2.Hide;
  end;
end;

procedure TfrmBoard.tmrTickerTimer(Sender: TObject);
begin
  ShotClockTime := Max(ShotClockTime - 1, 0);
  GameTime := Max(GameTime - 1, 0);

  if (ShotClockTime = 0) or (GameTime = 0) then
  begin
    sndPlaySound('buzzer.wav', SND_ASYNC or SND_NODEFAULT);
    TimeRunning := False;
    tmrTicker.Enabled := False;
  end;

  UpdateBoard(Self);
  if frmOtherBoard <> nil then
    UpdateBoard(frmOtherBoard);
end;

procedure TfrmBoard.ReAlign;
begin
  // Shotclock box
  shpShotclock.Height := trunc(Height * 0.4);
  shpShotclock.Width := shpShotclock.Height;
  shpShotclock.Top := 8;
  shpShotclock.Left := (Width div 2) - (shpShotclock.Width div 2);

  // Shotclock +1 button
  btnShotclockP1.Top := shpShotclock.Top + trunc(shpShotclock.Height * 0.75);
  btnShotclockP1.Left := shpShotclock.Left + shpShotclock.Width;
  btnShotclockP1.Width := trunc(shpShotclock.Height * 0.32);
  btnShotclockP1.Height := trunc(shpShotclock.Height * 0.125);
  btnShotclockP1.Font.Height := btnShotclockP1.Height;

  // Shotclock -1 button
  btnShotclockM1.Top := shpShotclock.Top + trunc(shpShotclock.Height * 0.875);
  btnShotclockM1.Left := shpShotclock.Left + shpShotclock.Width;
  btnShotclockM1.Width := trunc(shpShotclock.Height * 0.32);
  btnShotclockM1.Height := trunc(shpShotclock.Height * 0.125);
  btnShotclockM1.Font.Height := btnShotclockM1.Height;

  // Shotclock running button
  btnShotclockRunning.Top := shpShotclock.Top + trunc(shpShotclock.Height * 0.875);
  btnShotclockRunning.Left := shpShotclock.Left + 2;
  btnShotclockRunning.Width := shpShotclock.Width - 4;
  btnShotclockRunning.Height := trunc(shpShotclock.Height * 0.125) - 2;
  btnShotclockRunning.Font.Height := btnShotclockRunning.Height;

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

  // Home score +1 button
  btnHomeP1.Top := lblHomescore.Top;
  btnHomeP1.Left := 8;
  btnHomeP1.Width := lblHomescore.Height div 2;
  btnHomeP1.Height := btnHomeP1.Width div 2;
  btnHomeP1.Font.Height := btnHomeP1.Height;

  // Home score +2 button
  btnHomeP2.Top := lblHomescore.Top + btnHomeP1.Height;
  btnHomeP2.Left := 8;
  btnHomeP2.Width := lblHomescore.Height div 2;
  btnHomeP2.Height := btnHomeP2.Width div 2;
  btnHomeP2.Font.Height := btnHomeP2.Height;

  // Home score +3 button
  btnHomeP3.Top := lblHomescore.Top + btnHomeP1.Height * 2;
  btnHomeP3.Left := 8;
  btnHomeP3.Width := lblHomescore.Height div 2;
  btnHomeP3.Height := btnHomeP3.Width div 2;
  btnHomeP3.Font.Height := btnHomeP3.Height;

  // Home score -1 button
  btnHomeM1.Top := lblHomescore.Top + btnHomeP1.Height * 3;
  btnHomeM1.Left := 8;
  btnHomeM1.Width := lblHomescore.Height div 2;
  btnHomeM1.Height := btnHomeM1.Width div 2;
  btnHomeM1.Font.Height := btnHomeM1.Height;

  // Visitor score
  lblVisitorscore.Top := shpShotclock.Height div 2;
  lblVisitorscore.Left := shpShotclock.Left + shpShotclock.Width + 8;
  lblVisitorscore.Width := Trunc((shpShotclock.Left - 16) * 0.7);
  lblVisitorscore.Height := shpShotclock.Height div 2;

  // Visitor score +1 button
  btnVisitorP1.Top := lblVisitorscore.Top;
  btnVisitorP1.Left := Width - (lblVisitorscore.Height div 2) - 8;
  btnVisitorP1.Width := lblVisitorscore.Height div 2;
  btnVisitorP1.Height := btnVisitorP1.Width div 2;
  btnVisitorP1.Font.Height := btnVisitorP1.Height;

  // Visitor score +2 button
  btnVisitorP2.Top := lblVisitorscore.Top + btnVisitorP1.Height;
  btnVisitorP2.Left := Width - (lblVisitorscore.Height div 2) - 8;
  btnVisitorP2.Width := lblVisitorscore.Height div 2;
  btnVisitorP2.Height := btnVisitorP2.Width div 2;
  btnVisitorP2.Font.Height := btnVisitorP2.Height;

  // Visitor score +3 button
  btnVisitorP3.Top := lblVisitorscore.Top + btnVisitorP1.Height * 2;
  btnVisitorP3.Left := Width - (lblVisitorscore.Height div 2) - 8;
  btnVisitorP3.Width := lblVisitorscore.Height div 2;
  btnVisitorP3.Height := btnVisitorP3.Width div 2;
  btnVisitorP3.Font.Height := btnVisitorP3.Height;

  // Visitor score -1 button
  btnVisitorM1.Top := lblVisitorscore.Top + btnVisitorP1.Height * 3;
  btnVisitorM1.Left := Width - (lblVisitorscore.Height div 2) - 8;
  btnVisitorM1.Width := lblVisitorscore.Height div 2;
  btnVisitorM1.Height := btnVisitorM1.Width div 2;
  btnVisitorM1.Font.Height := btnVisitorM1.Height;

  // Game timer
  lblTimer.Top := shpShotclock.Top + shpShotclock.Height + 8;
  lblTimer.Left := shpShotclock.Left;
  lblTimer.Width := shpShotclock.Width;
  lblTimer.Height := trunc(Height * 0.2);

  // Timer +1 button
  btnTimerP1.Top := lbltimer.Top + trunc(lblTimer.Height * 0.1);
  btnTimerP1.Left := lblTimer.Left + lblTimer.Width;
  btnTimerP1.Width := (lblTimer.Height div 2) * 2;
  btnTimerP1.Height := trunc(lblTimer.Height * 0.4);
  btnTimerP1.Font.Height := trunc(btnTimerP1.Height * 0.7);

  // Timer -1 button
  btnTimerM1.Top := lbltimer.Top + (lblTimer.Height div 2);
  btnTimerM1.Left := lblTimer.Left + lblTimer.Width;
  btnTimerM1.Width := (lblTimer.Height div 2) * 2;
  btnTimerM1.Height := trunc(lblTimer.Height * 0.4);
  btnTimerM1.Font.Height := trunc(btnTimerM1.Height * 0.7);

  // Reset 24 button
  btnReset24.Top := lbltimer.Top + trunc(lblTimer.Height * 0.1);
  btnReset24.Left := 8;
  btnReset24.Width := (lblTimer.Height div 2) * 3;
  btnReset24.Height := trunc(lblTimer.Height * 0.4);
  btnReset24.Font.Height := trunc(btnReset24.Height * 0.7);

  // Reset 14 button
  btnReset14.Top := lbltimer.Top + (lblTimer.Height div 2);
  btnReset14.Left := 8;
  btnReset14.Width := (lblTimer.Height div 2) * 3;
  btnReset14.Height := trunc(lblTimer.Height * 0.4);
  btnReset14.Font.Height := trunc(btnReset14.Height * 0.7);

  // Reset 10:00 button
  btnReset1000.Top := lbltimer.Top + trunc(lblTimer.Height * 0.1);
  btnReset1000.Left := Width - (lblTimer.Height div 2) * 2 - 8;
  btnReset1000.Width := (lblTimer.Height div 2) * 2;
  btnReset1000.Height := trunc(lblTimer.Height * 0.4);
  btnReset1000.Font.Height := trunc(btnReset1000.Height * 0.7);

  // Faults label
  lblFaults.Top := trunc(Height * 0.6);
  lblFaults.Left := shpShotclock.Left;
  lblFaults.Width := shpShotclock.Width;
  lblFaults.Height := trunc(Height * 0.13);

  // Home faults +1 button
  btnHomeFaultsP1.Top := lblFaults.Top + trunc(lblFaults.Height * 0.1);
  btnHomeFaultsP1.Left := 8;
  btnHomeFaultsP1.Width := (lblFaults.Height div 2) * 3;
  btnHomeFaultsP1.Height := trunc(lblFaults.Height * 0.4);
  btnHomeFaultsP1.Font.Height := btnHomeFaultsP1.Height;

  // Home faults -1 button
  btnHomeFaultsM1.Top := lblFaults.Top + (lblFaults.Height div 2);
  btnHomeFaultsM1.Left := 8;
  btnHomeFaultsM1.Width := (lblFaults.Height div 2) * 3;
  btnHomeFaultsM1.Height := trunc(lblFaults.Height * 0.4);
  btnHomeFaultsM1.Font.Height := btnHomeFaultsM1.Height;

  // Visitor faults +1 button
  btnVisitorFaultsP1.Top := lblFaults.Top + trunc(lblFaults.Height * 0.1);
  btnVisitorFaultsP1.Left := Width - (lblFaults.Height div 2) * 3 - 8;
  btnVisitorFaultsP1.Width := (lblFaults.Height div 2) * 3;
  btnVisitorFaultsP1.Height := trunc(lblFaults.Height * 0.4);
  btnVisitorFaultsP1.Font.Height := btnVisitorFaultsP1.Height;

  // Visitor faults -1 button
  btnVisitorFaultsM1.Top := lblFaults.Top + (lblFaults.Height div 2);
  btnVisitorFaultsM1.Left := Width - (lblFaults.Height div 2) * 3 - 8;
  btnVisitorFaultsM1.Width := (lblFaults.Height div 2) * 3;
  btnVisitorFaultsM1.Height := trunc(lblFaults.Height * 0.4);
  btnVisitorFaultsM1.Font.Height := btnVisitorFaultsM1.Height;

  // Home faults
  lblHomeFaults.Top := trunc(Height * 0.6);
  lblHomeFaults.Left := 0;
  lblHomeFaults.Width := trunc(shpShotclock.Left * 0.8);
  lblHomeFaults.Height := trunc(Height * 0.13);

  // Visitor faults
  lblVisitorFaults.Top := trunc(Height * 0.6);
  lblVisitorFaults.Left := trunc(shpShotclock.Left * 1.2 + shpShotclock.Width);
  lblVisitorFaults.Width := trunc(shpShotclock.Left * 0.8);
  lblVisitorFaults.Height := trunc(Height * 0.13);

  // Timeouts label
  lblTimeouts.Top := trunc(Height * 0.73);
  lblTimeouts.Left := shpShotclock.Left;
  lblTimeouts.Width := shpShotclock.Width;
  lblTimeouts.Height := trunc(Height * 0.13);

  // Home timeouts +1 button
  btnHomeTimeoutsP1.Top := lblTimeouts.Top + trunc(lblTimeouts.Height * 0.1);
  btnHomeTimeoutsP1.Left := 8;
  btnHomeTimeoutsP1.Width := (lblTimeouts.Height div 2) * 3;
  btnHomeTimeoutsP1.Height := trunc(lblTimeouts.Height * 0.4);
  btnHomeTimeoutsP1.Font.Height := btnHomeTimeoutsP1.Height;

  // Home timeouts -1 button
  btnHomeTimeoutsM1.Top := lblTimeouts.Top + (lblTimeouts.Height div 2);
  btnHomeTimeoutsM1.Left := 8;
  btnHomeTimeoutsM1.Width := (lblTimeouts.Height div 2) * 3;
  btnHomeTimeoutsM1.Height := trunc(lblTimeouts.Height * 0.4);
  btnHomeTimeoutsM1.Font.Height := btnHomeTimeoutsM1.Height;

  // Visitor timeouts +1 button
  btnVisitorTimeoutsP1.Top := lblTimeouts.Top + trunc(lblTimeouts.Height * 0.1);
  btnVisitorTimeoutsP1.Left := Width - (lblTimeouts.Height div 2) * 3 - 8;
  btnVisitorTimeoutsP1.Width := (lblTimeouts.Height div 2) * 3;
  btnVisitorTimeoutsP1.Height := trunc(lblTimeouts.Height * 0.4);
  btnVisitorTimeoutsP1.Font.Height := btnVisitorTimeoutsP1.Height;

  // Visitor timeouts -1 button
  btnVisitorTimeoutsM1.Top := lblTimeouts.Top + (lblTimeouts.Height div 2);
  btnVisitorTimeoutsM1.Left := Width - (lblTimeouts.Height div 2) * 3 - 8;
  btnVisitorTimeoutsM1.Width := (lblTimeouts.Height div 2) * 3;
  btnVisitorTimeoutsM1.Height := trunc(lblTimeouts.Height * 0.4);
  btnVisitorTimeoutsM1.Font.Height := btnVisitorTimeoutsM1.Height;

  // Home timeouts
  lblHomeTimeouts.Top := trunc(Height * 0.73);
  lblHomeTimeouts.Left := 0;
  lblHomeTimeouts.Width := trunc(shpShotclock.Left * 0.8);
  lblHomeTimeouts.Height := trunc(Height * 0.13);

  // Visitor timeouts
  lblVisitorTimeouts.Top := trunc(Height * 0.73);
  lblVisitorTimeouts.Left := trunc(shpShotclock.Left * 1.2 + shpShotclock.Width);
  lblVisitorTimeouts.Width := trunc(shpShotclock.Left * 0.8);
  lblVisitorTimeouts.Height := trunc(Height * 0.13);

  // Possession label
  lblPossess.Top := trunc(Height * 0.86);
  lblPossess.Left := shpShotclock.Left;
  lblPossess.Width := shpShotclock.Width;
  lblPossess.Height := trunc(Height * 0.13);

  // Home possession button
  btnHomePossess.Top := lblPossess.Top;
  btnHomePossess.Left := 8;
  btnHomePossess.Width := (lblPossess.Height div 2) * 3;
  btnHomePossess.Height := lblPossess.Height;
  btnHomePossess.Font.Height := btnHomePossess.Height div 2;

  // Visitor possession button
  btnVisitorPossess.Top := lblPossess.Top;
  btnVisitorPossess.Left := Width - (lblPossess.Height div 2) * 3 - 8;
  btnVisitorPossess.Width := (lblPossess.Height div 2) * 3;
  btnVisitorPossess.Height := lblPossess.Height;
  btnVisitorPossess.Font.Height := btnVisitorPossess.Height div 2;

  // Home possession
  lblHomePossess.Top := trunc(Height * 0.86);
  lblHomePossess.Left := 0;
  lblHomePossess.Width := trunc(shpShotclock.Left * 0.8);
  lblHomePossess.Height := trunc(Height * 0.13);

  // Visitor possession
  lblVisitorPossess.Top := trunc(Height * 0.86);
  lblVisitorPossess.Left := trunc(shpShotclock.Left * 1.2 + shpShotclock.Width);
  lblVisitorPossess.Width := trunc(shpShotclock.Left * 0.8);
  lblVisitorPossess.Height := trunc(Height * 0.13);
end;

procedure TfrmBoard.InitVars;
begin
  HomeScore := 0;
  VisitorScore := 0;
  ShotClockTime := 240;
  GameTime := 6000;
  HomeFaults := 0;
  VisitorFaults := 0;
  HomeTimeouts := 5;
  VisitorTimeouts := 5;
  TimeRunning := False;
  HomePossess := True;
end;

procedure TfrmBoard.UpdateBoard(Form: TfrmBoard);
var
  RoundedTime: Integer;
  Minutes, Seconds: string;
begin
  Form.lblHomeScore.Caption := IntToStr(HomeScore);
  Form.lblVisitorscore.Caption := IntToStr(VisitorScore);
  Form.lblShotclock.Caption := PadLeft(IntToStr(RoundUp(ShotClockTime / 10)), 2);
  RoundedTime := RoundUp(GameTime / 10);
  Minutes := AddChar('0', IntToStr(RoundedTime div 60), 2);
  Seconds := AddChar('0', IntToStr(RoundedTime mod 60), 2);
  Form.lblTimer.Caption := Minutes + ':' + Seconds;
  Form.lblHomeFaults.Caption := IntToStr(HomeFaults);
  Form.lblVisitorFaults.Caption := IntToStr(VisitorFaults);
  Form.lblHomeTimeouts.Caption := IntToStr(HomeTimeouts);
  Form.lblVisitorTimeouts.Caption := IntToStr(VisitorTimeouts);
  if TimeRunning then
  begin
    Form.btnShotclockRunning.Caption := 'RUNNING (SPACE)';
  end
  else
  begin
    Form.btnShotclockRunning.Caption := 'PAUSED (SPACE)';
  end;
  Form.lblHomePossess.Visible := HomePossess;
  Form.lblVisitorPossess.Visible := not HomePossess;
end;

function TfrmBoard.RoundUp(f: Double): Integer;
begin
  if f = trunc(f) then
  begin
    result := trunc(f);
  end
  else
  begin
    result := trunc(f + 1);
  end;
end;

procedure TfrmBoard.CloseApplication;
begin
  if frmOtherBoard <> nil then
    frmOtherBoard.Free;

  Application.Terminate;
end;

end.

