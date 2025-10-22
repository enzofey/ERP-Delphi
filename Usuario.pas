unit Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, IdHashMessageDigest, IdGlobal,
  Vcl.Buttons,
  UsuarioDM, ConsultarUsuarioForm,
  ConsultarEntidadeForm, EntidadeDM,
  LogDM,
  GlobalUnit, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TCadUsuario = class(TForm)
    Pages: TPageControl;
    CadastroPage: TTabSheet;
    btnAlterar: TButton;
    btnConsultar: TButton;
    btnDesistir: TButton;
    btnExcluir: TButton;
    btnFechar: TButton;
    btnGravarAlterar: TButton;
    btnGravarIncluir: TButton;
    btnIncluir: TButton;
    CBAtivo: TCheckBox;
    Grid: TDBGrid;
    edtCodigo: TEdit;
    EdtUsuario: TEdit;
    lblAtivo: TLabel;
    lblCodigo: TLabel;
    lblUsuario: TLabel;
    SBEntidade: TSpeedButton;
    procedure btnFecharClick(Sender: TObject);
    procedure SBEntidadeClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure btnGravarIncluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
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
  CadUsuario: TCadUsuario;

implementation

{$R *.dfm}

Uses MenuPrincipal;

procedure TCadUsuario.FormShow(Sender: TObject);
begin
 with CadUsuarioDM.qryGrid do
 begin
  SQL.Clear;
  SQL.Add('select codigo, usuario, ativo from usuario');
  Open;
 end;
end;

function GerarHashMD5(const Senha: string): string;
var
  Hash: TIdHashMessageDigest5;
begin
  Hash := TIdHashMessageDigest5.Create;
  try
    Result := Hash.HashStringAsHex(Senha, IndyTextEncoding_UTF8);
  finally
    Hash.Free;
  end;
end;

procedure TCadUsuario.btnIncluirClick(Sender: TObject);
begin
 EdtUsuario.Enabled := True;
 CBAtivo.Enabled := True;

 EdtCodigo.Clear;
 EdtUsuario.Clear;

 SBEntidade.Enabled := True;
 btnGravarIncluir.Visible := True;
 btnDesistir.Visible := True;

 btnAlterar.Visible := False;
 btnConsultar.Visible := False;
 btnExcluir.Visible := False;
end;

procedure TCadUsuario.btnGravarIncluirClick(Sender: TObject);
var codigo, usuario, ativo, senha, senha_alterada: string;
begin
 codigo := EdtCodigo.text;
 usuario := EdtUsuario.text;
 senha := GerarHashMD5('123456');
 senha_alterada := 'N';
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if codigo = '' then begin
  ShowMessage('Nenhuma entidade informada!');
  Abort;
 end;

 if Usuario = '' then begin
  ShowMessage('Nome do usu�rio n�o pode ficar em branco!');
  Abort;
 end;

 CadUsuarioDM.Conex�o.StartTransaction;
 try
  with CadUsuarioDM.qryInsert do
  begin
   SQL.Clear;
   SQL.Add('insert into usuario (codigo, ativo, usuario, senha, senha_alterada)');
   SQL.Add('values');
   SQL.Add('(:codigo, :ativo, :usuario, :senha, :senha_alterada)');
   ParamByName('codigo').AsString := codigo;
   ParamByName('usuario').AsString := usuario;
   ParamByName('ativo').AsString := ativo;
   ParamByName('senha').AsString := senha;
   ParamByName('senha_alterada').AsString := senha_alterada;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
   ParamByName('descricao').AsString :=
   'Inseriu o usu�rio ' + usuario + ' no c�digo ' + codigo + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadUsuario';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadUsuarioDM.Conex�o.Commit;
  ShowMessage('Inserido com sucesso!');
  EdtUsuario.Enabled := False;
  CBAtivo.Enabled := False;

  SBEntidade.Enabled := False;
  btnGravarIncluir.Visible := False;
  btnDesistir.Visible := False;

  btnAlterar.Visible := True;
  btnConsultar.Visible := True;
  btnExcluir.Visible := True;

  with CadUsuarioDM.qryGrid do
  begin
   SQL.Clear;
   SQL.Add('select codigo, usuario, ativo from usuario');
   Open;
  end;

 except
  CadUsuarioDM.Conex�o.Rollback;
  ShowMessage('Erro na inclus�o!');
 end;
end;

procedure TCadUsuario.btnAlterarClick(Sender: TObject);
begin
 if EdtCodigo.Text = '' then begin
  ShowMessage('Usu�rio n�o selecionado!');
  Abort;
 end;

 btnIncluir.Visible := False;
 btnExcluir.Visible := False;
 btnConsultar.Visible := False;

 btnGravarAlterar.Visible := True;
 btnDesistir.Visible := True;

 EdtUsuario.Enabled := True;
 CBAtivo.Enabled := True;

 with CadUsuarioDM.qryGrid do
 begin
  SQL.Clear;
  SQL.Add('select codigo, usuario, ativo from usuario');
  Open;
 end;
end;

procedure TCadUsuario.btnGravarAlterarClick(Sender: TObject);
var codigo, usuario, ativo: string;
begin
 codigo := EdtCodigo.text;
 usuario := EdtUsuario.text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if codigo = '' then begin
  ShowMessage('Nenhuma entidade informada!');
  Abort;
 end;

 if usuario = '' then begin
  ShowMessage('Nome do usu�rio n�o pode ficar em branco!');
  Abort;
 end;

 CadUsuarioDM.Conex�o.StartTransaction;
 try
  with CadUsuarioDM.qryUpdate do
  begin
   SQL.Clear;
   SQL.Add('update usuario set usuario = :usuario, ativo = :ativo where codigo = :codigo');
   ParamByName('codigo').AsString := codigo;
   ParamByName('usuario').AsString := usuario;
   ParamByName('ativo').AsString := ativo;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
   ParamByName('descricao').AsString :=
   'Alterou o usu�rio ' + usuario + ' no c�digo ' + codigo + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadUsuario';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadUsuarioDM.Conex�o.Commit;
  ShowMessage('Alterado com sucesso!');
  EdtUsuario.Enabled := False;
  CBAtivo.Enabled := False;

  btnGravarAlterar.Visible := False;
  btnDesistir.Visible := False;

  btnIncluir.Visible := True;
  btnAlterar.Visible := True;
  btnConsultar.Visible := True;
  btnExcluir.Visible := True;

  with CadUsuarioDM.qryGrid do
  begin
   SQL.Clear;
   SQL.Add('select codigo, usuario, ativo from usuario');
   Open;
  end;

 except
 CadUsuarioDM.Conex�o.Rollback;
 ShowMessage('Erro na altera��o!');
 end;
end;

procedure TCadUsuario.btnConsultarClick(Sender: TObject);
var codigo, usuario, ativo: string;
begin
 with CadUsuarioDM.qryConsultarUsuario do
 begin
  SQL.Clear;
  SQL.Add('select * from cadusuario');
  Open;
 end;

 Application.CreateForm(TConsultarUsuario, ConsultarUsuario);
 codigo := ConsultarUsuario.SelecionarUsuario;

 if codigo <> '' then begin
  EdtCodigo.Text := codigo;
  usuario := ConsultarUsuario.Usuario;
  EdtUsuario.Text := usuario;
  ativo := ConsultarUsuario.Ativo;
  CBAtivo.Checked := ativo = 'S';
 end;
end;

procedure TCadUsuario.btnDesistirClick(Sender: TObject);
begin
 EdtUsuario.Enabled := False;
 CBAtivo.Enabled := False;

 SBEntidade.Enabled := False;
 btnGravarIncluir.Visible := False;
 btnDesistir.Visible := False;

 btnAlterar.Visible := True;
 btnConsultar.Visible := True;
 btnExcluir.Visible := True;

 with CadUsuarioDM.qryGrid do
 begin
  SQL.Clear;
  SQL.Add('select codigo, usuario, ativo from usuario');
  Open;
 end;
end;

procedure TCadUsuario.btnExcluirClick(Sender: TObject);
var codigo, usuario, ativo, senha, senha_alterada: string;
begin
 codigo := EdtCodigo.text;
 usuario := EdtUsuario.text;
 senha := '123456';
 senha_alterada := 'N';
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if codigo = '' then begin
  ShowMessage('Usu�rio n�o selecionado!');
  Abort;
 end;

 CadUsuarioDM.Conex�o.StartTransaction;
 try
  with CadUsuarioDM.qryDelete do
  begin
   SQL.Clear;
   SQL.Add('delete from usuario where codigo = :codigo');
   ParamByName('codigo').AsString := codigo;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
    SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
   ParamByName('descricao').AsString :=
   'Excluiu o usu�rio ' + usuario + ' no c�digo ' + codigo + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadUsuario';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadUsuarioDM.Conex�o.Commit;
  ShowMessage('Exclu�do com sucesso!');
  EdtUsuario.Clear;
  EdtCodigo.Clear;

  with CadUsuarioDM.qryGrid do
  begin
   SQL.Clear;
   SQL.Add('select codigo, usuario, ativo from usuario');
   Open;
  end;

 except
  CadUsuarioDM.Conex�o.Rollback;
  ShowMessage('Erro na exclus�o!');
 end;
end;

procedure TCadUsuario.SBEntidadeClick(Sender: TObject);
var codigo, usuario: string;
begin
 With CadEntidadeDM.qryConsultarEntidade do
 begin
  SQL.Clear;
  SQL.Add('select * from cadentidade where ativo = :ativo');
  ParamByName('ativo').AsString := 'S';
  Open;
 end;

 Application.CreateForm(TConsultarEntidade, ConsultarEntidade);
 codigo := ConsultarEntidade.SelecionarEntidade;

 if codigo <> '' then begin
  EdtCodigo.Text := codigo;
  usuario := ConsultarEntidade.nome;
  EdtUsuario.Text := StringReplace(UpperCase(ConsultarEntidade.nome), ' ', '.', [rfReplaceAll]);
 end;
end;

procedure TCadUsuario.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;

procedure TCadUsuario.GridCellClick(Column: TColumn);
begin
 with CadUsuarioDM.qryGrid do
 begin
  EdtCodigo.text := FieldByName('codigo').AsString;
  EdtUsuario.text := FieldByName('usuario').AsString;
  if FieldByName('ativo').AsString = 'S' then CBAtivo.Checked;
 end;
end;
end.
