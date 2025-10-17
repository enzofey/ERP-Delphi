unit ConsultarEstadoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls, EstadoDM,
  Vcl.Grids, Vcl.DBGrids;

type
  TConsultarEstado = class(TForm)
    Panel1: TPanel;
    Grid: TDBGrid;
    btnSelecionarEstado: TButton;
    procedure btnSelecionarEstadoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
   EsCodigo: string;
   EsSigla: string;
   EsEstado: string;
  public
   function SelecionarEstado: string;
   function Codigo: string;
   function Sigla: string;
   function Estado: string;
  end;

var
  ConsultarEstado: TConsultarEstado;

implementation

{$R *.dfm}

function TConsultarEstado.SelecionarEstado: string;
begin
  EsCodigo := '';
  ShowModal;
  Result := EsCodigo;
end;

function TConsultarEstado.Codigo: string;
begin
  Result := EsCodigo;
end;

function TConsultarEstado.Sigla: string;
begin
  Result := EsSigla;
end;

function TConsultarEstado.Estado: string;
begin
  Result := EsEstado;
end;

procedure TConsultarEstado.btnSelecionarEstadoClick(Sender: TObject);
begin
 with CadEstadoDM.qryConsultarEstado do
 begin
  EsCodigo := FieldByName('codigo').AsString;
  EsSigla := FieldByName('sigla').AsString;
  EsEstado := FieldByName('Estado').AsString;
 end;
 Close;
end;

procedure TConsultarEstado.FormShow(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Grid.Columns.Count - 1 do
    Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;
end.
