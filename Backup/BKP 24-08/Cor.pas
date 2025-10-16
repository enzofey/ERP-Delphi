unit Cor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  CorDataModule, ConsultarCorForm,
  LogDataModule, Log;

type
  TCadCor = class(TForm)
    Panel1: TPanel;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblAtivo: TLabel;
    CBAtivo: TCheckBox;
    EdtCodigo: TEdit;
    EdtDescricao: TEdit;
    btnIncluir: TButton;
    btnGravarIncluir: TButton;
    btnAlterar: TButton;
    btnGravarAlterar: TButton;
    btnConsultar: TButton;
    BtnExcluir: TButton;
    btnDesistir: TButton;
    btnFechar: TButton;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnGravarIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarAlterarClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadCor: TCadCor;

implementation

{$R *.dfm}

Uses GlobalUnit;

procedure TCadCor.btnIncluirClick(Sender: TObject);
begin
  EdtCodigo.Clear;
  EdtDescricao.Clear;

  EdtCodigo.Enabled := True;
  EdtDescricao.Enabled := True;
  CBAtivo.Enabled := True;

  BtnGravarIncluir.Visible := True;
  BtnDesistir.Visible := True;

  BtnIncluir.Visible := False;
  BtnAlterar.Visible := False;
  BtnConsultar.Visible:= False;
  BtnExcluir.Visible := False;
end;

procedure TCadCor.btnGravarIncluirClick(Sender: TObject);
var
  codigo, descricao, ativo: string;
begin
 if EdtCodigo.Text = '' then begin
 ShowMessage('Código não pode ser vazio!');
 end
 else begin

 if EdtDescricao.Text = '' then begin
 ShowMessage('Descrição não pode ser vazia!');
 end
 else begin

 codigo:= EdtCodigo.Text;
 descricao:= EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S'
 else ativo := 'N';

 CadCorModule.SelectQuery.SQL.Clear;
 CadCorModule.SelectQuery.SQL.Text :=
 'SELECT * FROM cadcor WHERE codigo=:codigo';
 CadCorModule.SelectQuery.ParamByName('codigo').AsString := codigo;
 CadCorModule.SelectQuery.Open;

 if NOT CadCorModule.SelectQuery.IsEmpty then begin
 showmessage('Cor já cadastrada!');
 end
 else begin

 CadCorModule.InsertQuery.SQL.Clear;
 CadCorModule.InsertQuery.SQL.Text :=
 'insert into cadcor (codigo, descricao, ativo) values (:codigo, :descricao, :ativo)';
 CadCorModule.InsertQuery.ParamByName('codigo').AsString := codigo;
 CadCorModule.InsertQuery.ParamByName('descricao').AsString := descricao;
 CadCorModule.InsertQuery.ParamByName('ativo').AsString := ativo;

 LogModule.InserirLog.SQL.Clear;
 LogModule.InserirLog.SQL.Text :=
 'insert into logs (descricao, tela, data, usuario, emp_id) values (:descricao, :tela, :data, :usuario, :emp_id)';
 LogModule.InserirLog.ParamByName('descricao').AsString :=
 'Inseriu a cor ' + descricao + ' no código ' + codigo + ' e ativo ' + ativo;
 LogModule.InserirLog.ParamByName('tela').AsString := 'CadCor';
 LogModule.InserirLog.ParamByName('data').AsDatetime := Now;
 LogModule.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
 LogModule.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
 try
 CadCorModule.InsertQuery.ExecSQL;
 LogModule.InserirLog.ExecSQL;
 ShowMessage('Gravado com sucesso!');
 BtnIncluir.Visible := True;
 BtnAlterar.Visible := True;
 BtnConsultar.Visible := True;
 BtnExcluir.Visible := True;

 BtnGravarIncluir.Visible := False;
 BtnDesistir.Visible := False;

 EdtCodigo.Enabled := False;
 EdtDescricao.Enabled := False;
 CBAtivo.Enabled := False;
 except
 ShowMessage('Erro na gravação!');
 end;
end;
end;
end;
end;

procedure TCadCor.btnAlterarClick(Sender: TObject);
begin
  if EdtCodigo.Text = '' then
  ShowMessage('Nenhuma cor selecionada!')
  else begin
  BtnIncluir.Visible := False;
  BtnGravarIncluir.Visible := False;
  BtnExcluir.Visible := False;
  BtnConsultar.Visible := False;
  BtnAlterar.Visible := False;

  BtnDesistir.Visible := True;
  BtnGravarAlterar.Visible := True;

  EdtDescricao.Enabled := True;
  CBAtivo.Enabled := True;
end;
end;

procedure TCadCor.btnGravarAlterarClick(Sender: TObject);
var codigo, descricao, ativo: string;
begin
 if EdtCodigo.Text = '' then begin
 ShowMessage('Código não pode ser vazio!');
 end
 else begin

 if EdtDescricao.Text = '' then begin
 ShowMessage('Descrição não pode ser vazia!');
 end
 else begin

 codigo:= EdtCodigo.Text;
 descricao:= EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S'
 else ativo := 'N';

 CadCorModule.UpdateQuery.SQL.Clear;
 CadCorModule.UpdateQuery.SQL.Text :=
 'update cadCor set codigo = :codigo, descricao = :descricao, ativo = :ativo where codigo = :codigo';
 CadCorModule.UpdateQuery.ParamByName('codigo').AsString := codigo;
 CadCorModule.UpdateQuery.ParamByName('descricao').AsString := descricao;
 CadCorModule.UpdateQuery.ParamByName('ativo').AsString := ativo;

 LogModule.InserirLog.SQL.Clear;
 LogModule.InserirLog.SQL.Text :=
 'insert into logs (descricao, tela, data, usuario, emp_id) values (:descricao, :tela, :data, :usuario, :emp_id)';
 LogModule.InserirLog.ParamByName('descricao').AsString :=
 'Alterou a cor ' + descricao + ' no código ' + codigo + ' e ativo ' + ativo;
 LogModule.InserirLog.ParamByName('tela').AsString := 'CadCor';
 LogModule.InserirLog.ParamByName('data').AsDatetime := Now;
 LogModule.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
  LogModule.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
 try
 CadCorModule.UpdateQuery.ExecSQL;
 LogModule.InserirLog.ExecSQL;
 ShowMessage('Alterado com sucesso!');
 BtnIncluir.Visible := True;
 BtnExcluir.Visible := True;
 BtnAlterar.Visible := True;
 BtnConsultar.Visible := True;

 BtnGravarIncluir.Visible := False;
 BtnDesistir.Visible := False;
 BtnGravarAlterar.Visible := False;

 EdtCodigo.Enabled := False;
 EdtDescricao.Enabled := False;
 CBAtivo.Enabled := False;
 except
 ShowMessage('Erro na alteração!');
 end;
end;
end;
end;

procedure TCadCor.btnDesistirClick(Sender: TObject);
begin
  BtnIncluir.Visible := True;
  BtnAlterar.Visible := True;
  BtnConsultar.Visible := True;
  BtnExcluir.Visible := True;

  BtnGravarIncluir.Visible := False;
  BtnDesistir.Visible := False;
  BtnGravarAlterar.Visible := False;

  EdtCodigo.Enabled := False;
  EdtDescricao.Enabled := False;
  CBAtivo.Enabled := False;

  EdtDescricao.Clear;
  EdtCodigo.Clear;
end;

procedure TCadCor.BtnExcluirClick(Sender: TObject);
var codigo, descricao, ativo: string;
begin
 descricao := EdtDescricao.Text;
 codigo:= EdtCodigo.Text;
 if CBAtivo.Checked then ativo := 'S'
 else ativo := 'N';

 CadCorModule.SelectQuery.SQL.Clear;
 CadCorModule.SelectQuery.SQL.Text :=
 'SELECT * FROM CadCor WHERE CODIGO = :codigo';
 CadCorModule.SelectQuery.ParamByName('codigo').AsString := codigo;
 CadCorModule.SelectQuery.Open;

 if CadCorModule.SelectQuery.IsEmpty then begin
 ShowMessage('Cor não encontrada!')
 end
 else begin
 CadCorModule.SelectQuery.SQL.Clear;
 CadCorModule.SelectQuery.SQL.Text :=
 'select * from estoque where cor = :descricao';
 CadCorModule.SelectQuery.ParamByName('descricao').AsString := descricao;
 CadCorModule.SelectQuery.Open;

 if not CadCorModule.SelectQuery.IsEmpty then begin
 ShowMessage('Cor está sendo utilizada no cadastro de produto! Favor verifique!');
 end

 else begin
 CadCorModule.DeleteQuery.SQL.Clear;
 CadCorModule.DeleteQuery.SQL.Text :=
 'delete from cadcor where codigo = :codigo';
 CadCorModule.DeleteQuery.ParamByName('codigo').AsString := codigo;

 LogModule.InserirLog.SQL.Clear;
 LogModule.InserirLog.SQL.Text :=
 'insert into logs (descricao, tela, data, usuario, emp_id) values (:descricao, :tela, :data, :usuario, :emp_id)';
 LogModule.InserirLog.ParamByName('descricao').AsString :=
 'Deletou a cor ' + descricao + ' no código ' + codigo + ' e ativo ' + ativo;
 LogModule.InserirLog.ParamByName('tela').AsString := 'CadCor';
 LogModule.InserirLog.ParamByName('data').AsDatetime := Now;
 LogModule.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
 LogModule.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
 try
 CadCorModule.DeleteQuery.ExecSQL;
 LogModule.InserirLog.ExecSQL;
 ShowMessage('Excluído com sucesso!');
 EdtCodigo.Clear;
 EdtDescricao.Clear;
 except
 ShowMessage('Erro na gravação!');
 end;
end;
end;
end;

procedure TCadCor.btnConsultarClick(Sender: TObject);
var codigo, descricao, ativo: string;
begin
  CadCorModule.ConsultarCor.SQL.Clear;
  CadCorModule.ConsultarCor.SQL.Text :=
  'select * from cadcor';
  CadCorModule.ConsultarCor.Open;

  Application.CreateForm(TConsultarCor, ConsultarCor);
  codigo := ConsultarCor.SelecionarCor;
  if codigo <> '' then
  begin
    descricao := ConsultarCor.Descricao;
    EdtCodigo.Text := codigo;
    EdtDescricao.Text := descricao;
    ativo := ConsultarCor.Ativo;
    CBAtivo.Checked := ativo = 'S';
  end;
end;

procedure TCadCor.btnFecharClick(Sender: TObject);
begin
 Fechartela(sender);
end;
end.
