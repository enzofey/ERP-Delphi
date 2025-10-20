object CadCor: TCadCor
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'CadCor'
  ClientHeight = 620
  ClientWidth = 930
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
    Width = 930
    Height = 620
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
    object CBAtivo: TCheckBox
      Left = 645
      Top = 48
      Width = 20
      Height = 17
      Enabled = False
      TabOrder = 0
    end
    object EdtCodigo: TEdit
      Left = 100
      Top = 45
      Width = 121
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object EdtDescricao: TEdit
      Left = 100
      Top = 77
      Width = 121
      Height = 23
      Enabled = False
      TabOrder = 2
    end
    object btnIncluir: TButton
      Left = 33
      Top = 496
      Width = 145
      Height = 57
      Caption = 'Incluir'
      TabOrder = 3
      OnClick = btnIncluirClick
    end
    object btnGravarIncluir: TButton
      Left = 33
      Top = 496
      Width = 145
      Height = 57
      Caption = 'Gravar'
      TabOrder = 4
      Visible = False
      OnClick = btnGravarIncluirClick
    end
    object btnAlterar: TButton
      Left = 184
      Top = 496
      Width = 145
      Height = 57
      Caption = 'Alterar'
      TabOrder = 5
      OnClick = btnAlterarClick
    end
    object btnGravarAlterar: TButton
      Left = 33
      Top = 496
      Width = 145
      Height = 57
      Caption = 'Gravar'
      TabOrder = 6
      Visible = False
      OnClick = btnGravarAlterarClick
    end
    object btnConsultar: TButton
      Left = 335
      Top = 496
      Width = 145
      Height = 57
      Caption = 'Consultar'
      TabOrder = 7
      OnClick = btnConsultarClick
    end
    object BtnExcluir: TButton
      Left = 486
      Top = 496
      Width = 145
      Height = 57
      Caption = 'Excluir'
      TabOrder = 8
      OnClick = BtnExcluirClick
    end
    object btnDesistir: TButton
      Left = 184
      Top = 496
      Width = 145
      Height = 57
      Caption = 'Desistir'
      TabOrder = 9
      Visible = False
      OnClick = btnDesistirClick
    end
    object btnFechar: TButton
      Left = 753
      Top = 496
      Width = 145
      Height = 57
      Caption = 'Fechar'
      TabOrder = 10
      OnClick = btnFecharClick
    end
  end
end
