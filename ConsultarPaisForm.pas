unit ConsultarPaisForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  PaisDM;

type
  TConsultarPais = class(TForm)
    Panel1: TPanel;
    btnSelecionarPais: TButton;
    GridPais: TDBGrid;
    procedure btnSelecionarPaisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    PaSigla: String;
    PaPais: String;
    PaAtivo: String;
    PaCodigo_IBGE: string;
  public
   function SelecionarPais: string;
   function Sigla: string;
   function Pais: string;
   function Codigo_IBGE: string;
  end;

var
  ConsultarPais: TConsultarPais;

implementation

{$R *.dfm}

procedure TConsultarPais.btnSelecionarPaisClick(Sender: TObject);
begin
 with CadPaisDM.qryConsultarPais do
 begin
  PaSigla := FieldByName('sigla').AsString;
  PaPais := FieldByName('Pais').AsString;
  PaCodigo_IBGE := FieldByName('Codigo_IBGE').AsString;
 end;
 Close;
end;

procedure TConsultarPais.FormShow(Sender: TObject);
var I: Integer;
begin
 for i := 0 to GridPais.Columns.Count - 1 do
  GridPais.Columns[i].Width := GridPais.Canvas.TextWidth(GridPais.Columns[i].Title.Caption + '     ');
end;

function TConsultarPais.SelecionarPais: string;
begin
  PaCodigo_IBGE := '';
  ShowModal;
  Result := PaCodigo_IBGE;
end;

function TConsultarPais.Sigla: string;
begin
  Result := PaSigla;
end;

function TConsultarPais.Codigo_IBGE: string;
begin
  Result := PaCodigo_IBGE;
end;

function TConsultarPais.Pais: string;
begin
  Result := PaPais;
end;
end.
