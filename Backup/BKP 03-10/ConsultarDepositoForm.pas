unit ConsultarDepositoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, DepositoDM;

type
  TConsultarDeposito = class(TForm)
    Panel1: TPanel;
    GridConsultaDeposito: TDBGrid;
    BtnSelecionarDeposito: TButton;
    procedure BtnSelecionarDepositoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    DCodigo: string;
    DDescricao: string;
    DAtivo: string;
  public
    function SelecionarDeposito: string;
    function Descricao: string;
    function Ativo: string;
  end;

var
  ConsultarDeposito: TConsultarDeposito;

implementation

{$R *.dfm}

function TConsultarDeposito.SelecionarDeposito: string;
begin
  DCodigo := '';
  ShowModal;
  Result := DCodigo;
end;

function TConsultarDeposito.Descricao: string;
begin
  Result := DDescricao;
end;

function TConsultarDeposito.Ativo: string;
begin
  Result := DAtivo;
end;

procedure TConsultarDeposito.FormShow(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to GridConsultaDeposito.Columns.Count - 1 do
    GridConsultaDeposito.Columns[i].Width := GridConsultaDeposito.Canvas.TextWidth(GridConsultaDeposito.Columns[i].Title.Caption + '     ');
end;

procedure TConsultarDeposito.BtnSelecionarDepositoClick(Sender: TObject);
begin
 with CadDepositoDM.qryConsultarDeposito do
 begin
  DCodigo := FieldByName('codigo').AsString;
  DDescricao := FieldByName('descricao').AsString;
  DAtivo := FieldByName('ativo').AsString;
 end;
  Close;
end;
end.
