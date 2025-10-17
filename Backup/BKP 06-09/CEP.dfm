object CadCEP: TCadCEP
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'CadCEP'
  ClientHeight = 737
  ClientWidth = 1039
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
    Width = 1039
    Height = 737
    Align = alClient
    TabOrder = 0
    object lblCEP: TLabel
      Left = 40
      Top = 72
      Width = 24
      Height = 15
      Caption = 'CEP:'
    end
    object lblCidade: TLabel
      Left = 40
      Top = 112
      Width = 40
      Height = 15
      Caption = 'Cidade:'
    end
    object lblEstado: TLabel
      Left = 40
      Top = 152
      Width = 38
      Height = 15
      Caption = 'Estado:'
    end
    object lblPais: TLabel
      Left = 42
      Top = 192
      Width = 24
      Height = 15
      Caption = 'Pa'#237's:'
    end
    object SBPais: TSpeedButton
      Left = 223
      Top = 189
      Width = 23
      Height = 22
      Enabled = False
      OnClick = SBPaisClick
    end
    object SBEstado: TSpeedButton
      Left = 223
      Top = 150
      Width = 23
      Height = 22
      Enabled = False
      OnClick = SBEstadoClick
    end
    object SBCidade: TSpeedButton
      Left = 223
      Top = 110
      Width = 23
      Height = 22
      Enabled = False
      OnClick = SBCidadeClick
    end
    object lblAtivo: TLabel
      Left = 656
      Top = 48
      Width = 31
      Height = 15
      Caption = 'Ativo:'
    end
    object lblCodigo: TLabel
      Left = 40
      Top = 32
      Width = 42
      Height = 15
      Caption = 'C'#243'digo:'
    end
    object EdtCidade: TEdit
      Left = 96
      Top = 109
      Width = 121
      Height = 23
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdtEstado: TEdit
      Left = 96
      Top = 149
      Width = 121
      Height = 23
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object EdtPais: TEdit
      Left = 96
      Top = 189
      Width = 121
      Height = 23
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object btnIncluir: TButton
      Left = 40
      Top = 608
      Width = 145
      Height = 57
      Caption = 'Incluir'
      TabOrder = 3
      OnClick = btnIncluirClick
    end
    object btnAlterar: TButton
      Left = 191
      Top = 608
      Width = 145
      Height = 57
      Caption = 'Alterar'
      TabOrder = 4
      OnClick = btnAlterarClick
    end
    object btnGravarIncluir: TButton
      Left = 40
      Top = 608
      Width = 145
      Height = 57
      Caption = 'Gravar'
      TabOrder = 5
      Visible = False
      OnClick = btnGravarIncluirClick
    end
    object btnGravarAlterar: TButton
      Left = 40
      Top = 608
      Width = 145
      Height = 57
      Caption = 'Gravar'
      TabOrder = 6
      Visible = False
      OnClick = btnGravarAlterarClick
    end
    object btnDesistir: TButton
      Left = 191
      Top = 608
      Width = 145
      Height = 57
      Caption = 'Desistir'
      TabOrder = 7
      Visible = False
      OnClick = btnDesistirClick
    end
    object btnConsultar: TButton
      Left = 342
      Top = 608
      Width = 145
      Height = 57
      Caption = 'Consultar'
      TabOrder = 8
      OnClick = btnConsultarClick
    end
    object btnExcluir: TButton
      Left = 493
      Top = 608
      Width = 145
      Height = 57
      Caption = 'Excluir'
      TabOrder = 9
      OnClick = btnExcluirClick
    end
    object CBAtivo: TCheckBox
      Left = 693
      Top = 48
      Width = 20
      Height = 17
      Enabled = False
      TabOrder = 10
    end
    object btnFechar: TButton
      Left = 860
      Top = 608
      Width = 145
      Height = 57
      Caption = 'Fechar'
      TabOrder = 11
      OnClick = btnFecharClick
    end
    object EdtCEP: TEdit
      Left = 96
      Top = 69
      Width = 121
      Height = 23
      Enabled = False
      MaxLength = 8
      NumbersOnly = True
      TabOrder = 12
    end
    object EdtCodigo: TEdit
      Left = 96
      Top = 29
      Width = 121
      Height = 23
      Enabled = False
      MaxLength = 8
      NumbersOnly = True
      TabOrder = 13
    end
  end
end
