object MovSaida: TMovSaida
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'MovSaida'
  ClientHeight = 956
  ClientWidth = 1862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Visible = True
  WindowState = wsMaximized
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1862
    Height = 956
    Align = alClient
    TabOrder = 0
    object lblCodigoCor: TLabel
      Left = 40
      Top = 96
      Width = 22
      Height = 15
      Caption = 'Cor:'
    end
    object lblCodigoDeposito: TLabel
      Left = 40
      Top = 192
      Width = 50
      Height = 15
      Caption = 'Dep'#243'sito:'
    end
    object lblCodigoProduto: TLabel
      Left = 40
      Top = 48
      Width = 46
      Height = 15
      Caption = 'Produto:'
    end
    object lblCodigoTamanho: TLabel
      Left = 40
      Top = 144
      Width = 52
      Height = 15
      Caption = 'Tamanho:'
    end
    object lblLote: TLabel
      Left = 40
      Top = 240
      Width = 26
      Height = 15
      Caption = 'Lote:'
    end
    object lblQtde: TLabel
      Left = 40
      Top = 288
      Width = 65
      Height = 15
      Caption = 'Quantidade:'
    end
    object SBProduto: TSpeedButton
      Left = 422
      Top = 45
      Width = 23
      Height = 23
      Enabled = False
      OnClick = SBProdutoClick
    end
    object SBCor: TSpeedButton
      Left = 422
      Top = 93
      Width = 23
      Height = 23
      Enabled = False
      OnClick = SBCorClick
    end
    object SBTamanho: TSpeedButton
      Left = 422
      Top = 141
      Width = 23
      Height = 23
      Enabled = False
      OnClick = SBTamanhoClick
    end
    object SBDeposito: TSpeedButton
      Left = 422
      Top = 189
      Width = 23
      Height = 23
      Enabled = False
      OnClick = SBDepositoClick
    end
    object btnDesistir: TButton
      Left = 342
      Top = 864
      Width = 145
      Height = 57
      Caption = 'Desistir'
      TabOrder = 0
      Visible = False
      OnClick = btnDesistirClick
    end
    object btnGravar: TButton
      Left = 191
      Top = 864
      Width = 145
      Height = 57
      Caption = 'Gravar'
      TabOrder = 1
      Visible = False
      OnClick = btnGravarClick
    end
    object btnIncluir: TButton
      Left = 40
      Top = 864
      Width = 145
      Height = 57
      Caption = 'Incluir'
      TabOrder = 2
      OnClick = btnIncluirClick
    end
    object btnIncluirGrid: TButton
      Left = 40
      Top = 864
      Width = 145
      Height = 57
      Caption = 'Incluir'
      TabOrder = 3
      Visible = False
      OnClick = btnIncluirGridClick
    end
    object edtLote: TEdit
      Left = 111
      Top = 237
      Width = 99
      Height = 23
      Enabled = False
      TabOrder = 4
    end
    object EdtQtde: TEdit
      Left = 111
      Top = 285
      Width = 99
      Height = 23
      Enabled = False
      NumbersOnly = True
      TabOrder = 5
    end
    object Grid: TStringGrid
      Left = 472
      Top = 45
      Width = 1361
      Height = 788
      ColCount = 6
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      TabOrder = 6
    end
    object EdtCodigoProduto: TEdit
      Left = 111
      Top = 45
      Width = 99
      Height = 23
      Enabled = False
      TabOrder = 7
      OnChange = EdtCodigoProdutoChange
    end
    object EdtDescricaoProduto: TEdit
      Left = 216
      Top = 45
      Width = 200
      Height = 23
      Enabled = False
      TabOrder = 8
    end
    object EdtCodigoCor: TEdit
      Left = 111
      Top = 93
      Width = 99
      Height = 23
      Enabled = False
      TabOrder = 9
      OnChange = EdtCodigoCorChange
    end
    object EdtDescricaoCor: TEdit
      Left = 216
      Top = 93
      Width = 200
      Height = 23
      Enabled = False
      TabOrder = 10
    end
    object EdtDescricaoTamanho: TEdit
      Left = 216
      Top = 141
      Width = 200
      Height = 23
      Enabled = False
      TabOrder = 11
    end
    object EdtCodigoTamanho: TEdit
      Left = 111
      Top = 141
      Width = 99
      Height = 23
      Enabled = False
      TabOrder = 12
      OnChange = EdtCodigoTamanhoChange
    end
    object EdtCodigoDeposito: TEdit
      Left = 111
      Top = 189
      Width = 99
      Height = 23
      Enabled = False
      TabOrder = 13
      OnChange = EdtCodigoDepositoChange
    end
    object EdtDescricaoDeposito: TEdit
      Left = 216
      Top = 189
      Width = 200
      Height = 23
      Enabled = False
      TabOrder = 14
    end
    object btnFechar: TButton
      Left = 1688
      Top = 864
      Width = 145
      Height = 57
      Caption = 'Fechar'
      TabOrder = 15
      OnClick = btnFecharClick
    end
  end
end
