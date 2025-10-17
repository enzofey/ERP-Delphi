object CadTamanho: TCadTamanho
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'CadTamanho'
  ClientHeight = 581
  ClientWidth = 1031
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Visible = True
  WindowState = wsMaximized
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1031
    Height = 581
    Align = alClient
    TabOrder = 0
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
    object lblAtivo: TLabel
      Left = 608
      Top = 48
      Width = 31
      Height = 15
      Caption = 'Ativo:'
    end
    object EdtCodigo: TEdit
      Left = 100
      Top = 45
      Width = 121
      Height = 23
      Enabled = False
      TabOrder = 0
    end
    object EdtDescricao: TEdit
      Left = 100
      Top = 77
      Width = 121
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object CBAtivo: TCheckBox
      Left = 645
      Top = 48
      Width = 20
      Height = 17
      Enabled = False
      TabOrder = 2
    end
    object btnIncluir: TButton
      Left = 24
      Top = 464
      Width = 145
      Height = 57
      Caption = 'Incluir'
      TabOrder = 3
      OnClick = btnIncluirClick
    end
    object btnGravarIncluir: TButton
      Left = 24
      Top = 464
      Width = 145
      Height = 57
      Caption = 'Gravar'
      TabOrder = 4
      Visible = False
      OnClick = btnGravarIncluirClick
    end
    object btnGravarAlterar: TButton
      Left = 24
      Top = 464
      Width = 145
      Height = 57
      Caption = 'Gravar'
      TabOrder = 5
      Visible = False
      OnClick = btnGravarAlterarClick
    end
    object btnAlterar: TButton
      Left = 175
      Top = 464
      Width = 145
      Height = 57
      Caption = 'Alterar'
      TabOrder = 6
      OnClick = btnAlterarClick
    end
    object btnDesistir: TButton
      Left = 175
      Top = 464
      Width = 145
      Height = 57
      Caption = 'Desistir'
      TabOrder = 7
      Visible = False
      OnClick = btnDesistirClick
    end
    object btnConsultar: TButton
      Left = 326
      Top = 464
      Width = 145
      Height = 57
      Caption = 'Consultar'
      TabOrder = 8
      OnClick = btnConsultarClick
    end
    object btnExcluir: TButton
      Left = 477
      Top = 464
      Width = 145
      Height = 57
      Caption = 'Excluir'
      TabOrder = 9
      OnClick = btnExcluirClick
    end
    object btnFechar: TButton
      Left = 860
      Top = 464
      Width = 145
      Height = 57
      Caption = 'Fechar'
      TabOrder = 10
      OnClick = btnFecharClick
    end
  end
end
