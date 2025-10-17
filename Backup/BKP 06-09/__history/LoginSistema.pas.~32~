unit LoginSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, System.Hash, IdHashMessageDigest, IdGlobal,
  Vcl.Grids,
  UsuarioDataModule,
  EmpresaDataModule;

type
  TLogin = class(TForm)
    Panel1: TPanel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    btnEntrar: TButton;
    btnFechar: TButton;
    lblEmpresa: TLabel;
    CBoxEmpresa: TComboBox;
    procedure btnEntrarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure CBoxEmpresaDropDown(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Login: TLogin;

implementation

{$R *.dfm}

Uses MenuPrincipal, GlobalUnit;

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

procedure TLogin.btnEntrarClick(Sender: TObject);
var usuario, senha, empresa: string;
begin
 usuario := edtusuario.Text;
 senha := edtsenha.Text;
 empresa := CBoxEmpresa.text;

 CadUsuarioDataModule.LoginQuery.SQL.Clear;
 CadUsuarioDataModule.LoginQuery.SQL.Text :=
 'select * from usuario where usuario = :usuario';
 CadUsuarioDataModule.LoginQuery.ParamByName('usuario').AsString := usuario;
 CadUsuarioDataModule.LoginQuery.Open;

 if CadUsuarioDataModule.LoginQuery.IsEmpty then begin
 ShowMessage('Usuário não encontrado!');
 end
 else begin

 CadUsuarioDataModule.LoginQuery.SQL.Clear;
 CadUsuarioDataModule.LoginQuery.SQL.Text :=
 'select * from usuario where usuario = :usuario and senha = :senha';
 CadUsuarioDataModule.LoginQuery.ParamByName('usuario').AsString := usuario;
 CadUsuarioDataModule.LoginQuery.ParamByName('senha').AsString := GerarHashMD5(senha);
 CadUsuarioDataModule.LoginQuery.Open;

 if CBoxEmpresa.Text = '' then begin
 ShowMessage('Nenhuma empresa selecionada!');
 end
 else begin

 if not CadUsuarioDataModule.LoginQuery.IsEmpty then begin
 UsuarioLogado := usuario;
 EmpresaLogada := CBoxEmpresa.text;
 ModalResult := mrOk;
 end
 else begin
 ShowMessage('Usuário ou senha incorretos!');
 end;
end;
end;
end;

procedure TLogin.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TLogin.CBoxEmpresaDropDown(Sender: TObject);
begin
  CBoxEmpresa.Items.Clear;

  CadEmpresaDataModule.CBEmpresa.Close;
  CadEmpresaDataModule.CBEmpresa.Open;

  while not CadEmpresaDataModule.CBEmpresa.Eof do
  begin
    CBoxEmpresa.Items.Add(CadEmpresaDataModule.CBEmpresa.FieldByName('EMP_ID').AsString);
    CadEmpresaDataModule.CBEmpresa.Next;
  end;
  CadEmpresaDataModule.CBEmpresa.Close;
end;
end.
