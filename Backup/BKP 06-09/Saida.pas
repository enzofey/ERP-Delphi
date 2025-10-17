unit Saida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.ComCtrls,
  SaidaDM,
  Log, LogDM,
  GlobalUnit;

type
  TMovSaida = class(TForm)
    Panel1: TPanel;
    btnDesistir: TButton;
    btnGravar: TButton;
    btnIncluir: TButton;
    btnIncluirGrid: TButton;
    CBoxCor: TComboBox;
    CBoxDeposito: TComboBox;
    CBoxProduto: TComboBox;
    CBoxTamanho: TComboBox;
    edtLote: TEdit;
    EdtQtde: TEdit;
    Grid: TStringGrid;
    lblCodigoCor: TLabel;
    lblCodigoDeposito: TLabel;
    lblCodigoProduto: TLabel;
    lblCodigoTamanho: TLabel;
    lblLote: TLabel;
    lblQtde: TLabel;
    btnFechar: TButton;
    procedure FormShow(Sender: TObject);
    procedure CBoxProdutoDropDown(Sender: TObject);
    procedure CBoxCorDropDown(Sender: TObject);
    procedure CBoxTamanhoDropDown(Sender: TObject);
    procedure CBoxDepositoDropDown(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnIncluirGridClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LimparTudo;
  end;

var
  MovSaida: TMovSaida;

implementation

{$R *.dfm}

procedure TMovSaida.LimparTudo;
begin
 CBoxProduto.clear;
 CBoxCor.clear;
 CBoxTamanho.clear;
 EdtLote.clear;
 CBoxDeposito.clear;
 EdtQtde.clear;

 BtnIncluir.visible := True;

 BtnGravar.Visible := False;
 BtnDesistir.Visible := False;
 BtnIncluirGrid.Visible := False;

 CBoxProduto.Enabled := False;
 CBoxDeposito.Enabled := False;
 CBoxTamanho.Enabled := False;
 CBoxCor.Enabled := False;
 EdtQtde.Enabled := False;
 EdtLote.Enabled := False;

 Grid.RowCount := 1
end;

procedure TMovSaida.FormShow(Sender: TObject);
var i: Integer;
begin
 Grid.FixedRows := 0;
 Grid.Cells[0,0] := 'Código';
 Grid.Cells[1,0] := 'Cor';
 Grid.Cells[2,0] := 'Tamanho';
 Grid.Cells[3,0] := 'Lote';
 Grid.Cells[4,0] := 'Depósito';
 Grid.Cells[5,0] := 'Qtde';
end;

procedure TMovSaida.CBoxProdutoDropDown(Sender: TObject);
begin
  CBoxProduto.Items.Clear;

  MovSaidaDM.CBProduto.Close;
  MovSaidaDM.CBProduto.Open;

  while not MovSaidaDM.CBProduto.Eof do
  begin
    CBoxProduto.Items.Add(MovSaidaDM.CBProduto.FieldByName('codigo').AsString);
    MovSaidaDM.CBProduto.Next;
  end;

  MovSaidaDM.CBProduto.Close;
end;

procedure TMovSaida.CBoxCorDropDown(Sender: TObject);
begin
  CBoxCor.Items.Clear;

  MovSaidaDM.CBCor.Close;
  MovSaidaDM.CBCor.Open;

  while not MovSaidaDM.CBCor.Eof do
  begin
    CBoxCor.Items.Add(MovSaidaDM.CBCor.FieldByName('cor').AsString);
    MovSaidaDM.CBCor.Next;
  end;

  MovSaidaDM.CBCor.Close;
end;

procedure TMovSaida.CBoxTamanhoDropDown(Sender: TObject);
begin
  CBoxTamanho.Items.Clear;

  MovSaidaDM.CBTamanho.Close;
  MovSaidaDM.CBTamanho.Open;

  while not MovSaidaDM.CBTamanho.Eof do
  begin
    CBoxTamanho.Items.Add(MovSaidaDM.CBTamanho.FieldByName('codigo').AsString);
    MovSaidaDM.CBTamanho.Next;
  end;

  MovSaidaDM.CBTamanho.Close;
end;

procedure TMovSaida.CBoxDepositoDropDown(Sender: TObject);
begin
  CBoxDeposito.Items.Clear;

  MovSaidaDM.CBDeposito.Close;
  MovSaidaDM.CBDeposito.Open;

  while not MovSaidaDM.CBDeposito.Eof do
  begin
    CBoxDeposito.Items.Add(MovSaidaDM.CBDeposito.FieldByName('deposito').AsString);
    MovSaidaDM.CBDeposito.Next;
  end;

  MovSaidaDM.CBDeposito.Close;
end;

procedure TMovSaida.BtnIncluirClick(Sender: TObject);
begin
  BtnIncluir.Visible := False;

  BtnGravar.Visible := True;
  BtnDesistir.Visible := True;
  BtnIncluirGrid.Visible := True;

  CBoxProduto.Enabled := True;
  CBoxDeposito.Enabled := True;
  CBoxTamanho.Enabled := True;
  CBoxCor.Enabled := True;
  EdtQtde.Enabled :=True;
  EdtLote.Enabled :=True;
end;

procedure TMovSaida.BtnIncluirGridClick(Sender: TObject);
var codigo, cor, tamanho, lote, deposito, qtde: string;
    novalinha: integer;
begin
 IF
 CBoxProduto.Text = '' THEN
 ShowMessage('Codigo não pode ser vazio')
 else begin
 IF
 CBoxCor.Text = '' THEN
 ShowMessage('Cor não pode ser vazia')
 else begin
 IF
 CBoxTamanho.Text = '' THEN
 ShowMessage('Tamanho não pode ser vazio')
 else begin
 IF
 EdtLote.Text = '' THEN
 EdtLote.Text := '000000'
 else begin
 IF
 CBoxDeposito.Text = '' THEN
 ShowMessage('Deposito não pode ser vazio')
 else begin
 IF
 EdtQtde.Text = '' THEN
 ShowMessage('Quantidade não pode ser vazio')
 else begin
 codigo := CBoxProduto.Text;
 cor := CBoxCor.Text;
 tamanho := CBoxTamanho.Text;
 Lote := EdtLote.Text;
 Deposito := CBoxDeposito.Text;
 Qtde := EdtQtde.Text;

 novalinha := Grid.RowCount;
 Grid.RowCount := novalinha + 1;
 Grid.Cells[0, novaLinha] := codigo;
 Grid.Cells[1, novaLinha] := cor;
 Grid.Cells[2, novaLinha] := tamanho;
 Grid.Cells[3, novaLinha] := lote;
 Grid.Cells[4, novaLinha] := deposito;
 Grid.Cells[5, novaLinha] := qtde;

 CBoxProduto.clear;
 CBoxCor.clear;
 CBoxTamanho.clear;
 EdtLote.clear;
 CBoxDeposito.clear;
 EdtQtde.clear;
end;
end;
end;
end;
end;
end;
end;

procedure TMovSaida.BtnGravarClick(Sender: TObject);
var i: Integer;
    codigo, tamanho, cor, deposito, lote, qtde: string;
begin
for i := 1 to Grid.RowCount - 1 do
begin
 codigo   := Grid.Cells[0, i];
 cor      := Grid.Cells[1, i];
 tamanho  := Grid.Cells[2, i];
 lote     := Grid.Cells[3, i];
 deposito := Grid.Cells[4, i];
 qtde     := Grid.Cells[5, i];

 MovSaidaDM.selectQuery.Close;
 MovSaidaDM.selectQuery.SQL.Clear;
 MovSaidaDM.selectQuery.SQL.Text :=
 'SELECT * FROM estoque WHERE codigo=:codigo AND tamanho=:tamanho AND cor=:cor AND deposito=:deposito AND lote=:lote';
 MovSaidaDM.selectQuery.ParamByName('codigo').AsString := codigo;
 MovSaidaDM.selectQuery.ParamByName('tamanho').AsString := tamanho;
 MovSaidaDM.selectQuery.ParamByName('cor').AsString := cor;
 MovSaidaDM.selectQuery.ParamByName('deposito').AsString := deposito;
 MovSaidaDM.selectQuery.ParamByName('lote').AsString := lote;
 MovSaidaDM.selectQuery.Open;

 if MovSaidaDM.selectQuery.IsEmpty then
 begin
 ShowMessage('Não encontrado no Estoque!');
 Limpartudo;
 end
 else begin

 MovSaidaDM.updatequery.SQL.Clear;
 MovSaidaDM.updatequery.SQL.Text :=
 'UPDATE estoque SET qtde = qtde - :qtde ' +
 'WHERE codigo = :codigo AND tamanho = :tamanho AND cor = :cor AND deposito = :deposito AND lote = :lote';
 MovSaidaDM.updatequery.ParamByName('qtde').AsFloat := StrToFloat(qtde);
 MovSaidaDM.updatequery.ParamByName('codigo').AsString := codigo;
 MovSaidaDM.updatequery.ParamByName('tamanho').AsString := tamanho;
 MovSaidaDM.updatequery.ParamByName('cor').AsString := cor;
 MovSaidaDM.updatequery.ParamByName('deposito').AsString := deposito;
 MovSaidaDM.updatequery.ParamByName('lote').AsString := lote;

 MovSaidaDM.InsertQuery.SQL.Clear;
 MovSaidaDM.InsertQuery.SQL.Text :=
 'insert into prodmov (codigo, cor, tamanho, deposito, lote, qtde, data, tipo, usuario, emp_id) ' +
 'values ' +
 '(:codigo, :cor, :tamanho, :deposito, :lote, :qtde, :data, :tipo, :usuario, :emp_id)';
 MovSaidaDM.InsertQuery.ParamByName('qtde').AsFloat := StrToFloat(qtde);
 MovSaidaDM.InsertQuery.ParamByName('codigo').AsString := codigo;
 MovSaidaDM.InsertQuery.ParamByName('tamanho').AsString := tamanho;
 MovSaidaDM.InsertQuery.ParamByName('cor').AsString := cor;
 MovSaidaDM.InsertQuery.ParamByName('deposito').AsString := deposito;
 MovSaidaDM.InsertQuery.ParamByName('lote').AsString := lote;
 MovSaidaDM.InsertQuery.ParamByName('tipo').AsString := 'S';
 MovSaidaDM.InsertQuery.ParamByName('data').AsDateTime := Now;
 MovSaidaDM.InsertQuery.ParamByName('usuario').AsString := UsuarioLogado;
 MovSaidaDM.InsertQuery.ParamByName('emp_id').AsString := EmpresaLogada;

 LogsDM.InserirLog.SQL.Clear;
 LogsDM.InserirLog.SQL.Text :=
 'insert into logs (descricao, tela, data, emp_id, usuario) values (:descricao, :tela, :data, :emp_id, :usuario)';
 LogsDM.InserirLog.ParamByName('descricao').AsString :=
 'Fez saída manual no código ' + codigo + ' na cor ' + cor + ' no tamanho ' + tamanho + ' no depósito ' + deposito + ' no lote ' + lote + ' em ' + qtde + ' quantidade(s)';
 LogsDM.InserirLog.ParamByName('tela').AsString := 'MovSaida';
 LogsDM.InserirLog.ParamByName('data').AsDatetime := Now;
 LogsDM.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
 LogsDM.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;

 try
 MovSaidaDM.updatequery.ExecSQL;
 MovSaidaDM.InsertQuery.ExecSQL;
 LogsDM.InserirLog.ExecSQL;
 ShowMessage('Gravado com sucesso!');
 limpartudo;
 except
 ShowMessage('Erro na gravação');
 end;
end;
end;
end;

procedure TMovSaida.BtnDesistirClick(Sender: TObject);
begin
 Limpartudo;
end;

procedure TMovSaida.btnFecharClick(Sender: TObject);
begin
 Fechartela(sender);
end;
end.
