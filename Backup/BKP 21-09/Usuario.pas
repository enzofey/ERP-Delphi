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
  ShowMessage('Nome do usuário não pode ficar em branco!');
  Abort;
 end;

 with CadUsuarioDM.InsertQuery do
 begin
  SQL.Clear;
  SQL.Add('insert into usuario (codigo, ativo, usuario, senha, senha_alterada)');
  SQL.Add('values');
  SQL.Add('(:codigo, :ativo, :usuario, :senha, :senha_alterada)');
  CadUsuarioDM.InsertQuery.ParamByName('codigo').AsString := codigo;
  ParamByName('usuario').AsString := usuario;
  ParamByName('ativo').AsString := ativo;
  ParamByName('senha').AsString := senha;
  ParamByName('senha_alterada').AsString := senha_alterada;
 end;

 with LogsDM.InserirLog do
 begin
  SQL.Clear;
  SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
  SQL.Add('values');
  SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
  ParamByName('descricao').AsString :=
  'Inseriu o usuário ' + usuario + ' no código ' + codigo + ' e ativo ' + ativo;
  ParamByName('tela').AsString := 'CadUsuario';
  ParamByName('data').AsDatetime := Now;
  ParamByName('usuario').AsString := UsuarioLogado;
  ParamByName('emp_id').AsString := EmpresaLogada;
 end;
 try
 LogsDM.InserirLog.ExecSQL;
 CadUsuarioDM.InsertQuery.ExecSQL;
 showMessage('Inserido com sucesso!');
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
 ShowMessage('Erro na inclusão!');
 end;
end;

procedure TCadUsuario.btnAlterarClick(Sender: TObject);
begin
 if EdtCodigo.Text = '' then begin
  ShowMessage('Usuário não selecionado!');
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
  ShowMessage('Nome do usuário não pode ficar em branco!');
  Abort;
 end;

 With CadUsuarioDM.UpdateQuery do
 begin
  SQL.Clear;
  SQL.Add('update usuario set usuario = :usuario, ativo = :ativo where codigo = :codigo');
  ParamByName('codigo').AsString := codigo;
  ParamByName('usuario').AsString := usuario;
  ParamByName('ativo').AsString := ativo;
 end;

 With LogsDM.InserirLog do
 begin
  SQL.Clear;
  SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
  SQL.Add('values');
  SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
  ParamByName('descricao').AsString :=
 'Alterou o usuário ' + usuario + ' no código ' + codigo + ' e ativo ' + ativo;
  ParamByName('tela').AsString := 'CadUsuario';
  ParamByName('data').AsDatetime := Now;
  ParamByName('usuario').AsString := UsuarioLogado;
  ParamByName('emp_id').AsString := EmpresaLogada;
 end;

 try
 LogsDM.InserirLog.ExecSQL;
 CadUsuarioDM.UpdateQuery.ExecSQL;
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
 ShowMessage('Erro na alteração!');
 end;
end;

procedure TCadUsuario.btnConsultarClick(Sender: TObject);
var codigo, usuario, ativo: string;
begin
 with CadUsuarioDM.ConsultarUsuario do
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
  ShowMessage('Usuário não selecionado!');
  Abort;
 end;

 With CadUsuarioDM.DeleteQuery do
 begin
  SQL.Clear;
  SQL.Add('delete from usuario where codigo = :codigo');
  ParamByName('codigo').AsString := codigo;
 end;

 With LogsDM.InserirLog do
 begin
  SQL.Clear;
  SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
  SQL.Add('values');
  SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
  ParamByName('descricao').AsString :=
  'Excluiu o usuário ' + usuario + ' no código ' + codigo + ' e ativo ' + ativo;
  ParamByName('tela').AsString := 'CadUsuario';
  ParamByName('data').AsDatetime := Now;
  ParamByName('usuario').AsString := UsuarioLogado;
  ParamByName('emp_id').AsString := EmpresaLogada;
 end;

 try
 LogsDM.InserirLog.ExecSQL;
 CadUsuarioDM.DeleteQuery.ExecSQL;
 ShowMessage('Excluído com sucesso!');
 EdtUsuario.Clear;
 EdtCodigo.Clear;

 with CadUsuarioDM.qryGrid do
 begin
  SQL.Clear;
  SQL.Add('select codigo, usuario, ativo from usuario');
  Open;
 end;

 except
 ShowMessage('Erro na exclusão!');
 end;
end;

procedure TCadUsuario.SBEntidadeClick(Sender: TObject);
var codigo, usuario: string;
begin
 With CadEntidadeDM.ConsultarEntidade do
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
 EdtCodigo.text := CadUsuarioDM.qryGrid.FieldByName('codigo').AsString;
 EdtUsuario.text := CadUsuarioDM.qryGrid.FieldByName('usuario').AsString;
 if CadUsuarioDM.qryGrid.FieldByName('ativo').AsString = 'S' then CBAtivo.Checked;
end;
end.
