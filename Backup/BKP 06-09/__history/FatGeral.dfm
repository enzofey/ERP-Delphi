object FatGeralForm: TFatGeralForm
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Geral'
  ClientHeight = 966
  ClientWidth = 1908
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
    Width = 1908
    Height = 966
    Align = alClient
    TabOrder = 0
    object lblCliente: TLabel
      Left = 24
      Top = 24
      Width = 40
      Height = 15
      Caption = 'Cliente:'
    end
    object lblSerie: TLabel
      Left = 433
      Top = 24
      Width = 28
      Height = 15
      Caption = 'S'#233'rie:'
    end
    object lblNatureza: TLabel
      Left = 24
      Top = 64
      Width = 50
      Height = 15
      Caption = 'Natureza:'
    end
    object lbldtEmissão: TLabel
      Left = 24
      Top = 104
      Width = 89
      Height = 15
      Caption = 'Data de Emiss'#227'o:'
    end
    object lbldtSaida: TLabel
      Left = 272
      Top = 104
      Width = 74
      Height = 15
      Caption = 'Data de Sa'#237'da:'
    end
    object SBNatureza: TSpeedButton
      Left = 169
      Top = 61
      Width = 23
      Height = 23
      Enabled = False
      OnClick = SBNaturezaClick
    end
    object lblValFrete: TLabel
      Left = 24
      Top = 144
      Width = 29
      Height = 15
      Caption = 'Frete:'
    end
    object lblDesconto: TLabel
      Left = 24
      Top = 184
      Width = 31
      Height = 15
      Caption = 'Desc.:'
    end
    object SBEntidade: TSpeedButton
      Left = 399
      Top = 21
      Width = 23
      Height = 23
      Enabled = False
      OnClick = SBEntidadeClick
    end
    object EdtEntidade: TEdit
      Left = 80
      Top = 21
      Width = 313
      Height = 23
      Enabled = False
      TabOrder = 0
    end
    object DTEmissao: TDateTimePicker
      Left = 119
      Top = 101
      Width = 147
      Height = 23
      Date = 45870.000000000000000000
      Time = 45870.000000000000000000
      Enabled = False
      Kind = dtkDateTime
      TabOrder = 1
    end
    object DTSaida: TDateTimePicker
      Left = 352
      Top = 101
      Width = 138
      Height = 23
      Date = 45870.000000000000000000
      Time = 45870.000000000000000000
      Enabled = False
      Kind = dtkDateTime
      TabOrder = 2
    end
    object EdtSerie: TEdit
      Left = 467
      Top = 21
      Width = 23
      Height = 23
      Enabled = False
      TabOrder = 3
    end
    object EdtNatureza: TEdit
      Left = 80
      Top = 61
      Width = 83
      Height = 23
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
    object btnIncluir: TButton
      Left = 24
      Top = 888
      Width = 145
      Height = 57
      Caption = 'Incluir'
      TabOrder = 5
      OnClick = btnIncluirClick
    end
    object btnGravar: TButton
      Left = 24
      Top = 888
      Width = 145
      Height = 57
      Caption = 'Gravar'
      TabOrder = 6
      Visible = False
    end
    object btnDesistir: TButton
      Left = 175
      Top = 888
      Width = 145
      Height = 57
      Caption = 'Desistir'
      TabOrder = 7
      Visible = False
      OnClick = btnDesistirClick
    end
    object btnFechar: TButton
      Left = 1736
      Top = 888
      Width = 145
      Height = 57
      Caption = 'Fechar'
      TabOrder = 8
    end
    object EdtValFrete: TEdit
      Left = 80
      Top = 141
      Width = 83
      Height = 23
      Enabled = False
      NumbersOnly = True
      TabOrder = 9
      OnExit = EdtValFreteExit
    end
    object EdtValDesconto: TEdit
      Left = 80
      Top = 181
      Width = 83
      Height = 23
      Enabled = False
      TabOrder = 10
      OnExit = EdtValDescontoExit
    end
    object NIGrid: TStringGrid
      Left = 24
      Top = 416
      Width = 1857
      Height = 457
      ColCount = 31
      Enabled = False
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
      TabOrder = 11
      OnKeyDown = NIGridKeyDown
    end
  end
end
