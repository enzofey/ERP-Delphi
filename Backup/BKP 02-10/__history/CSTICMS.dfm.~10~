object CadCSTICMS: TCadCSTICMS
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'CadCSTICMS'
  ClientHeight = 769
  ClientWidth = 1116
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Visible = True
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1116
    Height = 769
    Align = alClient
    TabOrder = 0
    object lblCST: TLabel
      Left = 32
      Top = 32
      Width = 158
      Height = 15
      Caption = 'C'#243'digo da Situa'#231#227'o Tribut'#225'ria:'
    end
    object lblDescricao: TLabel
      Left = 32
      Top = 72
      Width = 54
      Height = 15
      Caption = 'Descri'#231#227'o:'
    end
    object btnAlterar: TButton
      Left = 183
      Top = 687
      Width = 145
      Height = 57
      Caption = 'Alterar'
      TabOrder = 0
      OnClick = btnAlterarClick
    end
    object btnDesistir: TButton
      Left = 183
      Top = 687
      Width = 145
      Height = 57
      Caption = 'Desistir'
      TabOrder = 1
      Visible = False
      OnClick = btnDesistirClick
    end
    object BtnExcluir: TButton
      Left = 334
      Top = 687
      Width = 145
      Height = 57
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = BtnExcluirClick
    end
    object btnFechar: TButton
      Left = 952
      Top = 687
      Width = 145
      Height = 57
      Caption = 'Fechar'
      TabOrder = 3
      OnClick = btnFecharClick
    end
    object btnGravarAlterar: TButton
      Left = 32
      Top = 687
      Width = 145
      Height = 57
      Caption = 'Gravar'
      TabOrder = 4
      Visible = False
      OnClick = btnGravarAlterarClick
    end
    object btnGravarIncluir: TButton
      Left = 32
      Top = 687
      Width = 145
      Height = 57
      Caption = 'Gravar'
      TabOrder = 5
      Visible = False
      OnClick = btnGravarIncluirClick
    end
    object btnIncluir: TButton
      Left = 32
      Top = 687
      Width = 145
      Height = 57
      Caption = 'Incluir'
      TabOrder = 6
      OnClick = btnIncluirClick
    end
    object EdtCST: TEdit
      Left = 198
      Top = 29
      Width = 99
      Height = 23
      Enabled = False
      MaxLength = 2
      NumbersOnly = True
      TabOrder = 7
    end
    object EdtDescricao: TEdit
      Left = 95
      Top = 69
      Width = 514
      Height = 23
      Enabled = False
      TabOrder = 8
    end
    object Grid: TDBGrid
      Left = 32
      Top = 127
      Width = 1065
      Height = 537
      DataSource = CadCSTICMSDataModule.dsCSTICMS
      TabOrder = 9
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = GridCellClick
    end
    object RGModo: TRadioGroup
      Left = 622
      Top = 5
      Width = 185
      Height = 116
      Caption = 'Modo de C'#225'lculo:'
      Enabled = False
      TabOrder = 13
    end
    object RBBase: TRadioButton
      Left = 632
      Top = 29
      Width = 113
      Height = 17
      Caption = 'Base ICMS'
      Enabled = False
      TabOrder = 10
    end
    object RBIsento: TRadioButton
      Left = 632
      Top = 59
      Width = 113
      Height = 18
      Caption = 'Isento ICMS'
      Enabled = False
      TabOrder = 11
    end
    object RBOutros: TRadioButton
      Left = 632
      Top = 89
      Width = 113
      Height = 17
      Caption = 'Outros ICMS'
      Enabled = False
      TabOrder = 12
    end
  end
end
