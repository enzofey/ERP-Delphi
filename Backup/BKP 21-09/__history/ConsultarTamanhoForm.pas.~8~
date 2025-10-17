unit ConsultarTamanhoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, TamanhoDM;

type
  TConsultarTamanho = class(TForm)
    Panel1: TPanel;
    GridConsultaTamanho: TDBGrid;
    BtnSelecionarDeposito: TButton;
    procedure BtnSelecionarTamanhoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    TCodigo: string;
    TDescricao: string;
    TAtivo: string;
  public
    function SelecionarTamanho: string;
    function Descricao: string;
    function Ativo: string;
  end;

var
  ConsultarTamanho: TConsultarTamanho;

implementation

{$R *.dfm}

function TConsultarTamanho.SelecionarTamanho: string;
begin
  TCodigo := '';
  ShowModal;
  Result := TCodigo;
end;

function TConsultarTamanho.Descricao: string;
begin
  Result := TDescricao;
end;

function TConsultarTamanho.Ativo: string;
begin
  Result := TAtivo;
end;

procedure TConsultarTamanho.FormShow(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to GridConsultaTamanho.Columns.Count - 1 do
    GridConsultaTamanho.Columns[i].Width := GridConsultaTamanho.Canvas.TextWidth(GridConsultaTamanho.Columns[i].Title.Caption + '     ');
end;

procedure TConsultarTamanho.BtnSelecionarTamanhoClick(Sender: TObject);
begin
  TCodigo := CadTamanhoDM.ConsultarTamanho.FieldByName('codigo').AsString;
  TDescricao := CadTamanhoDM.ConsultarTamanho.FieldByName('descricao').AsString;
  TAtivo := CadTamanhoDM.ConsultarTamanho.FieldByName('ativo').AsString;
  Close;
end;
end.
