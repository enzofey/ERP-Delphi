object ConsultarCor: TConsultarCor
  Left = 0
  Top = 0
  Caption = 'ConsultaCor'
  ClientHeight = 298
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = -1
    Top = 0
    Width = 674
    Height = 297
    TabOrder = 0
    object Grid: TDBGrid
      Left = 16
      Top = 16
      Width = 641
      Height = 193
      DataSource = CadCorDM.dsCadCor
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object BtnSelecionarCor: TButton
      Left = 256
      Top = 224
      Width = 145
      Height = 57
      Caption = 'Selecionar'
      TabOrder = 1
      OnClick = BtnSelecionarCorClick
    end
  end
end
