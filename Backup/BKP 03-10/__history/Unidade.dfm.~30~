object CadUnidade: TCadUnidade
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'CadUnidade'
  ClientHeight = 956
  ClientWidth = 1862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Pages: TPageControl
    Left = 0
    Top = 0
    Width = 1862
    Height = 956
    ActivePage = CadastroPage
    Align = alClient
    TabOrder = 0
    object CadastroPage: TTabSheet
      Caption = 'Cadastro'
      object lblAtivo: TLabel
        Left = 342
        Top = 48
        Width = 31
        Height = 15
        Caption = 'Ativo:'
      end
      object lblDescricao: TLabel
        Left = 40
        Top = 88
        Width = 54
        Height = 15
        Caption = 'Descri'#231#227'o:'
      end
      object lblUnidade: TLabel
        Left = 40
        Top = 48
        Width = 47
        Height = 15
        Caption = 'Unidade:'
      end
      object btnAlterar: TButton
        Left = 191
        Top = 834
        Width = 145
        Height = 57
        Caption = 'Alterar'
        TabOrder = 0
        OnClick = btnAlterarClick
      end
      object btnDesistir: TButton
        Left = 191
        Top = 834
        Width = 145
        Height = 57
        Caption = 'Desistir'
        TabOrder = 1
        Visible = False
        OnClick = btnDesistirClick
      end
      object btnExcluir: TButton
        Left = 342
        Top = 834
        Width = 145
        Height = 57
        Caption = 'Excluir'
        TabOrder = 2
        OnClick = btnExcluirClick
      end
      object btnFechar: TButton
        Left = 1679
        Top = 834
        Width = 145
        Height = 57
        Caption = 'Fechar'
        TabOrder = 3
        OnClick = btnFecharClick
      end
      object btnGravarAlterar: TButton
        Left = 40
        Top = 835
        Width = 145
        Height = 57
        Caption = 'Gravar'
        TabOrder = 4
        Visible = False
        OnClick = btnGravarAlterarClick
      end
      object btnGravarIncluir: TButton
        Left = 40
        Top = 835
        Width = 145
        Height = 57
        Caption = 'Gravar'
        TabOrder = 5
        Visible = False
        OnClick = btnGravarIncluirClick
      end
      object btnIncluir: TButton
        Left = 40
        Top = 835
        Width = 145
        Height = 57
        Caption = 'Incluir'
        TabOrder = 6
        OnClick = btnIncluirClick
      end
      object CBAtivo: TCheckBox
        Left = 379
        Top = 48
        Width = 20
        Height = 17
        Enabled = False
        TabOrder = 7
      end
      object EdtDescricao: TEdit
        Left = 100
        Top = 85
        Width = 121
        Height = 23
        Enabled = False
        TabOrder = 8
      end
      object EdtUnidade: TEdit
        Left = 100
        Top = 45
        Width = 121
        Height = 23
        Enabled = False
        TabOrder = 9
      end
      object Grid: TDBGrid
        Left = 40
        Top = 133
        Width = 1784
        Height = 668
        DataSource = CadUnidadeDM.dsGridQuery
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
end
