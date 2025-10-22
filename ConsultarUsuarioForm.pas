unit ConsultarUsuarioForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, UsuarioDM;

type
  TConsultarUsuario = class(TForm)
    Panel1: TPanel;
    Grid: TDBGrid;
    BtnSelecionarUsuario: TButton;
    procedure BtnSelecionarUsuarioClick(Sender: TObject);
  private
    UCodigo: string;
    UUsuario: string;
    UAtivo: string;
  public
    function SelecionarUsuario: string;
    function Usuario: string;
    function ativo: string;
  end;

var
  ConsultarUsuario: TConsultarUsuario;

implementation

{$R *.dfm}

function TConsultarUsuario.SelecionarUsuario: string;
begin
  UCodigo := '';
  ShowModal;
  Result := UCodigo;
end;

function TConsultarUsuario.Usuario: string;
begin
  Result := UUsuario;
end;

function TConsultarUsuario.Ativo: string;
begin
  Result := UAtivo;
end;

procedure TConsultarUsuario.BtnSelecionarUsuarioClick(Sender: TObject);
begin
 with CadUsuarioDM.qryConsultarUsuario do
 begin
  UCodigo := FieldByName('codigo').AsString;
  UUsuario := FieldByName('usuario').AsString;
  UAtivo := FieldByName('ativo').AsString;
 end;
 Close;
end;
end.
