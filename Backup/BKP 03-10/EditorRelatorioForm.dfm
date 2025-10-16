object EditorRelatorioFM: TEditorRelatorioFM
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'EditorRelatorioFM'
  ClientHeight = 977
  ClientWidth = 1878
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Visible = True
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1878
    Height = 977
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1862
    ExplicitHeight = 956
    object ListaRelatorios: TListBox
      Left = 24
      Top = 24
      Width = 353
      Height = 929
      ItemHeight = 15
      TabOrder = 0
      OnDblClick = ListaRelatoriosDblClick
    end
    object btnFechar: TButton
      Left = 1704
      Top = 896
      Width = 145
      Height = 57
      Caption = 'Fechar'
      TabOrder = 1
      OnClick = btnFecharClick
    end
  end
  object frxReport: TfrxReport
    Version = '2025.2.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45933.807025219910000000
    ReportOptions.LastChange = 45933.807025219910000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 824
    Top = 520
    Datasets = <>
    Variables = <>
    Style = <>
    Watermarks = <>
  end
end
