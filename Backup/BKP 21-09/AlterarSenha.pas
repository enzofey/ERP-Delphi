unit AlterarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, IdHashMessageDigest, IdGlobal, Vcl.Buttons,
  Usuario, UsuarioDM, ConsultarUsuarioForm;

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

 if EdtUsuario.Text = '' then begin
 ShowMessage('Usuário não selecionado!');
 end
 else begin

 if EdtNovaSenha.Text = '' then begin
 ShowMessage('Senha não pode ficar em branco!')
 end
 else begin

 CadUsuarioDM.SenhaQuery.SQL.Text :=
 'select * from usuario where usuario = :usuario and senha = :senha';
 CadUsuarioDM.SenhaQuery.ParamByName('usuario').AsString := usuario;
 CadUsuarioDM.SenhaQuery.ParamByName('senha').AsString := GerarHashMD5(senha);
 CadUsuarioDM.SenhaQuery.Open;

 if CadUsuarioDM.SenhaQuery.IsEmpty then begin
 ShowMessage('Usuário e senha não conferem!');
 end
 else begin

 if novasenha <> confirmarsenha then begin
 ShowMessage('Senhas não são iguais! Favor verifique!');
 end
 else begin

 CadUsuarioDM.SenhaQuery.SQL.Text :=
 'update usuario set senha = :novasenha, senha_alterada = :senha_alterada where usuario = :usuario';
 CadUsuarioDM.SenhaQuery.ParamByName('usuario').AsString := usuario;
 CadUsuarioDM.SenhaQuery.ParamByName('novasenha').AsString := GerarHashMD5(novasenha);
 CadUsuarioDM.SenhaQuery.ParamByName('senha_alterada').AsString := 'S';
 try
 CadUsuarioDM.SenhaQuery.ExecSQL;
 ShowMessage('Senha alterada com sucesso!');
 Close;
 except
 ShowMessage('Erro na alteração!');
 end;
end;
end;
end;
end;
end;

procedure TAlterarSenhaForm.SBUsuarioClick(Sender: TObject);
var codigo, usuario, ativo: string;
begin
  CadUsuarioDM.ConsultarUsuario.SQL.Clear;
  CadUsuarioDM.ConsultarUsuario.SQL.Text :=
  'select * from cadusuario where ativo = :ativo';
  CadUsuarioDM.ConsultarUsuario.ParamByName('ativo').AsString := 'S';
  CadUsuarioDM.ConsultarUsuario.Open;

  Application.CreateForm(TConsultarUsuario, ConsultarUsuario);
  codigo := ConsultarUsuario.SelecionarUsuario;
  if codigo <> '' then
  begin
    usuario := ConsultarUsuario.Usuario;
    EdtUsuario.Text := usuario;
  end;
end;
end.
