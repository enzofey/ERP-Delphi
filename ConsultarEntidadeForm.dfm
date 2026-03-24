object ConsultarEntidade: TConsultarEntidade
  Left = 0
  Top = 0
  Caption = 'Consultar'
  ClientHeight = 295
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = -10
    Top = -7
    Width = 682
    Height = 304
    TabOrder = 0
    object Grid: TDBGrid
      Left = 24
      Top = 24
      Width = 641
      Height = 193
      DataSource = CadEntidadeDM.ConsultarEntidade
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object BtnSelecionarEntidade: TButton
      Left = 264
      Top = 231
      Width = 145
      Height = 57
      Caption = 'Selecionar'
      TabOrder = 1
      OnClick = BtnSelecionarEntidadeClick
    end
  end
end
