unit ConsultarCEPForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  CEPDataModule;

type
  TConsultarCEP = class(TForm)
    Panel1: TPanel;
    btnSelecionarCEP: TButton;
    Grid: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure btnSelecionarCEPClick(Sender: TObject);
  private
    CepCep: string;
    CepCidade: string;
    CepEstado: string;
    CepPais: string;
    CepAtivo: string;
  public
    function SelecionarCEP: string;
    function CEP: string;
    function Cidade: string;
    function Estado: string;
    function Pais: string;
    function Ativo: string;
  end;

var
  ConsultarCEP: TConsultarCEP;

implementation

{$R *.dfm}

function TConsultarCEP.SelecionarCEP: string;
begin
  CepCep := '';
  ShowModal;
  Result := CepCep;
end;

function TConsultarCEP.CEP: string;
begin
  Result := CepCep;
end;

function TConsultarCEP.Cidade: string;
begin
  Result := CepCidade;
end;

function TConsultarCEP.Estado: string;
begin
  Result := CepEstado;
end;

function TConsultarCEP.Pais: string;
begin
  Result := CepPais;
end;

function TConsultarCEP.Ativo: string;
begin
  Result := CepAtivo;
end;

procedure TConsultarCEP.btnSelecionarCEPClick(Sender: TObject);
begin
  CepCep := CadCepDataModule.ConsultarCEP.FieldByName('CEP').AsString;
  CepCidade := CadCepDataModule.ConsultarCEP.FieldByName('Cidade').AsString;
  CepEstado := CadCepDataModule.ConsultarCEP.FieldByName('Estado').AsString;
  CepPais := CadCepDataModule.ConsultarCEP.FieldByName('Pais').AsString;
  CepAtivo := CadCepDataModule.ConsultarCEP.FieldByName('ativo').AsString;
  Close;
end;

procedure TConsultarCEP.FormShow(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Grid.Columns.Count - 1 do
    Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;
end.
