unit board;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TfrmBoard }

  TfrmBoard = class(TForm)
    shpShotclock: TShape;
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

procedure TfrmBoard.ReAlign;
begin
  shpShotclock.Height := trunc(frmBoard.Height * 0.3);
  shpShotclock.Width := shpShotclock.Height;
  shpShotclock.Left := (frmBoard.Width div 2) - (shpShotclock.Width div 2);
end;

end.

