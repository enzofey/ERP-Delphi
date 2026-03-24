object ConsultarUnidade: TConsultarUnidade
  Left = 0
  Top = 0
  Caption = 'ConsultarUnidade'
  ClientHeight = 441
  ClientWidth = 848
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = -1
    Top = 0
    Width = 849
    Height = 441
    TabOrder = 0
    object btnSelecionarUnidade: TButton
      Left = 304
      Top = 360
      Width = 145
      Height = 57
      Caption = 'Selecionar'
      TabOrder = 0
      OnClick = btnSelecionarUnidadeClick
    end
    object Grid: TDBGrid
      Left = 16
      Top = 24
      Width = 825
      Height = 305
      DataSource = CadUnidadeDM.dsGridQuery
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
end
