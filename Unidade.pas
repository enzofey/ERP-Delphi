unit Unidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  GlobalUnit,
  UnidadeDM,
  LogDM;

type
  TCadUnidade = class(TForm)
    Pages: TPageControl;
    CadastroPage: TTabSheet;
    btnAlterar: TButton;
    btnDesistir: TButton;
    btnExcluir: TButton;
    btnFechar: TButton;
    btnGravarAlterar: TButton;
    btnGravarIncluir: TButton;
    btnIncluir: TButton;
    CBAtivo: TCheckBox;
    EdtDescricao: TEdit;
    EdtUnidade: TEdit;
    Grid: TDBGrid;
    lblAtivo: TLabel;
    lblDescricao: TLabel;
    lblUnidade: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarIncluirClick(Sender: TObject);
    procedure btnGravarAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadUnidade: TCadUnidade;

implementation

{$R *.dfm}

procedure TCadUnidade.FormShow(Sender: TObject);
var I: integer;
begin
 with CadUnidadeDM.qryConsultarUnidade do
 begin
  SQL.Clear;
  SQL.Add('select * from cadunidade');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TCadUnidade.btnIncluirClick(Sender: TObject);
var I: integer;
begin
 with CadUnidadeDM.qryConsultarUnidade do
  begin
   SQL.Clear;
   SQL.Add('select * from cadunidade');
   Open;
  end;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 EdtUnidade.Enabled := True;
 EdtDescricao.Enabled := True;
 CBAtivo.Enabled := True;

 EdtUnidade.Clear;
 EdtDescricao.Clear;
 CBAtivo.Checked := False;

 btnGravarIncluir.Visible := True;
 btnDesistir.Visible := True;

 btnIncluir.Visible := False;
 btnAlterar.Visible := False;
 btnExcluir.Visible := False;
 btnFechar.Visible := False;
end;

procedure TCadUnidade.btnGravarIncluirClick(Sender: TObject);
var unidade, descricao, ativo: string;
    I: integer;
begin
 unidade := EdtUnidade.Text;
 descricao := EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 with CadUnidadeDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadunidade where unidade = :unidade');
  Parambyname('unidade').AsString := unidade;

  if not IsEmpty then begin
   ShowMessage('Unidade já cadastrada!');
   Abort;
  End;
 end;

 CadUnidadeDM.Conexão.StartTransaction;
 try
  with CadUnidadeDM.qryInsert do
  begin
   SQL.Clear;
   SQL.Add('insert into cadunidade (unidade, descricao, ativo)');
   SQL.Add('values');
   SQL.Add('(:unidade, :descricao, :ativo)');
   ParamByName('unidade').AsString := unidade;
   ParamByName('descricao').AsString := descricao;
   ParamByName('ativo').AsString := ativo;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, usuario, emp_id)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :usuario, :emp_id)');
   Parambyname('descricao').AsString :=
   'Inseriu a unidade ' + unidade + ' na descrição ' + descricao + ' e ativo = ' + ativo;
   Parambyname('tela').AsString := 'CadUnidade';
   Parambyname('data').AsDateTime := Now;
   Parambyname('usuario').AsString := UsuarioLogado;
   Parambyname('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  EdtUnidade.Enabled := False;
  EdtDescricao.Enabled := False;
  CBAtivo.Enabled := False;

  btnGravarIncluir.Visible := False;
  btnGravarAlterar.Visible := False;
  btnDesistir.Visible := False;

  btnExcluir.Visible := True;
  btnFechar.Visible := True;
  btnIncluir.Visible := True;
  btnAlterar.Visible := True;

  with CadUnidadeDM.qryConsultarUnidade do
  begin
   SQL.Clear;
   SQL.Add('select * from cadunidade');
   Open;
  end;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

  CadUnidadeDM.Conexão.Commit;
  ShowMessage('Gravado com sucesso!');
  except
  CadUnidadeDM.Conexão.Rollback;
  ShowMessage('Erro na gravação!');
 end;
end;

procedure TCadUnidade.btnAlterarClick(Sender: TObject);
var I: integer;
begin
 with CadUnidadeDM.qryConsultarUnidade do
 begin
  SQL.Clear;
  SQL.Add('select * from cadunidade');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 EdtDescricao.Enabled := True;
 CBAtivo.Enabled := True;

 btnGravarAlterar.Visible := True;
 btnDesistir.Visible := True;

 btnIncluir.Visible := False;
 btnAlterar.Visible := False;
 btnExcluir.Visible := False;
 btnFechar.Visible := False;
end;

procedure TCadUnidade.btnGravarAlterarClick(Sender: TObject);
var unidade, descricao, ativo: string;
    I: integer;
begin
 unidade := EdtUnidade.Text;
 descricao := EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 CadUnidadeDM.Conexão.StartTransaction;
 try
  with CadUnidadeDM.qryUpdate do
  begin
   SQL.Clear;
   SQL.Add('update cadunidade set descricao = :descricao, ativo = :ativo where unidade = :unidade');
   ParamByName('unidade').AsString := unidade;
   ParamByName('descricao').AsString := descricao;
   ParamByName('ativo').AsString := ativo;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, usuario, emp_id)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :usuario, :emp_id)');
   Parambyname('descricao').AsString :=
   'Alterou a unidade ' + unidade + ' na descrição ' + descricao + ' e ativo = ' + ativo;
   Parambyname('tela').AsString := 'CadUnidade';
   Parambyname('data').AsDateTime := Now;
   Parambyname('usuario').AsString := UsuarioLogado;
   Parambyname('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  EdtUnidade.Enabled := False;
  EdtDescricao.Enabled := False;
  CBAtivo.Enabled := False;

  btnGravarIncluir.Visible := False;
  btnGravarAlterar.Visible := False;
  btnDesistir.Visible := False;

  btnExcluir.Visible := True;
  btnFechar.Visible := True;
  btnIncluir.Visible := True;
  btnAlterar.Visible := True;

  with CadUnidadeDM.qryConsultarUnidade do
  begin
   SQL.Clear;
   SQL.Add('select * from cadunidade');
   Open;
  end;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

  CadUnidadeDM.Conexão.Commit;
  ShowMessage('Alterado com sucesso!');
  except
  CadUnidadeDM.Conexão.Rollback;
  ShowMessage('Erro na gravação!');
 end;
end;

procedure TCadUnidade.btnDesistirClick(Sender: TObject);
var I: integer;
begin
 with CadUnidadeDM.qryConsultarUnidade do
 begin
  SQL.Clear;
  SQL.Add('select * from cadunidade');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 EdtUnidade.Enabled := False;
 EdtDescricao.Enabled := False;
 CBAtivo.Enabled := False;

 EdtUnidade.Clear;
 EdtDescricao.Clear;
 CBAtivo.Checked := False;

 btnGravarIncluir.Visible := False;
 btnGravarAlterar.Visible := False;
 btnDesistir.Visible := False;

 btnExcluir.Visible := True;
 btnFechar.Visible := True;
 btnIncluir.Visible := True;
 btnAlterar.Visible := True;
end;

procedure TCadUnidade.btnExcluirClick(Sender: TObject);
var unidade, descricao, ativo: string;
    I: integer;
begin
 unidade := EdtUnidade.Text;
 descricao := EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if unidade = '' then begin
  ShowMessage('Unidade não selecionada!');
  Abort;
 end;

 with CadUnidadeDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadunidade where unidade = :unidade');
  ParamByName('unidade').AsString := unidade;
  Open;

  if not IsEmpty then begin
   ShowMessage('Unidade não encontrada!');
   Abort;
  end;
 end;

 CadUnidadeDM.Conexão.StartTransaction;
 try
  with CadUnidadeDM.qryDelete do
  begin
   SQL.Clear;
   SQL.Add('delete from cadunidade where unidade = :unidade');
   ParamByName('unidade').AsString := unidade;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, usuario, emp_id)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :usuario, :emp_id)');
   Parambyname('descricao').AsString :=
   'Excluiu a unidade ' + unidade + ' na descrição ' + descricao + ' e ativo = ' + ativo;
   Parambyname('tela').AsString := 'CadUnidade';
   Parambyname('data').AsDateTime := Now;
   Parambyname('usuario').AsString := UsuarioLogado;
   Parambyname('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  EdtUnidade.Enabled := False;
  EdtDescricao.Enabled := False;
  CBAtivo.Enabled := False;

  EdtUnidade.Clear;
  EdtDescricao.Clear;
  CBAtivo.Checked := False;

  btnGravarIncluir.Visible := False;
  btnGravarAlterar.Visible := False;
  btnDesistir.Visible := False;

  btnExcluir.Visible := True;
  btnFechar.Visible := True;
  btnIncluir.Visible := True;
  btnAlterar.Visible := True;

  with CadUnidadeDM.qryConsultarUnidade do
  begin
   SQL.Clear;
   SQL.Add('select * from cadunidade');
   Open;
  end;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

  CadUnidadeDM.Conexão.Commit;
  ShowMessage('Excluido com sucesso!');
  except
  CadUnidadeDM.Conexão.Rollback;
  ShowMessage('Erro na gravação!');
 end;
end;

procedure TCadUnidade.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;

procedure TCadUnidade.GridCellClick(Column: TColumn);
begin
 with CadUnidadeDM.qryConsultarUnidade do
 begin
  EdtUnidade.Text := FieldByName('unidade').AsString;
  CBAtivo.Checked := FieldByName('Ativo').AsString = 'S';
  EdtDescricao.Text := FieldByName('Descricao').AsString;
 end;
end;
end.
