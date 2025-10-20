object CadMoeda: TCadMoeda
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'CadMoeda'
  ClientHeight = 869
  ClientWidth = 1119
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Visible = True
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1119
    Height = 869
    Align = alClient
    TabOrder = 0
    object lblAtivo: TLabel
      Left = 584
      Top = 16
      Width = 31
      Height = 15
      Caption = 'Ativo:'
    end
    object lblDescricao: TLabel
      Left = 24
      Top = 48
      Width = 54
      Height = 15
      Caption = 'Descri'#231#227'o:'
    end
    object lblCodigo: TLabel
      Left = 24
      Top = 16
      Width = 42
      Height = 15
      Caption = 'C'#243'digo:'
    end
    object btnAlterar: TButton
      Left = 175
      Top = 792
      Width = 145
      Height = 49
      Caption = 'Alterar'
      TabOrder = 0
      OnClick = btnAlterarClick
    end
    object btnDesistir: TButton
      Left = 175
      Top = 792
      Width = 145
      Height = 49
      Caption = 'Desistir'
      TabOrder = 1
      Visible = False
      OnClick = btnDesistirClick
    end
    object btnExcluir: TButton
      Left = 326
      Top = 792
      Width = 145
      Height = 49
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnFechar: TButton
      Left = 952
      Top = 792
      Width = 145
      Height = 49
      Caption = 'Fechar'
      TabOrder = 3
      OnClick = btnFecharClick
    end
    object btnGravarAlterar: TButton
      Left = 24
      Top = 792
      Width = 145
      Height = 49
      Caption = 'Gravar'
      TabOrder = 4
      Visible = False
      OnClick = btnGravarAlterarClick
    end
    object btnGravarIncluir: TButton
      Left = 24
      Top = 792
      Width = 145
      Height = 49
      Caption = 'Gravar'
      TabOrder = 5
      Visible = False
      OnClick = btnGravarIncluirClick
    end
    object btnIncluir: TButton
      Left = 24
      Top = 792
      Width = 145
      Height = 49
      Caption = 'Incluir'
      TabOrder = 6
      OnClick = btnIncluirClick
    end
    object CBAtivo: TCheckBox
      Left = 624
      Top = 16
      Width = 17
      Height = 17
      Enabled = False
      TabOrder = 7
    end
    object EdtDescricao: TEdit
      Left = 84
      Top = 45
      Width = 121
      Height = 23
      Enabled = False
      TabOrder = 8
    end
    object EdtCodigo: TEdit
      Left = 84
      Top = 13
      Width = 121
      Height = 23
      Enabled = False
      MaxLength = 8
      NumbersOnly = True
      TabOrder = 9
    end
    object Grid: TDBGrid
      Left = 24
      Top = 216
      Width = 1073
      Height = 561
      DataSource = CadMoedaDM.dsCadMoeda
      TabOrder = 10
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = GridCellClick
    end
  end
end
