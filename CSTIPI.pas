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
 with CadCSTIPIDM.qryConsultarCSTIPI do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcstipi');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TCadCSTIPI.btnIncluirClick(Sender: TObject);
var I: integer;
begin
 with CadCSTIPIDM.qryConsultarCSTIPI do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcstipi');
  Open;
 end;
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

 if CST = '' then begin
  ShowMessage('CST IPI não pode ser vazio!');
  Abort;
 end;

 if Descricao = '' then begin
  ShowMessage('Descrição não pode ser vazio!');
  Abort;
 end;

 if not RBBase.Checked and not RBIsento.Checked and not RBOutros.Checked then begin
  ShowMessage('Selecione um modo de cálculo!');
  Abort;
 end;

 with CadCSTIPIDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadCSTIPI where CST = :CST');
  ParamByName('CST').AsString := CST;
  Open;

  if not IsEmpty then begin
   ShowMessage('CST IPI já cadastrado!');
   Abort;
  end;
 end;

 CadCSTIPIDM.Conexão.StartTransaction;
 try
  with CadCSTIPIDM.qryInsert do
  begin
   SQL.CLear;
   SQL.Add('insert into cadCSTIPI (CST, Descricao, Modo, ativo)');
   SQL.Add('values');
   SQL.Add('(:CST, :Descricao, :Modo, :ativo)');
   ParamByName('CST').AsString := CST;
   ParamByName('Descricao').AsString := Descricao;
   ParamByName('Modo').AsString := Modo;
   ParamByName('ativo').AsString := ativo;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (Descricao, data, emp_id, usuario, tela)');
   SQL.Add('values');
   SQL.Add('(:Descricao, :data, :emp_id, :usuario, :tela)');
   ParamByName('Descricao').AsString :=
   'Inseriu o CST IPI ' + CST + ' ' + Descricao + ' para o modo de cálculo ' + Modo;
   ParamByName('data').AsDateTime := Now;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('tela').AsString := 'CadCSTIPI';
   ExecSQL;
  end;

  CadCSTIPIDM.Conexão.Commit;
  ShowMessage('Gravado com sucesso!');

  with CadCSTIPIDM.qryConsultarCSTIPI do
  begin
   SQL.Clear;
   SQL.Add('select * from cadcstipi');
   Open;
  end;
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
  CadCSTIPIDM.Conexão.Rollback;
  ShowMessage('Erro na inclusão!');
 end;
end;

procedure TCadCSTIPI.btnAlterarClick(Sender: TObject);
var I: integer;
begin
 if EdtCST.Text = '' then begin
  ShowMessage('Nenhum CST IPI selecionado!');
  Abort;
 end;

 with CadCSTIPIDM.qryConsultarCSTIPI do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcstipi');
  Open;
 end;
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

 if CST = '' then begin
  ShowMessage('CST IPI não pode ser vazio!');
  Abort;
 end;

 if Descricao = '' then begin
  ShowMessage('Descrição não pode ser vazio!');
  Abort;
 end;

 if not RBBase.Checked and not RBIsento.Checked and not RBOutros.Checked then begin
  ShowMessage('Selecione um modo de cálculo!');
  Abort;
 end;

 CadCSTIPIDM.Conexão.StartTransaction;
 try
  with CadCSTIPIDM.qryUpdate do
  begin
   SQL.CLear;
   SQL.Add('update cadCSTIPI set descricao = :descricao, modo = :modo, ativo = :ativo where CST = :CST');
   ParamByName('CST').AsString := CST;
   ParamByName('Descricao').AsString := Descricao;
   ParamByName('Modo').AsString := Modo;
   ParamByName('ativo').AsString := ativo;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (Descricao, data, emp_id, usuario, tela)');
   SQL.Add('values');
   SQL.Add('(:Descricao, :data, :emp_id, :usuario, :tela)');
   ParamByName('Descricao').AsString :=
   'Alterou o CST IPI ' + CST + ' ' + Descricao + ' para o modo de cálculo ' + Modo;
   ParamByName('data').AsDateTime := Now;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('tela').AsString := 'CadCSTIPI';
   ExecSQL;
  end;

  CadCSTIPIDM.Conexão.Commit;
  ShowMessage('Alterado com sucesso!');

  with CadCSTIPIDM.qryConsultarCSTIPI do
  begin
   SQL.Clear;
   SQL.Add('select * from cadcstipi');
   Open;
  end;
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
  CadCSTIPIDM.Conexão.Rollback;
  ShowMessage('Erro na alteração!');
 end;
end;

procedure TCadCSTIPI.btnDesistirClick(Sender: TObject);
var I: integer;
begin
 with CadCSTIPIDM.qryConsultarCSTIPI do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcstipi');
  Open;
 end;
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

 if CST = '' then begin
  ShowMessage('Nenhum CST IPI selecionado!');
  Abort;
 end;

 CadCSTIPIDM.Conexão.StartTransaction;
 try
  with CadCSTIPIDM.qryDelete do
  begin
   SQL.CLear;
   SQL.Add('delete from cadCSTIPI where CST = :CST');
   ParamByName('CST').AsString := CST;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (Descricao, data, emp_id, usuario, tela)');
   SQL.Add('values');
   SQL.Add('(:Descricao, :data, :emp_id, :usuario, :tela)');
   ParamByName('Descricao').AsString :=
   'Deletou o CST IPI ' + CST + ' ' + Descricao + ' para o modo de cálculo ' + Modo;
   ParamByName('data').AsDateTime := Now;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('tela').AsString := 'CadCSTIPI';
   ExecSQL;
  end;

  CadCSTIPIDM.Conexão.Commit;
  ShowMessage('Excluido com sucesso!');

  with CadCSTIPIDM.qryConsultarCSTIPI do
  begin
   SQL.Clear;
   SQL.Add('select * from cadcstipi');
   Open;
  end;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

  EdtCST.Clear;
  EdtDescricao.Clear;

  RBBase.Checked := False;
  RBIsento.Checked := False;
  RBOutros.Checked := False;
  except
  CadCSTIPIDM.Conexão.Rollback;
  ShowMessage('Erro na exclusão!');
 end;
end;

procedure TCadCSTIPI.GridCellClick(Column: TColumn);
var CST, Descricao, Modo, ativo: String;
begin
 with CadCSTIPIDM.qryConsultarCSTIPI do
 begin
  EdtCST.Text := FieldByName('CST').AsString;
  EdtDescricao.Text := FieldByName('Descricao').AsString;
  Modo := FieldByName('Modo').AsString;
  ativo := FieldByName('ativo').AsString;
 end;

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

