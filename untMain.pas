unit untMain;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
     Vcl.StdCtrls, Vcl.Samples.Spin;

type
     TfrmMain = class(TForm)
          pnlControl: TPanel;
          pnlImage: TPanel;
          imgModel: TImage;
          pnlDraw: TPanel;
          imgDraw: TImage;
          btnCapture: TButton;
          btnClear: TButton;
          edtMouse: TEdit;
          lblMouse: TLabel;
    edtPen: TSpinEdit;
    lblPen: TLabel;
          procedure btnClearClick(Sender: TObject);
          procedure btnCaptureClick(Sender: TObject);
          procedure FormShow(Sender: TObject);
          procedure imgModelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
          procedure imgModelMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
     private
          { Private declarations }
          ImageFile: String;
     public
          { Public declarations }
     end;

var
     frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnCaptureClick(Sender: TObject);
begin
     imgDraw.Picture := imgModel.Picture;
end;

procedure TfrmMain.btnClearClick(Sender: TObject);
begin
     imgDraw.Picture := Nil;
     //
     imgModel.Picture.LoadFromFile(ImageFile);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
     ImageFile := 'HumanFaceLittle.bmp';
     //
     btnClear.Click;
end;

procedure TfrmMain.imgModelMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     // Color...
     imgModel.Canvas.Brush.Color := clBlack;
     imgModel.Canvas.Pen.Color := clBlack;
     imgModel.Canvas.Pen.Style := psSolid;
     imgModel.Canvas.Pen.Width := edtPen.Value;
end;

procedure TfrmMain.imgModelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
     // Position
     edtMouse.Text := '[X = ' + IntToStr(X) + '] [Y = ' + IntToStr(Y) + ']';
     // Draw
     if (ssLeft in Shift) then imgModel.Canvas.Rectangle(X, Y, X+1, Y+1);
     //if (ssLeft in Shift) then imgModel.Canvas.TextOut(X, Y, '[X]');
end;

end.
