object frmApiBuscaCEP: TfrmApiBuscaCEP
  Left = 400
  Top = 131
  Width = 441
  Height = 226
  Caption = 'Api Busca Cep - Teste '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 19
    Top = 11
    Width = 63
    Height = 13
    Caption = 'Digite o CEP:'
  end
  object lblResultado: TLabel
    Left = 22
    Top = 157
    Width = 5
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EditCEP: TEdit
    Left = 19
    Top = 28
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object ButtonConsultar: TBitBtn
    Left = 159
    Top = 28
    Width = 100
    Height = 25
    Caption = 'Consulta CEP'
    TabOrder = 1
    OnClick = ButtonConsultarClick
  end
  object MemoEndereco: TMemo
    Left = 20
    Top = 63
    Width = 385
    Height = 89
    TabOrder = 2
  end
  object IdHTTPServer1: TIdHTTPServer
    Bindings = <>
    CommandHandlers = <>
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    Left = 295
    Top = 20
  end
end
