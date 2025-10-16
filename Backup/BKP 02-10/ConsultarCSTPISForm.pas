unit ConsultarCSTPISForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  CSTPISDM;

type
  TConsultarCSTPIS = class(TForm)
    Panel1: TPanel;
    btnSelecionarCSTPIS: TButton;
    Grid: TDBGrid;
    procedure btnSelecionarCSTPISClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    PisCST: string;
    PisCSTDescricao: string;
  public
    function SelecionarPisCST: string;
    function descricao: string;
  end;

var
  ConsultarCSTPIS: TConsultarCSTPIS;

implementation

{$R *.dfm}

function TConsultarCSTPIS.SelecionarPisCST: string;
begin
  PisCST := '';
  ShowModal;
  Result := PisCST;
end;

function TConsultarCSTPIS.Descricao: string;
begin
  Result := PisCSTDescricao;
end;

procedure TConsultarCSTPIS.FormShow(Sender: TObject);
var i: integer;
begin
 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TConsultarCSTPIS.btnSelecionarCSTPISClick(Sender: TObject);
begin
 PisCST := CadCSTPISDM.ConsultarCSTPIS.FieldByName('CST').AsString;
 PisCSTDescricao := CadCSTPISDM.ConsultarCSTPIS.FieldByName('descricao').AsString;
 Close;
end;
end.
