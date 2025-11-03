unit ConsultarCEPForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  CEPDM;

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
    CepBairro: string;
    CepRua: string;
    CepComplemento: string;
  public
    function SelecionarCEP: string;
    function CEP: string;
    function Cidade: string;
    function Estado: string;
    function Pais: string;
    function Ativo: string;
    function Bairro: string;
    function Rua: string;
    function Complemento: string;
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

function TConsultarCEP.Bairro: string;
begin
  Result := CepBairro;
end;

function TConsultarCEP.Rua: string;
begin
  Result := CepRua;
end;

function TConsultarCEP.Complemento: string;
begin
  Result := CepComplemento;
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
 with CadCEPDM.qryConsultarCEP do
 begin
  CepCep := FieldByName('CEP').AsString;
  CepCidade := FieldByName('Cidade').AsString;
  CepEstado := FieldByName('Estado').AsString;
  CepPais := FieldByName('Pais').AsString;
  CepAtivo := FieldByName('ativo').AsString;
  CepBairro := FieldByName('Bairro').AsString;
  CepRua := FieldByName('Rua').AsString;
  CepComplemento := FieldByName('Complemento').AsString;
 end;
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
