object ConsultarTamanho: TConsultarTamanho
  Left = 0
  Top = 0
  Caption = 'Consultar'
  ClientHeight = 424
  ClientWidth = 897
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
    Width = 897
    Height = 424
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -10
    ExplicitTop = -7
    ExplicitWidth = 691
    ExplicitHeight = 304
    object GridConsultaTamanho: TDBGrid
      Left = 32
      Top = 24
      Width = 833
      Height = 313
      DataSource = CadTamanhoDM.dsConsultarTamanho
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object BtnSelecionarDeposito: TButton
      Left = 368
      Top = 335
      Width = 145
      Height = 57
      Caption = 'Selecionar'
      TabOrder = 1
      OnClick = BtnSelecionarTamanhoClick
    end
  end
end
