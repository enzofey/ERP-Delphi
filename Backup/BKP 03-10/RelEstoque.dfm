object RelEstoqueForm: TRelEstoqueForm
  Left = 0
  Top = 0
  ActiveControl = Grid
  Align = alClient
  BorderStyle = bsNone
  Caption = 'RelEstoque'
  ClientHeight = 956
  ClientWidth = 1862
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
    Width = 1862
    Height = 956
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = -64
    object SBProduto: TSpeedButton
      Left = 390
      Top = 13
      Width = 23
      Height = 23
      OnClick = SBProdutoClick
    end
    object SBCor: TSpeedButton
      Left = 390
      Top = 61
      Width = 23
      Height = 23
      OnClick = SBCorClick
    end
    object SBTamanho: TSpeedButton
      Left = 390
      Top = 109
      Width = 23
      Height = 23
      OnClick = SBTamanhoClick
    end
    object SBDeposito: TSpeedButton
      Left = 390
      Top = 157
      Width = 23
      Height = 23
      OnClick = SBDepositoClick
    end
    object lblProduto: TLabel
      Left = 16
      Top = 16
      Width = 46
      Height = 15
      Caption = 'Produto:'
    end
    object lblCor: TLabel
      Left = 16
      Top = 64
      Width = 22
      Height = 15
      Caption = 'Cor:'
    end
    object lblTamanho: TLabel
      Left = 16
      Top = 112
      Width = 52
      Height = 15
      Caption = 'Tamanho:'
    end
    object lblDeposito: TLabel
      Left = 16
      Top = 160
      Width = 50
      Height = 15
      Caption = 'Dep'#243'sito:'
    end
    object Grid: TDBGrid
      Left = 16
      Top = 192
      Width = 1817
      Height = 737
      DataSource = EstoqueDM.dsEstoque
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object btnConsultar: TButton
      Left = 419
      Top = 13
      Width = 145
      Height = 45
      Caption = 'Consultar'
      TabOrder = 1
      OnClick = btnConsultarClick
    end
    object btnFechar: TButton
      Left = 419
      Top = 69
      Width = 145
      Height = 46
      Caption = 'Fechar'
      TabOrder = 2
      OnClick = btnFecharClick
    end
    object EdtCodigoProduto: TEdit
      Left = 79
      Top = 13
      Width = 99
      Height = 23
      TabOrder = 3
      OnChange = EdtCodigoProdutoChange
    end
    object EdtDescricaoProduto: TEdit
      Left = 184
      Top = 13
      Width = 200
      Height = 23
      Enabled = False
      TabOrder = 4
    end
    object EdtDescricaoDeposito: TEdit
      Left = 184
      Top = 157
      Width = 200
      Height = 23
      Enabled = False
      TabOrder = 5
    end
    object EdtDescricaoTamanho: TEdit
      Left = 184
      Top = 109
      Width = 200
      Height = 23
      Enabled = False
      TabOrder = 6
    end
    object EdtDescricaoCor: TEdit
      Left = 184
      Top = 61
      Width = 200
      Height = 23
      Enabled = False
      TabOrder = 7
    end
    object EdtCodigoCor: TEdit
      Left = 79
      Top = 61
      Width = 99
      Height = 23
      TabOrder = 8
      OnChange = EdtCodigoCorChange
    end
    object EdtCodigoTamanho: TEdit
      Left = 79
      Top = 109
      Width = 99
      Height = 23
      TabOrder = 9
      OnChange = EdtCodigoTamanhoChange
    end
    object EdtCodigoDeposito: TEdit
      Left = 79
      Top = 157
      Width = 99
      Height = 23
      TabOrder = 10
      OnChange = EdtCodigoDepositoChange
    end
  end
end
