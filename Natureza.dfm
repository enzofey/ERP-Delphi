object CadNatureza: TCadNatureza
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'CadNatureza'
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
      object SBConsCSTICMS: TSpeedButton
        Left = 287
        Top = 74
        Width = 23
        Height = 23
        OnClick = SBConsCSTICMSClick
      end
      object lblAcessoCSTIPI: TLabel
        Left = 318
        Top = 49
        Width = 39
        Height = 15
        Caption = 'CST IPI:'
      end
      object SBConsCSTIPI: TSpeedButton
        Left = 548
        Top = 45
        Width = 23
        Height = 23
        OnClick = SBConsCSTIPIClick
      end
      object lblAcessoCSTICMS: TLabel
        Left = 40
        Top = 77
        Width = 54
        Height = 15
        Caption = 'CST ICMS:'
      end
      object lblAcessoNatureza: TLabel
        Left = 40
        Top = 48
        Width = 50
        Height = 15
        Caption = 'Natureza:'
      end
      object SBConsNatureza: TSpeedButton
        Left = 287
        Top = 45
        Width = 23
        Height = 23
        OnClick = SBConsNaturezaClick
      end
      object SBAcessoClearIndIE: TSpeedButton
        Left = 511
        Top = 103
        Width = 23
        Height = 23
      end
      object SBConsCSOSN: TSpeedButton
        Left = 287
        Top = 103
        Width = 23
        Height = 23
        OnClick = SBConsCSOSNClick
      end
      object lblAcessoENQIPI: TLabel
        Left = 316
        Top = 77
        Width = 43
        Height = 15
        Caption = 'ENQ IPI:'
      end
      object SBConsENQIPI: TSpeedButton
        Left = 548
        Top = 74
        Width = 23
        Height = 23
        OnClick = SBConsENQIPIClick
      end
      object lblAcessoCSOSN: TLabel
        Left = 42
        Top = 106
        Width = 41
        Height = 15
        Caption = 'CSOSN:'
      end
      object lblAcessoCSTPIS: TLabel
        Left = 316
        Top = 106
        Width = 42
        Height = 15
        Caption = 'CST PIS:'
      end
      object SBConsCSTPIS: TSpeedButton
        Left = 548
        Top = 103
        Width = 23
        Height = 23
        OnClick = SBConsCSTPISClick
      end
      object lblAcessoCSTCOFINS: TLabel
        Left = 576
        Top = 48
        Width = 67
        Height = 15
        Caption = 'CST COFINS:'
      end
      object SBConsCSTCOFINS: TSpeedButton
        Left = 832
        Top = 45
        Width = 23
        Height = 23
        OnClick = SBConsCSTCOFINSClick
      end
      object EdtAcessoDescricaoCSTICMS: TEdit
        Left = 151
        Top = 74
        Width = 130
        Height = 23
        Enabled = False
        TabOrder = 0
      end
      object EdtAcessoCSTICMS: TEdit
        Left = 104
        Top = 74
        Width = 41
        Height = 23
        TabOrder = 1
        OnChange = EdtAcessoCSTICMSChange
      end
      object AcessoGrid: TDBGrid
        Left = 40
        Top = 152
        Width = 1769
        Height = 729
        DataSource = CadNaturezaDM.dsAcesso
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object EdtAcessoDescricaoNatureza: TEdit
        Left = 151
        Top = 45
        Width = 130
        Height = 23
        Enabled = False
        TabOrder = 3
      end
      object btnAcessoFechar: TButton
        Left = 577
        Top = 106
        Width = 89
        Height = 26
        Caption = 'Fechar'
        TabOrder = 4
        OnClick = btnFecharClick
      end
      object btnAcessoConsultar: TButton
        Left = 577
        Top = 74
        Width = 89
        Height = 26
        Caption = 'Consultar'
        TabOrder = 5
        OnClick = btnAcessoConsultarClick
      end
      object EdtAcessoCSOSN: TEdit
        Left = 104
        Top = 103
        Width = 41
        Height = 23
        TabOrder = 6
        OnChange = EdtAcessoCSOSNChange
      end
      object EdtAcessoDescricaoCSOSN: TEdit
        Left = 151
        Top = 103
        Width = 130
        Height = 23
        Enabled = False
        TabOrder = 7
      end
      object EdtAcessoDescricaoENQIPI: TEdit
        Left = 412
        Top = 74
        Width = 130
        Height = 23
        Enabled = False
        TabOrder = 8
      end
      object EdtAcessoCSTIPI: TEdit
        Left = 365
        Top = 45
        Width = 41
        Height = 23
        TabOrder = 9
        OnChange = EdtAcessoCSTIPIChange
      end
      object EdtAcessoDescricaoCSTIPI: TEdit
        Left = 412
        Top = 45
        Width = 130
        Height = 23
        Enabled = False
        TabOrder = 10
      end
      object EdtAcessoENQIPI: TEdit
        Left = 365
        Top = 74
        Width = 41
        Height = 23
        TabOrder = 11
        OnChange = EdtAcessoENQIPIChange
      end
      object RGAcessoAtivo: TRadioGroup
        Left = 40
        Top = 3
        Width = 270
        Height = 36
        Caption = 'Ativo:'
        Columns = 3
        Items.Strings = (
          'Ativos'
          'Inativos'
          'Todos')
        TabOrder = 12
      end
      object EdtAcessoNatureza: TEdit
        Left = 104
        Top = 45
        Width = 41
        Height = 23
        TabOrder = 13
        OnChange = EdtAcessoNaturezaChange
      end
      object EdtAcessoCSTPIS: TEdit
        Left = 365
        Top = 103
        Width = 41
        Height = 23
        TabOrder = 14
        OnChange = EdtAcessoCSTPISChange
      end
      object EdtAcessoDescricaoCSTPIS: TEdit
        Left = 412
        Top = 103
        Width = 130
        Height = 23
        Enabled = False
        TabOrder = 15
      end
      object EdtAcessoCSTCOFINS: TEdit
        Left = 649
        Top = 45
        Width = 41
        Height = 23
        TabOrder = 16
        OnChange = EdtAcessoCSTCOFINSChange
      end
      object EdtAcessoDescricaoCSTCOFINS: TEdit
        Left = 696
        Top = 45
        Width = 130
        Height = 23
        Enabled = False
        TabOrder = 17
      end
      object RGAcessoTipo: TRadioGroup
        Left = 316
        Top = 3
        Width = 255
        Height = 36
        Caption = 'Tipo:'
        Columns = 3
        Items.Strings = (
          'Entrada'
          'Sa'#237'da'
          'Todos')
        TabOrder = 18
      end
    end
    object CadastroPage: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object lblAliq_Cred_Pres: TLabel
        Left = 254
        Top = 623
        Width = 107
        Height = 15
        Caption = 'Al'#237'quota Cred. Pres.:'
      end
      object lblAliqCOFINS: TLabel
        Left = 40
        Top = 505
        Width = 48
        Height = 15
        Caption = 'Al'#237'quota:'
      end
      object lblAliqICMS: TLabel
        Left = 40
        Top = 346
        Width = 48
        Height = 15
        Caption = 'Al'#237'quota:'
      end
      object lblAliqIPI: TLabel
        Left = 328
        Top = 346
        Width = 48
        Height = 15
        Caption = 'Al'#237'quota:'
      end
      object lblAliqPIS: TLabel
        Left = 40
        Top = 450
        Width = 48
        Height = 15
        Caption = 'Al'#237'quota:'
      end
      object lblAtivo: TLabel
        Left = 616
        Top = 40
        Width = 31
        Height = 15
        Caption = 'Ativo:'
      end
      object lblcBenef: TLabel
        Left = 40
        Top = 594
        Width = 39
        Height = 15
        Caption = 'cBenef:'
      end
      object lblcCredPres: TLabel
        Left = 40
        Top = 623
        Width = 56
        Height = 15
        Caption = 'cCredPres:'
      end
      object lblCSOSN: TLabel
        Left = 40
        Top = 317
        Width = 41
        Height = 15
        Caption = 'CSOSN:'
      end
      object lblCSTCOFINS: TLabel
        Left = 40
        Top = 479
        Width = 67
        Height = 15
        Caption = 'CST COFINS:'
      end
      object lblCSTICMS: TLabel
        Left = 40
        Top = 288
        Width = 54
        Height = 15
        Caption = 'CST ICMS:'
      end
      object lblCSTIPI: TLabel
        Left = 328
        Top = 288
        Width = 39
        Height = 15
        Caption = 'CST IPI:'
      end
      object lblCSTPIS: TLabel
        Left = 40
        Top = 421
        Width = 42
        Height = 15
        Caption = 'CST PIS:'
      end
      object lblDescricao: TLabel
        Left = 40
        Top = 80
        Width = 54
        Height = 15
        Caption = 'Descri'#231#227'o:'
      end
      object lblEnquadraIPI: TLabel
        Left = 328
        Top = 317
        Width = 69
        Height = 15
        Caption = 'Enquadra IPI:'
      end
      object lblNatureza: TLabel
        Left = 40
        Top = 40
        Width = 50
        Height = 15
        Caption = 'Natureza:'
      end
      object lblTipo: TLabel
        Left = 235
        Top = 40
        Width = 26
        Height = 15
        Caption = 'Tipo:'
      end
      object SBCSOSN: TSpeedButton
        Left = 215
        Top = 314
        Width = 23
        Height = 23
        Enabled = False
        OnClick = SBCSOSNClick
      end
      object SBCSTCOFINS: TSpeedButton
        Left = 240
        Top = 476
        Width = 23
        Height = 23
        Enabled = False
        OnClick = SBCSTCOFINSClick
      end
      object SBCSTICMS: TSpeedButton
        Left = 215
        Top = 285
        Width = 23
        Height = 23
        Enabled = False
        OnClick = SBCSTICMSClick
      end
      object SBCSTIPI: TSpeedButton
        Left = 530
        Top = 285
        Width = 23
        Height = 23
        Enabled = False
        OnClick = SBCSTIPIClick
      end
      object SBCSTPIS: TSpeedButton
        Left = 241
        Top = 418
        Width = 23
        Height = 23
        Enabled = False
        OnClick = SBCSTPISClick
      end
      object SBENQIPI: TSpeedButton
        Left = 530
        Top = 314
        Width = 23
        Height = 23
        Enabled = False
        OnClick = SBENQIPIClick
      end
      object lblGeraDUPL: TLabel
        Left = 327
        Top = 40
        Width = 58
        Height = 15
        Caption = 'Gera Dupl.:'
      end
      object lblMovEstoque: TLabel
        Left = 458
        Top = 40
        Width = 51
        Height = 15
        Caption = 'Mov. Est.:'
      end
      object btnAlterar: TButton
        Left = 191
        Top = 848
        Width = 145
        Height = 57
        Caption = 'Alterar'
        TabOrder = 0
        OnClick = btnAlterarClick
      end
      object BtnConsultar: TButton
        Left = 493
        Top = 848
        Width = 145
        Height = 57
        Caption = 'Consultar'
        TabOrder = 1
        OnClick = BtnConsultarClick
      end
      object BtnDesistir: TButton
        Left = 191
        Top = 848
        Width = 145
        Height = 57
        Caption = 'Desistir'
        TabOrder = 2
        Visible = False
        OnClick = BtnDesistirClick
      end
      object BtnExcluir: TButton
        Left = 342
        Top = 848
        Width = 145
        Height = 57
        Caption = 'Excluir'
        TabOrder = 3
        OnClick = BtnExcluirClick
      end
      object btnFechar: TButton
        Left = 1680
        Top = 848
        Width = 145
        Height = 57
        Caption = 'Fechar'
        TabOrder = 4
        OnClick = btnFecharClick
      end
      object BtnGravarAlterar: TButton
        Left = 40
        Top = 848
        Width = 145
        Height = 57
        Caption = 'Gravar'
        TabOrder = 5
        Visible = False
        OnClick = BtnGravarAlterarClick
      end
      object BtnGravarIncluir: TButton
        Left = 40
        Top = 848
        Width = 145
        Height = 57
        Caption = 'Gravar'
        TabOrder = 6
        Visible = False
        OnClick = BtnGravarIncluirClick
      end
      object btnIncluir: TButton
        Left = 40
        Top = 848
        Width = 145
        Height = 57
        Caption = 'Incluir'
        TabOrder = 7
        OnClick = btnIncluirClick
      end
      object CBAtivo: TCheckBox
        Left = 653
        Top = 40
        Width = 20
        Height = 17
        Enabled = False
        TabOrder = 8
      end
      object CBTipo: TComboBox
        Left = 267
        Top = 37
        Width = 38
        Height = 23
        Hint = 
          'Selecione aqui o tipo da natureza, se ela for de sa'#237'da, '#13#10'seleci' +
          'one "S", se for de entrada, selecione "E"'
        Style = csDropDownList
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        Items.Strings = (
          'E'
          'S')
      end
      object EdtAliq_Cred_Pres: TEdit
        Left = 367
        Top = 620
        Width = 42
        Height = 23
        Enabled = False
        MaxLength = 10
        TabOrder = 11
      end
      object EdtAliqCOFINS: TEdit
        Left = 113
        Top = 505
        Width = 49
        Height = 23
        Enabled = False
        TabOrder = 12
      end
      object EdtAliqICMS: TEdit
        Left = 100
        Top = 343
        Width = 49
        Height = 23
        Enabled = False
        TabOrder = 13
      end
      object EdtAliqIPI: TEdit
        Left = 403
        Top = 343
        Width = 49
        Height = 23
        Enabled = False
        TabOrder = 14
      end
      object EdtAliqPIS: TEdit
        Left = 113
        Top = 447
        Width = 49
        Height = 23
        Enabled = False
        TabOrder = 15
      end
      object EdtcBenef: TEdit
        Left = 100
        Top = 591
        Width = 121
        Height = 23
        Enabled = False
        TabOrder = 16
      end
      object EdtcCredPres: TEdit
        Left = 100
        Top = 620
        Width = 121
        Height = 23
        Enabled = False
        TabOrder = 17
      end
      object EdtCSOSN: TEdit
        Left = 100
        Top = 314
        Width = 109
        Height = 23
        Enabled = False
        MaxLength = 3
        TabOrder = 18
      end
      object EdtCSTCOFINS: TEdit
        Left = 113
        Top = 476
        Width = 121
        Height = 23
        Enabled = False
        TabOrder = 19
      end
      object EdtCSTICMS: TEdit
        Left = 100
        Top = 285
        Width = 109
        Height = 23
        Enabled = False
        MaxLength = 2
        TabOrder = 20
      end
      object EdtCSTIPI: TEdit
        Left = 403
        Top = 285
        Width = 121
        Height = 23
        Enabled = False
        MaxLength = 2
        TabOrder = 21
      end
      object EdtCSTPIS: TEdit
        Left = 113
        Top = 418
        Width = 121
        Height = 23
        Enabled = False
        MaxLength = 2
        TabOrder = 22
      end
      object edtDescricao: TEdit
        Left = 100
        Top = 77
        Width = 453
        Height = 23
        Enabled = False
        TabOrder = 23
      end
      object EdtEnqIPI: TEdit
        Left = 403
        Top = 314
        Width = 121
        Height = 23
        Enabled = False
        MaxLength = 3
        TabOrder = 24
      end
      object edtNatureza: TEdit
        Left = 100
        Top = 37
        Width = 121
        Height = 23
        Enabled = False
        TabOrder = 25
      end
      object RGConfiguracoes: TRadioGroup
        Left = 1384
        Top = 64
        Width = 393
        Height = 540
        Caption = 'Configura'#231#245'es'
        TabOrder = 26
      end
      object CBRealizaCalcCredPres: TCheckBox
        Left = 1405
        Top = 96
        Width = 204
        Height = 17
        Caption = 'Realizar c'#225'lculo cr'#233'dito presumido'
        Enabled = False
        TabOrder = 9
      end
      object CBGeraDupl: TComboBox
        Left = 391
        Top = 37
        Width = 38
        Height = 23
        Hint = 
          'Selecione se a natureza ir'#225' gerar duplicatas, caso sim, selecion' +
          'e S,'#13#10'caso n'#227'o, selecione N'
        Style = csDropDownList
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 27
        Items.Strings = (
          'S'
          'N')
      end
      object CBMovEst: TComboBox
        Left = 515
        Top = 37
        Width = 38
        Height = 23
        Hint = 
          'Selecione se a natureza ir'#225' movimentar estoque, caso sim, seleci' +
          'one S,'#13#10'caso n'#227'o, selecione N'
        Style = csDropDownList
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 28
        Items.Strings = (
          'S'
          'N')
      end
    end
  end
end
