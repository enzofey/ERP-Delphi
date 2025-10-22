unit EditorRelatorioForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  frxSmartMemo, frxClass, frxDBSet, frCoreClasses, frxExportBaseDialog, frxExportPDF, frxBarcode;

type
  TEditorRelatorioFM = class(TForm)
    Panel1: TPanel;
    ListaRelatorios: TListBox;
    btnFechar: TButton;
    frxReport: TfrxReport;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure ListaRelatoriosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditorRelatorioFM: TEditorRelatorioFM;

implementation

{$R *.dfm}

procedure TEditorRelatorioFM.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
  Parent.Free;
end;

procedure TEditorRelatorioFM.FormShow(Sender: TObject);
var SR: TSearchRec;
begin
 ListaRelatorios.Items.Clear;
 if FindFirst('C:\Projetos\Controle de Estoque\FR3\*.fr3', faAnyFile, SR) = 0 then begin
  repeat
   ListaRelatorios.Items.Add(SR.Name);
  until FindNext(SR) <> 0;
  FindClose(SR);
 end;
end;

procedure TEditorRelatorioFM.ListaRelatoriosDblClick(Sender: TObject);
var RelPath: string;
begin
 if ListaRelatorios.ItemIndex >= 0 then begin
  RelPath := 'C:\Projetos\Controle de Estoque\FR3\' +
  ListaRelatorios.Items[ListaRelatorios.ItemIndex];
  frxReport.LoadFromFile(RelPath);
  frxReport.DesignReport;
 end;
end;
end.
