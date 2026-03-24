object CadTamanho: TCadTamanho
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'CadTamanho'
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
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1862
    Height = 956
    ActivePage = PageCadastro
    Align = alClient
    TabOrder = 0
    object PageAcesso: TTabSheet
      Caption = 'Acesso'
      object lblAcessoCodigo: TLabel
        Left = 40
        Top = 48
        Width = 42
        Height = 15
        Caption = 'C'#243'digo:'
      end
      object SBConsTamanho: TSpeedButton
        Left = 279
        Top = 45
        Width = 23
        Height = 23
        OnClick = SBConsTamanhoClick
      end
      object EdtAcessoCodigo: TEdit
        Left = 88
        Top = 45
        Width = 33
        Height = 23
        TabOrder = 0
        OnChange = EdtAcessoCodigoChange
      end
      object RGAcessoAtivo: TRadioGroup
        Left = 40
        Top = 3
        Width = 262
        Height = 36
        Caption = 'Ativo:'
        Columns = 3
        Items.Strings = (
          'Ativos'
          'Inativos'
          'Todos')
        TabOrder = 1
      end
      object btnAcessoFechar: TButton
        Left = 308
        Top = 45
        Width = 89
        Height = 26
        Caption = 'Fechar'
        TabOrder = 2
        OnClick = btnFecharClick
      end
      object btnAcessoConsultar: TButton
        Left = 308
        Top = 13
        Width = 89
        Height = 26
        Caption = 'Consultar'
        TabOrder = 3
        OnClick = btnAcessoConsultarClick
      end
      object EdtAcessoDescricao: TEdit
        Left = 127
        Top = 45
        Width = 146
        Height = 23
        Enabled = False
        TabOrder = 4
      end
      object AcessoGrid: TDBGrid
        Left = 40
        Top = 96
        Width = 1777
        Height = 793
        DataSource = CadTamanhoDM.dsAcesso
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object PageCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object lblAtivo: TLabel
        Left = 608
        Top = 48
        Width = 31
        Height = 15
        Caption = 'Ativo:'
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
        Top = 80
        Width = 54
        Height = 15
        Caption = 'Descri'#231#227'o:'
      end
      object btnAlterar: TButton
        Left = 191
        Top = 832
        Width = 145
        Height = 57
        Caption = 'Alterar'
        TabOrder = 0
        OnClick = btnAlterarClick
      end
      object btnConsultar: TButton
        Left = 342
        Top = 832
        Width = 145
        Height = 57
        Caption = 'Consultar'
        TabOrder = 1
        OnClick = btnConsultarClick
      end
      object btnDesistir: TButton
        Left = 191
        Top = 832
        Width = 145
        Height = 57
        Caption = 'Desistir'
        TabOrder = 2
        Visible = False
        OnClick = btnDesistirClick
      end
      object btnExcluir: TButton
        Left = 493
        Top = 832
        Width = 145
        Height = 57
        Caption = 'Excluir'
        TabOrder = 3
        OnClick = btnExcluirClick
      end
      object btnFechar: TButton
        Left = 1668
        Top = 832
        Width = 145
        Height = 57
        Caption = 'Fechar'
        TabOrder = 4
        OnClick = btnFecharClick
      end
      object btnGravarAlterar: TButton
        Left = 40
        Top = 832
        Width = 145
        Height = 57
        Caption = 'Gravar'
        TabOrder = 5
        Visible = False
        OnClick = btnGravarAlterarClick
      end
      object btnGravarIncluir: TButton
        Left = 40
        Top = 832
        Width = 145
        Height = 57
        Caption = 'Gravar'
        TabOrder = 6
        Visible = False
        OnClick = btnGravarIncluirClick
      end
      object btnIncluir: TButton
        Left = 40
        Top = 832
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
      object EdtCodigo: TEdit
        Left = 100
        Top = 45
        Width = 121
        Height = 23
        Enabled = False
        TabOrder = 9
      end
      object EdtDescricao: TEdit
        Left = 100
        Top = 77
        Width = 121
        Height = 23
        Enabled = False
        TabOrder = 10
      end
    end
  end
end
