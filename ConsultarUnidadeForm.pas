unit ConsultarUnidadeForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  UnidadeDM;

type
  TConsultarUnidade = class(TForm)
    Panel1: TPanel;
    btnSelecionarUnidade: TButton;
    Grid: TDBGrid;
    procedure btnSelecionarUnidadeClick(Sender: TObject);
  private
    UnUnidade: string;
    UnDescricao: string;
    UnAtivo: string;
  public
    function SelecionarUnidade: string;
    function Unidade: string;
    function Descricao: string;
    function Ativo: string;
  end;

var
  ConsultarUnidade: TConsultarUnidade;

implementation

{$R *.dfm}

function TConsultarUnidade.SelecionarUnidade: string;
begin
 UnUnidade := '';
 ShowModal;
 Result := UnUnidade;
end;

function TConsultarUnidade.Unidade: string;
begin
 Result := UnUnidade;
end;

function TConsultarUnidade.Descricao: string;
begin
 Result := UnDescricao;
end;

function TConsultarUnidade.Ativo: string;
begin
 Result := UnAtivo;
end;

procedure TConsultarUnidade.btnSelecionarUnidadeClick(Sender: TObject);
begin
 with CadUnidadeDM.qrySelect do
 begin
  UnUnidade := FieldByName('unidade').AsString;
  UnAtivo := FieldByName('Ativo').AsString;
  UnDescricao := FieldByName('Descricao').AsString;
 end;
 Close;
end;
end.
