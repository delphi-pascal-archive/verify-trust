object Form1: TForm1
  Left = 258
  Top = 146
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1062#1080#1092#1088#1086#1074#1086#1081' '#1055#1086#1076#1087#1080#1089#1080
  ClientHeight = 90
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 38
    Height = 16
    Caption = #1060#1072#1081#1083':'
  end
  object Button1: TButton
    Left = 8
    Top = 56
    Width = 401
    Height = 25
    Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 56
    Top = 16
    Width = 321
    Height = 25
    TabOrder = 1
    Text = 'C:\Windows\System32\atiesrxx.exe'
  end
  object BitBtn1: TBitBtn
    Left = 384
    Top = 16
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object OpenDialog1: TOpenDialog
    Left = 278
    Top = 6
  end
  object XPManifest1: TXPManifest
    Left = 312
    Top = 8
  end
end
