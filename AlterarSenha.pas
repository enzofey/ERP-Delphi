unit AlterarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, IdHashMessageDigest, IdGlobal, Vcl.Buttons,
  Usuario, UsuarioDM, ConsultarUsuarioForm,
  LogDM,
  GlobalUnit;

type
  TAlterarSenhaForm = class(TForm)
    Panel1: TPanel;
    lblSenhaAntiga: TLabel;
    lblSenhaNova: TLabel;
    lblConfirmarSenha: TLabel;
    edtconfirmarsenha: TEdit;
    edtnovasenha: TEdit;
    btnGravar: TButton;
    btnDesistir: TButton;
    lblUsuario: TLabel;
    SBUsuario: TSpeedButton;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    procedure btnDesistirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure SBUsuarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AlterarSenhaForm: TAlterarSenhaForm;

implementation

{$R *.dfm}

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

procedure TAlterarSenhaForm.btnDesistirClick(Sender: TObject);
begin
 Close;
end;

procedure TAlterarSenhaForm.btnGravarClick(Sender: TObject);
var novasenha, senha, confirmarsenha, usuario: string;
begin
 usuario := EdtUsuario.Text;
 senha := EdtSenha.Text;
 novasenha := EdtNovaSenha.Text;
 confirmarsenha := EdtConfirmarSenha.Text;

 if Usuario = '' then begin
  ShowMessage('Usuário não selecionado!');
  Abort;
 end;

 if NovaSenha = '' then begin
  ShowMessage('Senha não pode ficar em branco!');
  Abort;
 end;

 with CadUsuarioDM.qrySenha do
 begin
  SQL.Clear;
  SQL.Add('select * from usuario where usuario = :usuario and senha = :senha');
  ParamByName('usuario').AsString := usuario;
  ParamByName('senha').AsString := GerarHashMD5(senha);
  Open;

  if IsEmpty then begin
   ShowMessage('Usuário e senha não conferem!');
   Abort;
  end;
 end;

 if novasenha <> confirmarsenha then begin
  ShowMessage('Senhas não são iguais! Favor verifique!');
  Abort;
 end;

 CadUsuarioDM.Conexão.StartTransaction;
 try
  with CadUsuarioDM.qrySenha do
  begin
   SQL.Clear;
   SQL.Add('update usuario set senha = :novasenha, senha_alterada = :senha_alterada where usuario = :usuario');
   ParamByName('usuario').AsString := usuario;
   ParamByName('novasenha').AsString := GerarHashMD5(novasenha);
   ParamByName('senha_alterada').AsString := 'S';
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
   ParamByName('descricao').AsString := 'Alterou a senha do usuário: ' + usuario;
   ParamByName('tela').AsString := 'ImpressaoNFe';
   ParamByName('emp_id').AsString := EmpresaLogada;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('data').AsDateTime := Now;
   ExecSQL;
  end;

  CadUsuarioDM.Conexão.Commit;
  ShowMessage('Senha alterada com sucesso!');
  Close;
 except
  CadUsuarioDM.Conexão.Rollback;
  ShowMessage('Erro na alteração!');
 end;
end;

procedure TAlterarSenhaForm.SBUsuarioClick(Sender: TObject);
var codigo, usuario, ativo: string;
begin
 with CadUsuarioDM.qryConsultarUsuario do
 begin
  SQL.Clear;
  SQL.Add('select * from cadusuario where ativo = :ativo');
  ParamByName('ativo').AsString := 'S';
  Open;
 end;

 Application.CreateForm(TConsultarUsuario, ConsultarUsuario);
 codigo := ConsultarUsuario.SelecionarUsuario;

 if codigo <> '' then begin
  usuario := ConsultarUsuario.Usuario;
  EdtUsuario.Text := usuario;
 end;
end;
end.
