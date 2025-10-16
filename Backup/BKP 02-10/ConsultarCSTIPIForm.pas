unit ConsultarCSTIPIForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  CSTIPIDM;

type
  TConsultarCSTIPI = class(TForm)
    Panel1: TPanel;
    btnSelecionarCSTIPI: TButton;
    Grid: TDBGrid;
    procedure btnSelecionarCSTIPIClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    CstIPI: string;
    CstIPIDescricao: string;
  public
    function SelecionarCstIPI: string;
    function Descricao: string;
  end;

var
  ConsultarCSTIPI: TConsultarCSTIPI;

implementation

{$R *.dfm}

Function TConsultarCSTIPI.SelecionarCstIPI: string;
begin
 CstIPI := '';
 ShowModal;
 Result := CstIPI;
end;

Function TConsultarCSTIPI.Descricao: string;
begin
 Result := CstIPIDescricao;
end;

procedure TConsultarCSTIPI.FormShow(Sender: TObject);
var i: integer;
begin
 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TConsultarCSTIPI.btnSelecionarCSTIPIClick(Sender: TObject);
begin
 CstIPI := CadCSTIPIDM.ConsultarCSTIPI.FieldByName('CST').AsString;
 CstIPIDescricao := CadCSTIPIDM.ConsultarCSTIPI.FieldByName('descricao').AsString;
 Close;
end;
end.
