unit RelEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.ComCtrls,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  RelEstoqueDataModule,
  ConsultarCorForm, CorDataModule,
  ConsultarProdutoForm, ProdutoDataModule,
  ConsultarDepositoForm, DepositoDataModule,
  ConsultarTamanhoForm, TamanhoDataModule;

type
  TRelEstoqueForm = class(TForm)
    Panel1: TPanel;
    Grid: TDBGrid;
    lblCodigo: TLabel;
    lblCor: TLabel;
    lblDeposito: TLabel;
    lblTamanho: TLabel;
    EdtProduto: TEdit;
    EdtCor: TEdit;
    EdtDeposito: TEdit;
    EdtTamanho: TEdit;
    btnConsultar: TButton;
    btnFechar: TButton;
    SBProduto: TSpeedButton;
    SBCor: TSpeedButton;
    SBDeposito: TSpeedButton;
    SBTamanho: TSpeedButton;
    SBApagarProduto: TSpeedButton;
    SBApagarCor: TSpeedButton;
    SBApagarDeposito: TSpeedButton;
    SBApagarTamanho: TSpeedButton;
    procedure btnFecharClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure SBCorClick(Sender: TObject);
    procedure SBProdutoClick(Sender: TObject);
    procedure SBDepositoClick(Sender: TObject);
    procedure SBTamanhoClick(Sender: TObject);
    procedure SBApagarProdutoClick(Sender: TObject);
    procedure SBApagarCorClick(Sender: TObject);
    procedure SBApagarDepositoClick(Sender: TObject);
    procedure SBApagarTamanhoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelEstoqueForm: TRelEstoqueForm;

implementation

{$R *.dfm}

procedure TRelEstoqueForm.btnFecharClick(Sender: TObject);
begin
    begin
    (Parent as TTabSheet).PageControl := nil;
    Parent.Free;
  end;
end;

procedure TRelEstoqueForm.SBCorClick(Sender: TObject);
var
  cor: string;
begin
  CadCorModule.ConsultarCor.Close;
  CadCorModule.ConsultarCor.Open;
  Application.CreateForm(TConsultarCor, ConsultarCor);
  cor := ConsultarCor.SelecionarCor;
  if cor <> '' then
  begin
    EdtCor.Text := cor;
  end;
end;

procedure TRelEstoqueForm.SBDepositoClick(Sender: TObject);
var
  codigo: string;
begin
  CadDepositoDataModule.ConsultarDeposito.Close;
  CadDepositoDataModule.ConsultarDeposito.Open;
  Application.CreateForm(TConsultarDeposito, ConsultarDeposito);
  codigo := ConsultarDeposito.SelecionarDeposito;
  if codigo <> '' then
  begin
    EdtDeposito.Text := codigo;
  end;
end;

procedure TRelEstoqueForm.SBProdutoClick(Sender: TObject);
var
  codigo: string;
begin
  CadProdutoModule.ConsultarProduto.Close;
  CadProdutoModule.ConsultarProduto.Open;
  Application.CreateForm(TConsultarProduto, ConsultarProduto);
  codigo := ConsultarProduto.SelecionarProduto;
  if codigo <> '' then
  begin
    EdtProduto.Text := codigo;
  end;
end;

procedure TRelEstoqueForm.SBApagarCorClick(Sender: TObject);
begin
 EdtCor.Clear;
end;

procedure TRelEstoqueForm.SBApagarDepositoClick(Sender: TObject);
begin
 EdtDeposito.Clear;
end;

procedure TRelEstoqueForm.SBApagarProdutoClick(Sender: TObject);
begin
 EdtProduto.Clear;
end;

procedure TRelEstoqueForm.SBApagarTamanhoClick(Sender: TObject);
begin
 EdtTamanho.Clear;
end;

procedure TRelEstoqueForm.SBTamanhoClick(Sender: TObject);
var
  codigo: string;
begin
  CadDepositoDataModule.ConsultarDeposito.Close;
  CadDepositoDataModule.ConsultarDeposito.Open;
  Application.CreateForm(TConsultarTamanho, ConsultarTamanho);
  codigo := ConsultarTamanho.SelecionarTamanho;
  if codigo <> '' then
  begin
    EdtTamanho.Text := codigo;
  end;
end;

procedure TRelEstoqueForm.btnConsultarClick(Sender: TObject);
var
  i: Integer;
  texto, produto, cor, tamanho, deposito: string;
  temwhere: boolean;
begin
  produto := EdtProduto.Text;
  cor := EdtCor.Text;
  tamanho := EdtTamanho.Text;
  deposito := EdtDeposito.Text;

  EstoqueDataModule.QueryEstoque.Close;
  EstoqueDataModule.QueryEstoque.SQL.Clear;
  EstoqueDataModule.QueryEstoque.SQL.Text :=
    'SELECT es.codigo, es.cor, es.tamanho, es.deposito, es.lote, es.qtde FROM estoque es ' +
    'inner join cadproduto cp on (cp.codigo = es.codigo) ' +
    'inner join cadcor cc on (cc.descricao = es.cor) ' +
    'inner join cadtamanho ct on (ct.codigo = es.tamanho) ' +
    'inner join caddeposito cd on (cd.codigo = es.deposito) ';
    temwhere := False;

  if produto <> '' then
  begin
  if temwhere then begin
    EstoqueDataModule.QueryEstoque.SQL.Add('AND cp.codigo = :codigo');
    EstoqueDataModule.QueryEstoque.ParamByName('codigo').AsString := produto;
  end
  else begin
    EstoqueDataModule.QueryEstoque.SQL.Add('WHERE cp.codigo = :codigo');
    EstoqueDataModule.QueryEstoque.ParamByName('codigo').AsString := produto;
  end;
  end;
  temwhere := True;

  if cor <> '' then
  begin
    if temwhere then begin
      EstoqueDataModule.QueryEstoque.SQL.Add('AND cc.codigo = :cor');
      EstoqueDataModule.QueryEstoque.ParamByName('cor').AsString := cor;
  end
  else begin
    EstoqueDataModule.QueryEstoque.SQL.Add('WHERE cc.codigo = :cor');
    EstoqueDataModule.QueryEstoque.ParamByName('cor').AsString := cor;
  end;
  end;
  temwhere := True;

  if deposito <> '' then
  begin
    if temwhere then begin
      EstoqueDataModule.QueryEstoque.SQL.Add('AND cd.codigo = :deposito');
      EstoqueDataModule.QueryEstoque.ParamByName('deposito').AsString := deposito;
  end
  else begin
    EstoqueDataModule.QueryEstoque.SQL.Add('WHERE cd.codigo = :deposito');
    EstoqueDataModule.QueryEstoque.ParamByName('deposito').AsString := deposito;
  end;
  end;
  temwhere := True;

  if tamanho <> '' then
  begin
    if temwhere then begin
      EstoqueDataModule.QueryEstoque.SQL.Add('AND ct.codigo = :tamanho');
      EstoqueDataModule.QueryEstoque.ParamByName('tamanho').AsString := tamanho;
  end
  else begin
    EstoqueDataModule.QueryEstoque.SQL.Add('WHERE ct.codigo = :tamanho');
    EstoqueDataModule.QueryEstoque.ParamByName('tamanho').AsString := tamanho;
  end;
  end;

  EstoqueDataModule.QueryEstoque.Open;

  for i := 0 to Grid.Columns.Count - 1 do
  begin
    texto := Grid.Columns[i].Title.Caption;

    if Length(Grid.DataSource.DataSet.Fields[i].AsString) > Length(texto) then
      texto := Grid.DataSource.DataSet.Fields[i].AsString;

    Grid.Columns[i].Width := Grid.Canvas.TextWidth(texto + '    ');
  end;
end;
end.
