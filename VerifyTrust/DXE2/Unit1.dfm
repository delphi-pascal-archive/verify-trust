object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1062#1080#1092#1088#1086#1074#1086#1081' '#1055#1086#1076#1087#1080#1089#1080
  ClientHeight = 129
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    466
    129)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 34
    Width = 30
    Height = 13
    Caption = #1060#1072#1081#1083':'
  end
  object Button1: TButton
    Left = 12
    Top = 82
    Width = 127
    Height = 25
    Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 46
    Top = 31
    Width = 387
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Text = 'C:\Windows\System32\atiesrxx.exe'
  end
  object BitBtn1: TBitBtn
    Left = 435
    Top = 30
    Width = 23
    Height = 23
    Anchors = [akTop, akRight]
    Caption = '...'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object OpenDialog1: TOpenDialog
    Left = 254
    Top = 70
  end
end
