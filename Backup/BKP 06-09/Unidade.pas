unit Unidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  GlobalUnit,
  UnidadeDM,
  LogDM;

type
  TCadUnidade = class(TForm)
    Panel1: TPanel;
    lblUnidade: TLabel;
    lblDescricao: TLabel;
    lblAtivo: TLabel;
    EdtUnidade: TEdit;
    EdtDescricao: TEdit;
    CBAtivo: TCheckBox;
    btnIncluir: TButton;
    btnGravarIncluir: TButton;
    btnGravarAlterar: TButton;
    btnAlterar: TButton;
    btnDesistir: TButton;
    btnFechar: TButton;
    btnExcluir: TButton;
    Grid: TDBGrid;
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

procedure TCadUnidade.btnIncluirClick(Sender: TObject);
begin
 CadUnidadeDM.ConsultarUnidade.SQL.Clear;
 CadUnidadeDM.ConsultarUnidade.SQL.Text :=
 'select * from cadunidade';
 CadUnidadeDM.ConsultarUnidade.Open;

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
begin
 unidade := EdtUnidade.Text;
 descricao := EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 CadUnidadeDM.SelectQuery.SQL.Clear;
 CadUnidadeDM.SelectQuery.SQL.Text :=
 'select * from cadunidade where unidade = :unidade';
 CadUnidadeDM.SelectQuery.Parambyname('unidade').AsString := unidade;

 if not CadUnidadeDM.SelectQuery.IsEmpty then begin
 ShowMessage('Unidade já cadastrada!');
 end
 else begin

  CadUnidadeDM.InsertQuery.SQL.Clear;
  CadUnidadeDM.InsertQuery.SQL.Text :=
  'insert into cadunidade (unidade, descricao, ativo) values (:unidade, :descricao, :ativo)';
  CadUnidadeDM.InsertQuery.ParamByName('unidade').AsString := unidade;
  CadUnidadeDM.InsertQuery.ParamByName('descricao').AsString := descricao;
  CadUnidadeDM.InsertQuery.ParamByName('ativo').AsString := ativo;

  LogsDM.InserirLog.SQL.Clear;
  LogsDM.InserirLog.SQL.Text :=
  'insert into logs (descricao, tela, data, usuario, emp_id) values (:descricao, :tela, :data, :usuario, :emp_id)';
  LogsDM.InserirLog.Parambyname('descricao').AsString :=
  'Inseriu a unidade ' + unidade + ' na descrição ' + descricao + ' e ativo = ' + ativo;
  LogsDM.InserirLog.Parambyname('tela').AsString := 'CadUnidade';
  LogsDM.InserirLog.Parambyname('data').AsDateTime := Now;
  LogsDM.InserirLog.Parambyname('usuario').AsString := UsuarioLogado;
  LogsDM.InserirLog.Parambyname('emp_id').AsString := EmpresaLogada;

  try
  LogsDM.InserirLog.ExecSQL;
  CadUnidadeDM.InsertQuery.ExecSQL;
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

  CadUnidadeDM.ConsultarUnidade.SQL.Clear;
  CadUnidadeDM.ConsultarUnidade.SQL.Text :=
  'select * from cadunidade';
  CadUnidadeDM.ConsultarUnidade.Open;

  ShowMessage('Gravado com sucesso!');
  except
  ShowMessage('Erro na gravação!');
  end;
 end;
end;

procedure TCadUnidade.btnAlterarClick(Sender: TObject);
begin
 CadUnidadeDM.ConsultarUnidade.SQL.Clear;
 CadUnidadeDM.ConsultarUnidade.SQL.Text :=
 'select * from cadunidade';
 CadUnidadeDM.ConsultarUnidade.Open;

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
begin
 unidade := EdtUnidade.Text;
 descricao := EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

  CadUnidadeDM.UpdateQuery.SQL.Clear;
  CadUnidadeDM.UpdateQuery.SQL.Text :=
  'update cadunidade set descricao = :descricao, ativo = :ativo where unidade = :unidade';
  CadUnidadeDM.UpdateQuery.ParamByName('unidade').AsString := unidade;
  CadUnidadeDM.UpdateQuery.ParamByName('descricao').AsString := descricao;
  CadUnidadeDM.UpdateQuery.ParamByName('ativo').AsString := ativo;

  LogsDM.InserirLog.SQL.Clear;
  LogsDM.InserirLog.SQL.Text :=
  'insert into logs (descricao, tela, data, usuario, emp_id) values (:descricao, :tela, :data, :usuario, :emp_id)';
  LogsDM.InserirLog.Parambyname('descricao').AsString :=
  'Alterou a unidade ' + unidade + ' na descrição ' + descricao + ' e ativo = ' + ativo;
  LogsDM.InserirLog.Parambyname('tela').AsString := 'CadUnidade';
  LogsDM.InserirLog.Parambyname('data').AsDateTime := Now;
  LogsDM.InserirLog.Parambyname('usuario').AsString := UsuarioLogado;
  LogsDM.InserirLog.Parambyname('emp_id').AsString := EmpresaLogada;

  try
  LogsDM.InserirLog.ExecSQL;
  CadUnidadeDM.UpdateQuery.ExecSQL;
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

  CadUnidadeDM.ConsultarUnidade.SQL.Clear;
  CadUnidadeDM.ConsultarUnidade.SQL.Text :=
  'select * from cadunidade';
  CadUnidadeDM.ConsultarUnidade.Open;
  ShowMessage('Alterado com sucesso!');
  except
  ShowMessage('Erro na gravação!');
  end;
end;

procedure TCadUnidade.btnDesistirClick(Sender: TObject);
begin
 CadUnidadeDM.ConsultarUnidade.SQL.Clear;
 CadUnidadeDM.ConsultarUnidade.SQL.Text :=
 'select * from cadunidade';
 CadUnidadeDM.ConsultarUnidade.Open;

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
begin
 unidade := EdtUnidade.Text;
 descricao := EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

  CadUnidadeDM.DeleteQuery.SQL.Clear;
  CadUnidadeDM.DeleteQuery.SQL.Text :=
  'delete from cadunidade where unidade = :unidade';
  CadUnidadeDM.DeleteQuery.ParamByName('unidade').AsString := unidade;

  LogsDM.InserirLog.SQL.Clear;
  LogsDM.InserirLog.SQL.Text :=
  'insert into logs (descricao, tela, data, usuario, emp_id) values (:descricao, :tela, :data, :usuario, :emp_id)';
  LogsDM.InserirLog.Parambyname('descricao').AsString :=
  'Excluiu a unidade ' + unidade + ' na descrição ' + descricao + ' e ativo = ' + ativo;
  LogsDM.InserirLog.Parambyname('tela').AsString := 'CadUnidade';
  LogsDM.InserirLog.Parambyname('data').AsDateTime := Now;
  LogsDM.InserirLog.Parambyname('usuario').AsString := UsuarioLogado;
  LogsDM.InserirLog.Parambyname('emp_id').AsString := EmpresaLogada;

  try
  LogsDM.InserirLog.ExecSQL;
  CadUnidadeDM.DeleteQuery.ExecSQL;
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

  CadUnidadeDM.ConsultarUnidade.SQL.Clear;
  CadUnidadeDM.ConsultarUnidade.SQL.Text :=
  'select * from cadunidade';
  CadUnidadeDM.ConsultarUnidade.Open;

  ShowMessage('Excluido com sucesso!');
  except
  ShowMessage('Erro na gravação!');
  end;
end;

procedure TCadUnidade.btnFecharClick(Sender: TObject);
begin
 Fechartela(sender);
end;

procedure TCadUnidade.FormShow(Sender: TObject);
begin
 CadUnidadeDM.ConsultarUnidade.SQL.Clear;
 CadUnidadeDM.ConsultarUnidade.SQL.Text :=
 'select * from cadunidade';
 CadUnidadeDM.ConsultarUnidade.Open;
end;

procedure TCadUnidade.GridCellClick(Column: TColumn);
begin
 EdtUnidade.Text := CadUnidadeDM.ConsultarUnidade.FieldByName('unidade').AsString;
 CBAtivo.Checked := CadUnidadeDM.ConsultarUnidade.FieldByName('Ativo').AsString = 'S';
 EdtDescricao.Text := CadUnidadeDM.ConsultarUnidade.FieldByName('Descricao').AsString;
end;
end.
