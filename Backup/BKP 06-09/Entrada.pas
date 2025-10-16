unit Entrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  EntradaDM,
  Log, LogDM,
  GlobalUnit;

type
  TMovEntrada = class(TForm)
    Panel1: TPanel;
    btnIncluir: TButton;
    btnDesistir: TButton;
    btnGravar: TButton;
    lblCodigoProduto: TLabel;
    CBoxProduto: TComboBox;
    lblCodigoCor: TLabel;
    CBoxCor: TComboBox;
    lblCodigoTamanho: TLabel;
    CBoxTamanho: TComboBox;
    lblCodigoDeposito: TLabel;
    CBoxDeposito: TComboBox;
    lblLote: TLabel;
    edtLote: TEdit;
    lblQtde: TLabel;
    EdtQtde: TEdit;
    btnIncluirGrid: TButton;
    Grid: TStringGrid;
    btnFechar: TButton;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnIncluirGridClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBoxProdutoDropDown(Sender: TObject);
    procedure CBoxCorDropDown(Sender: TObject);
    procedure CBoxTamanhoDropDown(Sender: TObject);
    procedure CBoxDepositoDropDown(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    procedure LimparTudo;
  public
    { Public declarations }
  end;

var
  MovEntrada: TMovEntrada;

implementation

{$R *.dfm}

procedure TMovEntrada.CBoxProdutoDropDown(Sender: TObject);
begin
  CBoxProduto.Items.Clear;

  MovEntradaDM.CBProduto.Close;
  MovEntradaDM.CBProduto.Open;

  while not MovEntradaDM.CBProduto.Eof do
  begin
    CBoxProduto.Items.Add(MovEntradaDM.CBProduto.FieldByName('codigo').AsString);
    MovEntradaDM.CBProduto.Next;
  end;

  MovEntradaDM.CBProduto.Close;
end;

procedure TMovEntrada.CBoxCorDropDown(Sender: TObject);
begin
  CBoxCor.Items.Clear;

  MovEntradaDM.CBCor.Close;
  MovEntradaDM.CBCor.Open;

  while not MovEntradaDM.CBCor.Eof do
  begin
    CBoxCor.Items.Add(MovEntradaDM.CBCor.FieldByName('descricao').AsString);
    MovEntradaDM.CBCor.Next;
  end;

  MovEntradaDM.CBCor.Close;
end;

procedure TMovEntrada.CBoxTamanhoDropDown(Sender: TObject);
begin
  CBoxTamanho.Items.Clear;

  MovEntradaDM.CBTamanho.Close;
  MovEntradaDM.CBTamanho.Open;

  while not MovEntradaDM.CBTamanho.Eof do
  begin
    CBoxTamanho.Items.Add(MovEntradaDM.CBTamanho.FieldByName('codigo').AsString);
    MovEntradaDM.CBTamanho.Next;
  end;

  MovEntradaDM.CBTamanho.Close;
end;

procedure TMovEntrada.CBoxDepositoDropDown(Sender: TObject);
begin
  CBoxDeposito.Items.Clear;

  MovEntradaDM.CBDeposito.Close;
  MovEntradaDM.CBDeposito.Open;

  while not MovEntradaDM.CBDeposito.Eof do
  begin
    CBoxDeposito.Items.Add(MovEntradaDM.CBDeposito.FieldByName('codigo').AsString);
    MovEntradaDM.CBDeposito.Next;
  end;

  MovEntradaDM.CBDeposito.Close;
end;

procedure TMovEntrada.FormShow(Sender: TObject);
var i: Integer;
begin
 Grid.FixedRows := 0;
 Grid.Cells[0,0] := 'Produto';
 Grid.Cells[1,0] := 'Cor';
 Grid.Cells[2,0] := 'Tamanho';
 Grid.Cells[3,0] := 'Depósito';
 Grid.Cells[4,0] := 'Lote';
 Grid.Cells[5,0] := 'Qtde';
end;

procedure TMovEntrada.LimparTudo;
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

procedure TMovEntrada.btnIncluirClick(Sender: TObject);
begin
 BtnIncluir.visible := False;

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

procedure TMovEntrada.BtnIncluirGridClick(Sender: TObject);
var
 codigo, cor, tamanho, lote, deposito, qtde: string;
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
 EdtQtde.clear
end;
end;
end;
end;
end;
end;
end;

procedure TMovEntrada.BtnGravarClick(Sender: TObject);
var
  i: Integer;
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

 MovEntradaDM.SelectQuery.Close;
 MovEntradaDM.SelectQuery.SQL.Text :=
 'SELECT * FROM estoque WHERE codigo=:codigo AND tamanho=:tamanho AND cor=:cor AND deposito=:deposito AND lote=:lote';
 MovEntradaDM.SelectQuery.ParamByName('codigo').AsString := codigo;
 MovEntradaDM.SelectQuery.ParamByName('tamanho').AsString := tamanho;
 MovEntradaDM.SelectQuery.ParamByName('cor').AsString := cor;
 MovEntradaDM.SelectQuery.ParamByName('deposito').AsString := deposito;
 MovEntradaDM.SelectQuery.ParamByName('lote').AsString := lote;
 MovEntradaDM.SelectQuery.Open;

 if MovEntradaDM.SelectQuery.IsEmpty then begin

 MovEntradaDM.InsertQuery.SQL.Clear;
 MovEntradaDM.InsertQuery.SQL.Text :=
 'INSERT INTO estoque (codigo, tamanho, cor, deposito, lote, qtde) ' +
 'VALUES (:codigo, :tamanho, :cor, :deposito, :lote, :qtde)';
 MovEntradaDM.InsertQuery.ParamByName('codigo').AsString := codigo;
 MovEntradaDM.InsertQuery.ParamByName('tamanho').AsString := tamanho;
 MovEntradaDM.InsertQuery.ParamByName('cor').AsString := cor;
 MovEntradaDM.InsertQuery.ParamByName('deposito').AsString := deposito;
 MovEntradaDM.InsertQuery.ParamByName('lote').AsString := lote;
 MovEntradaDM.InsertQuery.ParamByName('qtde').AsFloat := StrToFloat(qtde);
 MovEntradaDM.InsertQuery.ExecSQL;
 end
 else begin

 MovEntradaDM.UpdateQuery.SQL.Clear;
 MovEntradaDM.UpdateQuery.SQL.Text :=
 'UPDATE estoque SET qtde = qtde + :qtde ' +
 'WHERE codigo = :codigo AND tamanho = :tamanho AND cor = :cor AND deposito = :deposito AND lote = :lote';
 MovEntradaDM.UpdateQuery.ParamByName('codigo').AsString := codigo;
 MovEntradaDM.UpdateQuery.ParamByName('tamanho').AsString := tamanho;
 MovEntradaDM.UpdateQuery.ParamByName('cor').AsString := cor;
 MovEntradaDM.UpdateQuery.ParamByName('deposito').AsString := deposito;
 MovEntradaDM.UpdateQuery.ParamByName('lote').AsString := lote;
 MovEntradaDM.UpdateQuery.ParamByName('qtde').AsFloat := StrToFloat(qtde);
 MovEntradaDM.UpdateQuery.ExecSQL;
 end;

 MovEntradaDM.InsertProdMov.SQL.Clear;
 MovEntradaDM.InsertProdMov.SQL.Text :=
 'INSERT INTO prodmov (codigo, cor, tamanho, deposito, lote, qtde, data, tipo, usuario) ' +
 'VALUES (:codigo, :cor, :tamanho, :deposito, :lote, :qtde, :data, :tipo, :usuario)';
 MovEntradaDM.InsertProdMov.ParamByName('codigo').AsString := codigo;
 MovEntradaDM.InsertProdMov.ParamByName('cor').AsString := cor;
 MovEntradaDM.InsertProdMov.ParamByName('tamanho').AsString := tamanho;
 MovEntradaDM.InsertProdMov.ParamByName('deposito').AsString := deposito;
 MovEntradaDM.InsertProdMov.ParamByName('lote').AsString := lote;
 MovEntradaDM.InsertProdMov.ParamByName('qtde').AsFloat := StrToFloat(qtde);
 MovEntradaDM.InsertProdMov.ParamByName('data').AsDateTime := Now;
 MovEntradaDM.InsertProdMov.ParamByName('tipo').AsString := 'E';
 MovEntradaDM.InsertProdMov.ParamByName('usuario').AsString := UsuarioLogado;
 MovEntradaDM.InsertProdMov.ExecSQL;

 LogsDM.InserirLog.SQL.Text :=
 'INSERT INTO logs (descricao, tela, data, usuario, emp_id) VALUES (:descricao, :tela, :data, :usuario, :emp_id)';
 LogsDM.InserirLog.ParamByName('descricao').AsString :=
 'Fez entrada manual no código ' + codigo + ' na cor ' + cor +
 ' no tamanho ' + tamanho + ' no depósito ' + deposito +
 ' no lote ' + lote + ' em ' + qtde + ' quantidade(s)';
 LogsDM.InserirLog.ParamByName('tela').AsString := 'MovEntrada';
 LogsDM.InserirLog.ParamByName('data').AsDateTime := Now;
 LogsDM.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
 LogsDM.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
 try
 LogsDM.InserirLog.ExecSQL;
 ShowMessage('Gravado com sucesso!');
 LimparTudo;
 except
 ShowMessage('Erro na gravação');
 end;
end;
end;

procedure TMovEntrada.BtnDesistirClick(Sender: TObject);
begin
LimparTudo;
end;

procedure TMovEntrada.btnFecharClick(Sender: TObject);
begin
 Fechartela(sender);
end;
end.
