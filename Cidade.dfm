object CadCidade: TCadCidade
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'CadCidade'
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
  object Pages: TPageControl
    Left = 0
    Top = 0
    Width = 1862
    Height = 956
    ActivePage = CadastroPage
    Align = alClient
    TabOrder = 0
    object AcessoPage: TTabSheet
      Caption = 'Acesso'
      object lblAcessoEstado: TLabel
        Left = 40
        Top = 82
        Width = 38
        Height = 15
        Caption = 'Estado:'
      end
      object lblAcessoPais: TLabel
        Left = 40
        Top = 111
        Width = 24
        Height = 15
        Caption = 'Pa'#237's:'
      end
      object SBConsPais: TSpeedButton
        Left = 279
        Top = 108
        Width = 23
        Height = 23
        OnClick = SBConsPaisClick
      end
      object SBConsEstado: TSpeedButton
        Left = 279
        Top = 79
        Width = 23
        Height = 23
        OnClick = SBConsEstadoClick
      end
      object lblAcessoCidade: TLabel
        Left = 40
        Top = 53
        Width = 40
        Height = 15
        Caption = 'Cidade:'
      end
      object SBConsCidade: TSpeedButton
        Left = 279
        Top = 50
        Width = 23
        Height = 23
        OnClick = SBConsCidadeClick
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
        TabOrder = 0
      end
      object EdtAcessoSiglaEstado: TEdit
        Left = 82
        Top = 79
        Width = 41
        Height = 23
        TabOrder = 1
        OnChange = EdtAcessoSiglaEstadoChange
      end
      object EdtAcessoEstado: TEdit
        Left = 129
        Top = 79
        Width = 144
        Height = 23
        Enabled = False
        TabOrder = 2
      end
      object EdtAcessoSiglaPais: TEdit
        Left = 82
        Top = 108
        Width = 41
        Height = 23
        TabOrder = 3
        OnChange = EdtAcessoSiglaPaisChange
      end
      object EdtAcessoPais: TEdit
        Left = 129
        Top = 108
        Width = 144
        Height = 23
        Enabled = False
        TabOrder = 4
      end
      object btnAcessoFechar: TButton
        Left = 348
        Top = 45
        Width = 89
        Height = 26
        Caption = 'Fechar'
        TabOrder = 5
        OnClick = btnFecharClick
      end
      object btnAcessoConsultar: TButton
        Left = 348
        Top = 13
        Width = 89
        Height = 26
        Caption = 'Consultar'
        TabOrder = 6
        OnClick = btnAcessoConsultarClick
      end
      object EdtAcessoCodigo: TEdit
        Left = 82
        Top = 50
        Width = 41
        Height = 23
        TabOrder = 7
        OnChange = EdtAcessoCodigoChange
      end
      object EdtAcessoCidade: TEdit
        Left = 129
        Top = 50
        Width = 144
        Height = 23
        Enabled = False
        TabOrder = 8
      end
      object AcessoGrid: TDBGrid
        Left = 48
        Top = 200
        Width = 1769
        Height = 689
        DataSource = CadCidadeDM.dsAcesso
        TabOrder = 9
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object CadastroPage: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object lblAtivo: TLabel
        Left = 696
        Top = 51
        Width = 31
        Height = 15
        Caption = 'Ativo:'
      end
      object lblCidade: TLabel
        Left = 40
        Top = 80
        Width = 40
        Height = 15
        Caption = 'Cidade:'
      end
      object lblCodigoIBGE: TLabel
        Left = 40
        Top = 51
        Width = 69
        Height = 15
        Caption = 'C'#243'digo IBGE:'
      end
      object lblEstado: TLabel
        Left = 40
        Top = 109
        Width = 38
        Height = 15
        Caption = 'Estado:'
      end
      object lblPais: TLabel
        Left = 40
        Top = 138
        Width = 24
        Height = 15
        Caption = 'Pa'#237's:'
      end
      object SBPais: TSpeedButton
        Left = 266
        Top = 135
        Width = 23
        Height = 23
        Enabled = False
        OnClick = SBPaisClick
      end
      object SBEstado: TSpeedButton
        Left = 266
        Top = 106
        Width = 23
        Height = 23
        Enabled = False
        OnClick = SBEstadoClick
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
        Left = 1674
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
        Left = 733
        Top = 51
        Width = 20
        Height = 17
        Enabled = False
        TabOrder = 8
      end
      object EdtCidade: TEdit
        Left = 99
        Top = 77
        Width = 121
        Height = 23
        Enabled = False
        TabOrder = 9
      end
      object EdtCodigoIBGE: TEdit
        Left = 115
        Top = 48
        Width = 121
        Height = 23
        Enabled = False
        MaxLength = 7
        NumbersOnly = True
        TabOrder = 10
      end
      object EdtSiglaEstado: TEdit
        Left = 99
        Top = 106
        Width = 38
        Height = 23
        Enabled = False
        TabOrder = 11
        OnChange = EdtSiglaEstadoChange
      end
      object EdtCodigo_IBGEPais: TEdit
        Left = 99
        Top = 135
        Width = 38
        Height = 23
        Enabled = False
        TabOrder = 12
        OnChange = EdtCodigo_IBGEPaisChange
      end
      object EdtEstado: TEdit
        Left = 143
        Top = 106
        Width = 117
        Height = 23
        Enabled = False
        ReadOnly = True
        TabOrder = 13
      end
      object EdtPais: TEdit
        Left = 143
        Top = 135
        Width = 117
        Height = 23
        Enabled = False
        ReadOnly = True
        TabOrder = 14
      end
    end
  end
end
