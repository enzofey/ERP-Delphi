unit CSTIPI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.ComCtrls,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids,
  CSTIPIDM,
  Log, LogDM,
  GlobalUnit;

type
  TCadCSTIPI = class(TForm)
    Panel1: TPanel;
    lblCST: TLabel;
    lblDescricao: TLabel;
    btnAlterar: TButton;
    btnDesistir: TButton;
    BtnExcluir: TButton;
    btnFechar: TButton;
    btnGravarAlterar: TButton;
    btnGravarIncluir: TButton;
    btnIncluir: TButton;
    EdtCST: TEdit;
    EdtDescricao: TEdit;
    Grid: TDBGrid;
    RGModo: TRadioGroup;
    RBBase: TRadioButton;
    RBIsento: TRadioButton;
    RBOutros: TRadioButton;
    lblAtivo: TLabel;
    CBAtivo: TCheckBox;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarAlterarClick(Sender: TObject);
    procedure btnGravarIncluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadCSTIPI: TCadCSTIPI;

implementation

{$R *.dfm}

uses ConsultarCSTIPIForm;

procedure TCadCSTIPI.FormShow(Sender: TObject);
var I: integer;
begin
 CadCSTIPIDM.qryConsultarCSTIPI.SQL.Clear;
 CadCSTIPIDM.qryConsultarCSTIPI.SQL.Text :=
 'select * from cadcstipi';
 CadCSTIPIDM.qryConsultarCSTIPI.Open;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TCadCSTIPI.btnIncluirClick(Sender: TObject);
var I: integer;
begin
 CadCSTIPIDM.qryConsultarCSTIPI.SQL.Clear;
 CadCSTIPIDM.qryConsultarCSTIPI.SQL.Text :=
 'select * from cadcstipi';
 CadCSTIPIDM.qryConsultarCSTIPI.Open;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 EdtCST.Clear;
 EdtDescricao.Clear;

 EdtCST.Enabled := True;
 EdtDescricao.Enabled := True;

 RBBase.Checked := False;
 RBIsento.Checked := False;
 RBOutros.Checked := False;

 RBBase.Enabled := True;
 RBIsento.Enabled := True;
 RBOutros.Enabled := True;

 CBAtivo.Enabled := True;

 btnIncluir.Visible := False;
 btnAlterar.Visible := False;
 btnExcluir.Visible := False;
 btnFechar.Visible := False;
 Grid.Enabled := False;

 btnGravarIncluir.Visible := True;
 btnDesistir.Visible := True;
end;

procedure TCadCSTIPI.btnGravarIncluirClick(Sender: TObject);
var CST, Descricao, Modo, ativo: string;
    I: integer;
begin
 CST := EdtCST.Text;
 Descricao := EdtDescricao.Text;
 if RBBase.Checked then Modo := 'B'
 else if RBIsento.Checked then modo := 'I'
 else if RBOutros.Checked then modo := 'O';
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if EdtCST.Text = '' then begin
  ShowMessage('CST IPI não pode ser vazio!');
  Abort;
 End;

 if EdtDescricao.Text = '' then begin
  ShowMessage('Descrição não pode ser vazio!');
  Abort;
 End;

 if not RBBase.Checked and not RBIsento.Checked and not RBOutros.Checked then begin
  ShowMessage('Selecione um modo de cálculo!');
  Abort;
 End;

 CadCSTIPIDM.SelectQuery.SQL.Clear;
 CadCSTIPIDM.SelectQuery.SQL.Text :=
 'select * from cadCSTIPI where CST = :CST';
 CadCSTIPIDM.SelectQuery.ParamByName('CST').AsString := CST;
 CadCSTIPIDM.SelectQuery.Open;

 if not CadCSTIPIDM.SelectQuery.IsEmpty then begin
  ShowMessage('CST IPI já cadastrado!');
  Abort;
 End;

 CadCSTIPIDM.InsertQuery.SQL.CLear;
 CadCSTIPIDM.InsertQuery.SQL.Text :=
 'insert into cadCSTIPI (CST, Descricao, Modo, ativo) values (:CST, :Descricao, :Modo, :ativo)';
 CadCSTIPIDM.InsertQuery.ParamByName('CST').AsString := CST;
 CadCSTIPIDM.InsertQuery.ParamByName('Descricao').AsString := Descricao;
 CadCSTIPIDM.InsertQuery.ParamByName('Modo').AsString := Modo;
 CadCSTIPIDM.InsertQuery.ParamByName('ativo').AsString := ativo;

 LogsDM.InserirLog.SQL.Clear;
 LogsDM.InserirLog.SQL.Text :=
 'insert into logs (Descricao, data, emp_id, usuario, tela) values (:Descricao, :data, :emp_id, :usuario, :tela)';
 LogsDM.InserirLog.ParamByName('Descricao').AsString :=
 'Inseriu o CST IPI ' + CST + ' ' + Descricao + ' para o modo de cálculo ' + Modo;
 LogsDM.InserirLog.ParamByName('data').AsDateTime := Now;
 LogsDM.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
 LogsDM.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
 LogsDM.InserirLog.ParamByName('tela').AsString := 'CadCSTIPI';
 try
  LogsDM.InserirLog.ExecSQL;
  CadCSTIPIDM.InsertQuery.ExecSQL;
  ShowMessage('Gravado com sucesso!');

  CadCSTIPIDM.qryConsultarCSTIPI.SQL.Clear;
  CadCSTIPIDM.qryConsultarCSTIPI.SQL.Text :=
  'select * from cadcstipi';
  CadCSTIPIDM.qryConsultarCSTIPI.Open;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

  EdtCST.Enabled := False;
  EdtDescricao.Enabled := False;

  RBBase.Enabled := False;
  RBIsento.Enabled := False;
  RBOutros.Enabled := False;

  btnIncluir.Visible := True;
  btnAlterar.Visible := True;
  btnExcluir.Visible := True;
  btnFechar.Visible := True;
  Grid.Enabled := True;

  btnGravarIncluir.Visible := False;
  btnDesistir.Visible := False;
  except
  ShowMessage('Erro na inclusão!');
 end;
end;

procedure TCadCSTIPI.btnAlterarClick(Sender: TObject);
var I: integer;
begin
 if EdtCST.Text = '' then begin
  ShowMessage('Nenhum CST IPI selecionado!');
  Abort;
 End;

 CadCSTIPIDM.qryConsultarCSTIPI.SQL.Clear;
 CadCSTIPIDM.qryConsultarCSTIPI.SQL.Text :=
 'select * from cadcstipi';
 CadCSTIPIDM.qryConsultarCSTIPI.Open;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 EdtDescricao.Enabled := True;

 RBBase.Enabled := True;
 RBIsento.Enabled := True;
 RBOutros.Enabled := True;

 CBAtivo.Enabled := True;

 btnIncluir.Visible := False;
 btnAlterar.Visible := False;
 btnExcluir.Visible := False;
 btnFechar.Visible := False;
 Grid.Enabled := False;

 btnGravarAlterar.Visible := True;
 btnDesistir.Visible := True;
end;

procedure TCadCSTIPI.btnGravarAlterarClick(Sender: TObject);
var CST, Descricao, Modo, ativo: string;
    I: integer;
begin
 CST := EdtCST.Text;
 Descricao := EdtDescricao.Text;
 if RBBase.Checked then Modo := 'B'
 else if RBIsento.Checked then modo := 'I'
 else if RBOutros.Checked then modo := 'O';
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if EdtCST.Text = '' then begin
  ShowMessage('CST IPI não pode ser vazio!');
  Abort;
 End;

 if EdtDescricao.Text = '' then begin
  ShowMessage('Descrição não pode ser vazio!');
  Abort;
 End;

 if not RBBase.Checked and not RBIsento.Checked and not RBOutros.Checked then begin
  ShowMessage('Selecione um modo de cálculo!');
  Abort;
 End;

 CadCSTIPIDM.UpdateQuery.SQL.CLear;
 CadCSTIPIDM.UpdateQuery.SQL.Text :=
 'update cadCSTIPI set descricao = :descricao, modo = :modo, ativo = :ativo where CST = :CST';
 CadCSTIPIDM.UpdateQuery.ParamByName('CST').AsString := CST;
 CadCSTIPIDM.UpdateQuery.ParamByName('Descricao').AsString := Descricao;
 CadCSTIPIDM.UpdateQuery.ParamByName('Modo').AsString := Modo;
 CadCSTIPIDM.UpdateQuery.ParamByName('ativo').AsString := ativo;

 LogsDM.InserirLog.SQL.Clear;
 LogsDM.InserirLog.SQL.Text :=
 'insert into logs (Descricao, data, emp_id, usuario, tela) values (:Descricao, :data, :emp_id, :usuario, :tela)';
 LogsDM.InserirLog.ParamByName('Descricao').AsString :=
 'Alterou o CST IPI ' + CST + ' ' + Descricao + ' para o modo de cálculo ' + Modo;
 LogsDM.InserirLog.ParamByName('data').AsDateTime := Now;
 LogsDM.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
 LogsDM.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
 LogsDM.InserirLog.ParamByName('tela').AsString := 'CadCSTIPI';
 try
  LogsDM.InserirLog.ExecSQL;
  CadCSTIPIDM.UpdateQuery.ExecSQL;
  ShowMessage('Alterado com sucesso!');

  CadCSTIPIDM.qryConsultarCSTIPI.SQL.Clear;
  CadCSTIPIDM.qryConsultarCSTIPI.SQL.Text :=
  'select * from cadcstipi';
  CadCSTIPIDM.qryConsultarCSTIPI.Open;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

  EdtDescricao.Enabled := False;

  RBBase.Enabled := False;
  RBIsento.Enabled := False;
  RBOutros.Enabled := False;

  CBAtivo.Enabled := False;

  btnIncluir.Visible := True;
  btnAlterar.Visible := True;
  btnExcluir.Visible := True;
  btnFechar.Visible := True;
  Grid.Enabled := True;

  btnGravarAlterar.Visible := False;
  btnDesistir.Visible := False;
  except
  ShowMessage('Erro na alteração!');
 end;
end;

procedure TCadCSTIPI.btnDesistirClick(Sender: TObject);
var I: integer;
begin
 CadCSTIPIDM.qryConsultarCSTIPI.SQL.Clear;
 CadCSTIPIDM.qryConsultarCSTIPI.SQL.Text :=
 'select * from cadcstipi';
 CadCSTIPIDM.qryConsultarCSTIPI.Open;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 EdtCST.Clear;
 EdtDescricao.Clear;

 EdtCST.Enabled := False;
 EdtDescricao.Enabled := False;

 RBBase.Checked := False;
 RBIsento.Checked := False;
 RBOutros.Checked := False;

 CBAtivo.Enabled := False;

 RBBase.Enabled := False;
 RBIsento.Enabled := False;
 RBOutros.Enabled := False;

 btnIncluir.Visible := True;
 btnAlterar.Visible := True;
 btnExcluir.Visible := True;
 btnFechar.Visible := True;
 Grid.Enabled := True;

 btnGravarIncluir.Visible := False;
 btnDesistir.Visible := False;
end;

procedure TCadCSTIPI.BtnExcluirClick(Sender: TObject);
var CST, Descricao, Modo: string;
    I: integer;
begin
 CST := EdtCST.Text;
 Descricao := EdtDescricao.Text;
 if RBBase.Checked then Modo := 'B'
 else if RBIsento.Checked then modo := 'I'
 else if RBOutros.Checked then modo := 'O';

 if EdtCST.Text = '' then begin
  ShowMessage('Nenhum CST IPI selecionado!');
  Abort;
 End;

 CadCSTIPIDM.DeleteQuery.SQL.CLear;
 CadCSTIPIDM.DeleteQuery.SQL.Text :=
 'delete from cadCSTIPI where CST = :CST';
 CadCSTIPIDM.DeleteQuery.ParamByName('CST').AsString := CST;

 LogsDM.InserirLog.SQL.Clear;
 LogsDM.InserirLog.SQL.Text :=
 'insert into logs (Descricao, data, emp_id, usuario, tela) values (:Descricao, :data, :emp_id, :usuario, :tela)';
 LogsDM.InserirLog.ParamByName('Descricao').AsString :=
 'Deletou o CST IPI ' + CST + ' ' + Descricao + ' para o modo de cálculo ' + Modo;
 LogsDM.InserirLog.ParamByName('data').AsDateTime := Now;
 LogsDM.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
 LogsDM.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
 LogsDM.InserirLog.ParamByName('tela').AsString := 'CadCSTIPI';
 try
  LogsDM.InserirLog.ExecSQL;
  CadCSTIPIDM.DeleteQuery.ExecSQL;
  ShowMessage('Excluido com sucesso!');

  CadCSTIPIDM.qryConsultarCSTIPI.SQL.Clear;
  CadCSTIPIDM.qryConsultarCSTIPI.SQL.Text :=
  'select * from cadcstipi';
  CadCSTIPIDM.qryConsultarCSTIPI.Open;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

  EdtCST.Clear;
  EdtDescricao.Clear;

  RBBase.Checked := False;
  RBIsento.Checked := False;
  RBOutros.Checked := False;
  except
  ShowMessage('Erro na exclusão!');
 end;
end;

procedure TCadCSTIPI.GridCellClick(Column: TColumn);
var CST, Descricao, Modo, ativo: String;
begin
 EdtCST.Text := CadCSTIPIDM.qryConsultarCSTIPI.FieldByName('CST').AsString;
 EdtDescricao.Text := CadCSTIPIDM.qryConsultarCSTIPI.FieldByName('Descricao').AsString;
 Modo := CadCSTIPIDM.qryConsultarCSTIPI.FieldByName('Modo').AsString;
 ativo := CadCSTIPIDM.qryConsultarCSTIPI.FieldByName('ativo').AsString;
 if Modo = 'B' then
 RBBase.Checked := True
 else if Modo = 'I' then
 RBIsento.Checked := True
 else if Modo = 'O' then
 RBOutros.Checked := True;

 if ativo = 'S' then CBAtivo.Checked;
end;

procedure TCadCSTIPI.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;
end.

