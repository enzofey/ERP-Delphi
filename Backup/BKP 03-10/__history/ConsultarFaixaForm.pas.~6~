unit ConsultarFaixaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  FaixaTamanhoDataModule;

type
  TConsultarFaixa = class(TForm)
    Panel1: TPanel;
    btnSelecionarFaixa: TButton;
    Grid: TDBGrid;
    procedure btnSelecionarFaixaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FaCodigo: String;
    FaDescricao: String;
    FaAtivo: String;
  public
   function SelecionarFaixa: string;
   function descricao: string;
   function codigo: string;
   function Ativo: string;
  end;
var
  ConsultarFaixa: TConsultarFaixa;

implementation

{$R *.dfm}

procedure TConsultarFaixa.btnSelecionarFaixaClick(Sender: TObject);
begin
  FaCodigo := CadFaixaTamanhoDataModule.ConsultarFaixa.FieldByName('codigo').AsString;
  FaDescricao := CadFaixaTamanhoDataModule.ConsultarFaixa.FieldByName('descricao').AsString;
  FaAtivo := CadFaixaTamanhoDataModule.ConsultarFaixa.FieldByName('ativo').AsString;
  Close;
end;

function TConsultarFaixa.SelecionarFaixa: string;
begin
  FaCodigo := '';
  ShowModal;
  Result := FaCodigo;
end;

function TConsultarFaixa.Codigo: string;
begin
  Result := FaCodigo;
end;

function TConsultarFaixa.Descricao: string;
begin
  Result := FaDescricao;
end;

function TConsultarFaixa.Ativo: string;
begin
  Result := FaAtivo;
end;

procedure TConsultarFaixa.FormShow(Sender: TObject);
var I: Integer;
begin
 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;
end.
