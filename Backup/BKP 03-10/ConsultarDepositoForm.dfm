object ConsultarDeposito: TConsultarDeposito
  Left = 0
  Top = 0
  Caption = 'Consultar'
  ClientHeight = 403
  ClientWidth = 889
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 889
    Height = 403
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -17
    ExplicitTop = -7
    ExplicitWidth = 682
    ExplicitHeight = 304
    object GridConsultaDeposito: TDBGrid
      Left = 32
      Top = 24
      Width = 817
      Height = 281
      DataSource = CadDepositoDM.ConsultarDeposito
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object BtnSelecionarDeposito: TButton
      Left = 368
      Top = 311
      Width = 145
      Height = 57
      Caption = 'Selecionar'
      TabOrder = 1
      OnClick = BtnSelecionarDepositoClick
    end
  end
end
