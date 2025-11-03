unit ConsultarCidadeForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids, CidadeDM,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TConsultarCidade = class(TForm)
    Panel1: TPanel;
    Grid: TDBGrid;
    BtnSelecionarCidade: TButton;
    procedure BtnSelecionarCidadeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    CAtivo: string;
    CCidade: string;
    CEstado: string;
    CPais: string;
    CCodigo_IBGE: string;
  public
    function ConsultarCidade: string;
    function Ativo: string;
    function Cidade: string;
    function Estado: string;
    function Pais: string;
    function Codigo_IBGE: string;
  end;

var
  ConsultarCidade: TConsultarCidade;

implementation

{$R *.dfm}

function TConsultarCidade.ConsultarCidade: string;
begin
  CCodigo_IBGE := '';
  ShowModal;
  Result := CCodigo_IBGE;
end;

function TConsultarCidade.Cidade: string;
begin
  Result := CCidade;
end;

function TConsultarCidade.Pais: string;
begin
  Result := CPais;
end;

function TConsultarCidade.Ativo: string;
begin
  Result := CAtivo;
end;

function TConsultarCidade.Estado: string;
begin
  Result := CEstado;
end;

function TConsultarCidade.Codigo_IBGE: string;
begin
  Result := CCodigo_IBGE;
end;

procedure TConsultarCidade.FormShow(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Grid.Columns.Count - 1 do
    Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TConsultarCidade.BtnSelecionarCidadeClick(Sender: TObject);
begin
 with CadCidadeDM.qryConsultarCidade do
 begin
  CCidade := FieldByName('cidade').AsString;
  CPais := FieldByName('pais').AsString;
  CEstado := FieldByName('estado').AsString;
  CAtivo := FieldByName('ativo').AsString;
  CCodigo_IBGE := FieldByName('Codigo_IBGE').AsString;
 end;
 Close;
end;
end.
