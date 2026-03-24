object ConsultarCidade: TConsultarCidade
  Left = 0
  Top = 0
  Caption = 'ConsultarCidade'
  ClientHeight = 372
  ClientWidth = 877
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = -14
    Top = -11
    Width = 895
    Height = 388
    TabOrder = 0
    object Grid: TDBGrid
      Left = 24
      Top = 24
      Width = 857
      Height = 265
      DataSource = CadCidadeDM.ConsultarCidade
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object BtnSelecionarCidade: TButton
      Left = 352
      Top = 303
      Width = 145
      Height = 57
      Caption = 'Selecionar'
      TabOrder = 1
      OnClick = BtnSelecionarCidadeClick
    end
  end
end
