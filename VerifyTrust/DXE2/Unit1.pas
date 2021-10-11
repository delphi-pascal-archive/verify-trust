unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function SD_GetVerifiedPublisher(FileName: WideString; var Publisher: WideString): LONG; stdcall; external 'VerifyTrust.dll';

function GetCompanyName(FileName: WideString): WideString;
var
  Handle, Len, Size: Cardinal;
  Translation: WideString;
  Data: PWideChar;
  Buffer: Pointer;
begin
  try
    Size := GetFileVersionInfoSizeW(PWideChar(FileName), Handle);
    if Size > 0 then
    begin
      GetMem(Data, Size);
      try
        if GetFileVersionInfoW(PWideChar(FileName), Handle, Size, Data) then
        begin
          if VerQueryValueW(Data, '\VarFileInfo\Translation', Buffer, Len) then
          begin
            Translation := IntToHex(PDWORD(Buffer)^, 8);
            Translation := Copy(Translation, 5, 4) + Copy(Translation, 1, 4);
          end;
          if VerQueryValueW(Data, PWideChar('\StringFileInfo\' + Translation + '\CompanyName'), Buffer, Len) then
            Result := PWideChar(Buffer);
        end;
      finally
        FreeMem(Data);
      end;
    end;
  except
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Edit1.Text := OpenDialog1.FileName;
    Button1.Click;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Publisher: WideString;
  VerifiedStatus: LONG;
begin
  VerifiedStatus := SD_GetVerifiedPublisher(Edit1.Text, Publisher);
  MessageBeep(0);
  // Только в случае возврата 0 подпись считается действительной
  if VerifiedStatus = 0 then
  begin
    // Файл подписан, подпись действительна
    MessageBoxW(0, PWideChar('Издатель: ' + Publisher +
      #13#10 + #13#10 + 'Цифровая подпись действительна'), 'Результат проверки', 0);
  end
  else
  begin
    if Publisher = '' then
    begin
      // Файл не подписан, пробуем получить имя компании из FileVersionInfo
      Publisher := GetCompanyName(Edit1.Text);
      if Publisher <> '' then
        MessageBoxW(0, PWideChar('Издатель: ' + Publisher +
          #13#10 + #13#10 + 'Цифровая подпись отсутствует'), 'Результат проверки', 0)
      else
        MessageBoxW(0, PWideChar('Издатель: ' + 'Неизвестен' +
          #13#10 + #13#10 + 'Цифровая подпись отсутствует'), 'Результат проверки', 0)
    end
    else
    begin
      // Файл подписан, но подпись не действительна
      MessageBoxW(0, PWideChar('Издатель: ' + Publisher +
        #13#10 + #13#10 + 'Цифровая подпись не действительна'), 'Результат проверки', 0);
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text := Application.ExeName;
end;

end.
