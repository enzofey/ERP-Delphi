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
    PaCodigo: string;
  public
   function SelecionarPais: string;
   function Sigla: string;
   function Pais: string;
   function Codigo: string;
  end;

var
  ConsultarPais: TConsultarPais;

implementation

{$R *.dfm}

procedure TConsultarPais.btnSelecionarPaisClick(Sender: TObject);
begin
  PaSigla := CadPaisDM.ConsultarPais.FieldByName('sigla').AsString;
  PaPais := CadPaisDM.ConsultarPais.FieldByName('Pais').AsString;
  PaCodigo := CadPaisDM.ConsultarPais.FieldByName('Codigo').AsString;
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
  PaCodigo := '';
  ShowModal;
  Result := PaCodigo;
end;

function TConsultarPais.Sigla: string;
begin
  Result := PaSigla;
end;

function TConsultarPais.Codigo: string;
begin
  Result := PaCodigo;
end;

function TConsultarPais.Pais: string;
begin
  Result := PaPais;
end;
end.
