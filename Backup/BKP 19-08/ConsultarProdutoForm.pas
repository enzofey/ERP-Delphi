unit ConsultarProdutoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls,
  ProdutoDataModule,
  Cor, CorDataModule;

type
  TConsultarProduto = class(TForm)
    Panel1: TPanel;
    GridConsultaCodigo: TDBGrid;
    BtnSelecionarProduto: TButton;
    procedure BtnSelecionarProdutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    PCodigo: string;
    PDescricao: string;
    PAtivo: string;
    PFaixa: string;
    PNCM: string;
    POrigem: string;
    PUniCom: string;
    PBrinde: string;
    PUniVenda: string;
  public
    function SelecionarProduto: string;
    function Descricao: string;
    function Ativo: string;
    function Faixa: string;
    function Codigo: string;
    function NCM: string;
    function Origem: string;
    function UniCom: string;
    function Brinde: string;
    function UniVenda: string;
  end;

var
  ConsultarProduto: TConsultarProduto;

implementation

{$R *.dfm}

Uses Produto;

function TConsultarProduto.SelecionarProduto: string;
begin
  PCodigo := '';
  ShowModal;
  Result := PCodigo;
end;

function TConsultarProduto.Descricao: string;
begin
  Result := PDescricao;
end;

function TConsultarProduto.NCM: string;
begin
  Result := PNCM;
end;

function TConsultarProduto.Ativo: string;
begin
  Result := PAtivo;
end;

function TConsultarProduto.Faixa: string;
begin
  Result := PFaixa;
end;

function TConsultarProduto.Codigo: string;
begin
  Result := PCodigo;
end;

function TConsultarProduto.UniCom: string;
begin
  Result := PUniCom;
end;

function TConsultarProduto.UniVenda: string;
begin
  Result := PUniVenda;
end;

function TConsultarProduto.Brinde: string;
begin
  Result := PBrinde;
end;

function TConsultarProduto.Origem: string;
begin
  Result := POrigem;
end;

procedure TConsultarProduto.FormShow(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to GridConsultaCodigo.Columns.Count - 1 do
    GridConsultaCodigo.Columns[i].Width := GridConsultaCodigo.Canvas.TextWidth(GridConsultaCodigo.Columns[i].Title.Caption + '     ');
end;

procedure TConsultarProduto.BtnSelecionarProdutoClick(Sender: TObject);
begin
  PCodigo := CadProdutoModule.ConsultarProduto.FieldByName('codigo').AsString;
  PDescricao := CadProdutoModule.ConsultarProduto.FieldByName('descricao').AsString;
  PAtivo := CadProdutoModule.ConsultarProduto.FieldByName('ativo').AsString;
  PFaixa := CadProdutoModule.ConsultarProduto.FieldByName('faixa').AsString;
  PNCM := CadProdutoModule.ConsultarProduto.FieldByName('NCM').AsString;
  PUniCom := CadProdutoModule.ConsultarProduto.FieldByName('UniCom').AsString;
  PUniVenda := CadProdutoModule.ConsultarProduto.FieldByName('UniVenda').AsString;
  PBrinde := CadProdutoModule.ConsultarProduto.FieldByName('Brinde').AsString;
  POrigem := CadProdutoModule.ConsultarProduto.FieldByName('Origem').AsString;

  CadCorModule.CorEstoque.Close;
  CadCorModule.CorEstoque.SQL.Clear;
  CadCorModule.CorEstoque.SQL.Text :=
  'select cc.codigo, cc.descricao from cadcor cc ' +
  'inner join estoque es on (es.cor = cc.descricao) ' +
  'inner join cadproduto cp on (es.codigo = cp.codigo) ' +
  'where cp.codigo = :codigo ' +
  'group by cc.codigo, cc.descricao';
  CadCorModule.CorEstoque.ParamByName('codigo').AsString := PCodigo;
  CadCorModule.CorEstoque.Open;
  Close;
end;
end.

