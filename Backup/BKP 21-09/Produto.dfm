object CadProduto: TCadProduto
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'CadProduto'
  ClientHeight = 956
  ClientWidth = 1861
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
  object Pages: TPageControl
    Left = 0
    Top = 0
    Width = 1861
    Height = 956
    ActivePage = AcessoPage
    Align = alClient
    TabOrder = 0
    object AcessoPage: TTabSheet
      Caption = 'Acesso'
      ImageIndex = 2
      object lblAcessoCodigo: TLabel
        Left = 40
        Top = 48
        Width = 42
        Height = 15
        Caption = 'C'#243'digo:'
      end
      object lblAcessoUniCom: TLabel
        Left = 447
        Top = 16
        Width = 70
        Height = 15
        Caption = 'Uni. Compra:'
      end
      object lblAcessoUniVen: TLabel
        Left = 599
        Top = 16
        Width = 59
        Height = 15
        Caption = 'Uni. Venda:'
      end
      object lblAcessoFaixa: TLabel
        Left = 40
        Top = 77
        Width = 30
        Height = 15
        Caption = 'Faixa:'
      end
      object SBAcessoConsProduto: TSpeedButton
        Left = 311
        Top = 45
        Width = 23
        Height = 23
        OnClick = SBAcessoConsProdutoClick
      end
      object SBAcessoConsFaixa: TSpeedButton
        Left = 311
        Top = 74
        Width = 23
        Height = 23
        OnClick = SBAcessoConsFaixaClick
      end
      object lblAcessoOrigem: TLabel
        Left = 39
        Top = 138
        Width = 43
        Height = 15
        Caption = 'Origem:'
      end
      object lblAcessoNCM: TLabel
        Left = 41
        Top = 106
        Width = 31
        Height = 15
        Caption = 'NCM:'
      end
      object SBAcessoConsNCM: TSpeedButton
        Left = 311
        Top = 103
        Width = 23
        Height = 23
        OnClick = SBAcessoConsNCMClick
      end
      object RGAcessoBrinde: TRadioGroup
        Left = 253
        Top = 0
        Width = 172
        Height = 39
        Caption = 'Brinde'
        Columns = 3
        Items.Strings = (
          'Sim'
          'N'#227'o'
          'Todos')
        TabOrder = 13
      end
      object EdtAcessoCodigo: TEdit
        Left = 88
        Top = 45
        Width = 41
        Height = 23
        TabOrder = 0
        OnChange = EdtAcessoCodigoChange
      end
      object EdtAcessoDescricao: TEdit
        Left = 135
        Top = 45
        Width = 170
        Height = 23
        Enabled = False
        TabOrder = 1
      end
      object CBAcessoUniCom: TComboBox
        Left = 523
        Top = 13
        Width = 57
        Height = 23
        Style = csDropDownList
        TabOrder = 2
        OnDropDown = CBUniComDropDown
      end
      object CBAcessoUniVenda: TComboBox
        Left = 664
        Top = 13
        Width = 57
        Height = 23
        Style = csDropDownList
        TabOrder = 3
        OnDropDown = CBUniVendaDropDown
      end
      object EdtAcessoFaixaDescricao: TEdit
        Left = 135
        Top = 74
        Width = 170
        Height = 23
        Enabled = False
        TabOrder = 4
      end
      object EdtAcessoFaixa: TEdit
        Left = 88
        Top = 74
        Width = 41
        Height = 23
        TabOrder = 5
        OnChange = EdtAcessoFaixaChange
      end
      object CBAcessoOrigem: TComboBox
        Left = 88
        Top = 135
        Width = 217
        Height = 23
        Style = csDropDownList
        TabOrder = 6
        OnDropDown = CBAcessoOrigemDropDown
      end
      object EdtAcessoNCM: TEdit
        Left = 89
        Top = 103
        Width = 40
        Height = 23
        TabOrder = 7
        OnChange = EdtAcessoNCMChange
      end
      object EdtAcessoNCMNCM: TEdit
        Left = 135
        Top = 103
        Width = 170
        Height = 23
        Enabled = False
        TabOrder = 8
      end
      object btnAcessoConsultar: TButton
        Left = 350
        Top = 45
        Width = 75
        Height = 23
        Caption = 'Consultar'
        TabOrder = 9
        OnClick = btnAcessoConsultarClick
      end
      object btnAcessoFechar: TButton
        Left = 350
        Top = 74
        Width = 75
        Height = 23
        Caption = 'Fechar'
        TabOrder = 10
        OnClick = btnFecharClick
      end
      object RGAcessoAtivo: TRadioGroup
        Left = 41
        Top = 0
        Width = 206
        Height = 39
        Caption = 'Ativo:'
        Columns = 3
        Items.Strings = (
          'Ativos'
          'Inativos'
          'Todos')
        TabOrder = 11
      end
      object AcessoGrid: TDBGrid
        Left = 41
        Top = 192
        Width = 1776
        Height = 697
        DataSource = CadProdutoDM.dsAcesso
        TabOrder = 12
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object CadastroPage: TTabSheet
      Caption = 'Cadastro'
      object LblAtivo: TLabel
        Left = 608
        Top = 48
        Width = 31
        Height = 15
        Caption = 'Ativo:'
      end
      object lblBrinde: TLabel
        Left = 608
        Top = 77
        Width = 37
        Height = 15
        Caption = 'Brinde:'
      end
      object lblCodigo: TLabel
        Left = 40
        Top = 48
        Width = 42
        Height = 15
        Caption = 'C'#243'digo:'
      end
      object lblDescricao: TLabel
        Left = 40
        Top = 84
        Width = 54
        Height = 15
        Caption = 'Descri'#231#227'o:'
      end
      object lblFaixa: TLabel
        Left = 1344
        Top = 514
        Width = 98
        Height = 15
        Caption = 'Faixa de Tamanho:'
      end
      object lblUniCom: TLabel
        Left = 40
        Top = 122
        Width = 109
        Height = 15
        Caption = 'Unidade de Compra:'
      end
      object lblUniVenda: TLabel
        Left = 274
        Top = 122
        Width = 98
        Height = 15
        Caption = 'Unidade de Venda:'
      end
      object SBFaixa: TSpeedButton
        Left = 1806
        Top = 511
        Width = 23
        Height = 23
        Enabled = False
        OnClick = SBFaixaClick
      end
      object btnAlterar: TButton
        Left = 167
        Top = 850
        Width = 145
        Height = 57
        Caption = 'Alterar'
        TabOrder = 0
        OnClick = btnAlterarClick
      end
      object btnConsultar: TButton
        Left = 470
        Top = 850
        Width = 145
        Height = 57
        Caption = 'Consultar'
        TabOrder = 1
        OnClick = btnConsultarClick
      end
      object btnDesistir: TButton
        Left = 167
        Top = 850
        Width = 145
        Height = 57
        Caption = 'Desistir'
        TabOrder = 2
        Visible = False
        OnClick = btnDesistirClick
      end
      object btnExcluir: TButton
        Left = 318
        Top = 850
        Width = 146
        Height = 57
        Caption = 'Excluir'
        TabOrder = 3
        OnClick = btnExcluirClick
      end
      object btnFechar: TButton
        Left = 1684
        Top = 850
        Width = 145
        Height = 57
        Caption = 'Fechar'
        TabOrder = 4
        OnClick = btnFecharClick
      end
      object btnGravarAlterar: TButton
        Left = 16
        Top = 850
        Width = 145
        Height = 57
        Caption = 'Gravar'
        TabOrder = 5
        Visible = False
        OnClick = btnGravarAlterarClick
      end
      object btnGravarIncluir: TButton
        Left = 16
        Top = 850
        Width = 145
        Height = 57
        Caption = 'Gravar'
        TabOrder = 6
        Visible = False
        OnClick = btnGravarIncluirClick
      end
      object btnIncluir: TButton
        Left = 16
        Top = 850
        Width = 145
        Height = 57
        Caption = 'Incluir'
        TabOrder = 7
        OnClick = btnIncluirClick
      end
      object CBAtivo: TCheckBox
        Left = 645
        Top = 48
        Width = 20
        Height = 17
        Enabled = False
        TabOrder = 8
      end
      object CBBrinde: TCheckBox
        Left = 651
        Top = 77
        Width = 20
        Height = 17
        Enabled = False
        TabOrder = 9
      end
      object CBUniCom: TComboBox
        Left = 155
        Top = 119
        Width = 94
        Height = 23
        Style = csDropDownList
        Enabled = False
        TabOrder = 10
        OnDropDown = CBUniComDropDown
      end
      object CBUniVenda: TComboBox
        Left = 378
        Top = 119
        Width = 94
        Height = 23
        Style = csDropDownList
        Enabled = False
        TabOrder = 11
        OnDropDown = CBUniVendaDropDown
      end
      object edtCodigo: TEdit
        Left = 100
        Top = 45
        Width = 121
        Height = 23
        Enabled = False
        TabOrder = 12
      end
      object EdtDescricao: TEdit
        Left = 100
        Top = 81
        Width = 372
        Height = 23
        Enabled = False
        TabOrder = 13
      end
      object EdtFaixaDescricao: TEdit
        Left = 1487
        Top = 511
        Width = 313
        Height = 23
        Enabled = False
        TabOrder = 14
      end
      object EdtFaixaTamanho: TEdit
        Left = 1448
        Top = 511
        Width = 33
        Height = 23
        Enabled = False
        TabOrder = 15
        OnChange = EdtFaixaTamanhoChange
      end
      object GridCorEstoque: TDBGrid
        Left = 1344
        Top = 544
        Width = 485
        Height = 265
        DataSource = CadCorDM.dsCorEstoque
        TabOrder = 16
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object TributacoesPage: TTabSheet
      Caption = 'Tributa'#231#245'es'
      ImageIndex = 1
      object lblNCM: TLabel
        Left = 40
        Top = 51
        Width = 31
        Height = 15
        Caption = 'NCM:'
      end
      object SBNCM: TSpeedButton
        Left = 237
        Top = 48
        Width = 23
        Height = 23
        Enabled = False
        OnClick = SBNCMClick
      end
      object lblOrigem: TLabel
        Left = 40
        Top = 91
        Width = 43
        Height = 15
        Caption = 'Origem:'
      end
      object EdtNCM: TEdit
        Left = 88
        Top = 48
        Width = 28
        Height = 23
        Enabled = False
        TabOrder = 0
        OnChange = EdtNCMChange
      end
      object EdtNCMNCM: TEdit
        Left = 122
        Top = 48
        Width = 109
        Height = 23
        Enabled = False
        TabOrder = 1
      end
      object CBOrigem: TComboBox
        Left = 89
        Top = 88
        Width = 208
        Height = 23
        Style = csDropDownList
        Enabled = False
        TabOrder = 2
        OnDropDown = CBOrigemDropDown
      end
    end
  end
end
