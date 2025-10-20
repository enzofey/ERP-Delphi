unit Tamanho;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  TamanhoDataModule, ConsultarTamanhoForm,
  Log, LogDataModule,
  GlobalUnit;

type
  TCadTamanho = class(TForm)
    Panel1: TPanel;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblAtivo: TLabel;
    EdtCodigo: TEdit;
    EdtDescricao: TEdit;
    CBAtivo: TCheckBox;
    btnIncluir: TButton;
    btnGravarIncluir: TButton;
    btnGravarAlterar: TButton;
    btnAlterar: TButton;
    btnDesistir: TButton;
    btnConsultar: TButton;
    btnExcluir: TButton;
    btnFechar: TButton;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnGravarIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarAlterarClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadTamanho: TCadTamanho;

implementation

{$R *.dfm}

procedure TCadTamanho.btnIncluirClick(Sender: TObject);
begin
 EdtCodigo.Clear;
 EdtDescricao.Clear;

 BtnIncluir.Visible := False;
 BtnAlterar.Visible := False;
 BtnExcluir.Visible := False;
 BtnConsultar.Visible := False;

 BtnGravarIncluir.Visible := True;
 BtnDesistir.Visible := True;
 EdtCodigo.Enabled := True;
 EdtDescricao.Enabled := True;
 CBAtivo.Enabled := True;
end;

procedure TCadTamanho.btnGravarIncluirClick(Sender: TObject);
var codigo, descricao, ativo: string;
begin
 codigo:= EdtCodigo.Text;
 descricao:= EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S'
 else ativo := 'N';

 if EdtCodigo.Text = '' then begin
 ShowMessage('Código não pode ser vazio!');
 end
 else begin

 if EdtDescricao.Text = '' then begin
 ShowMessage('Descrição não pode ser vazia!');
 end
 else begin

 CadTamanhoDataModule.SelectQuery.SQL.Clear;
 CadTamanhoDataModule.SelectQuery.SQL.Text :=
 'SELECT * FROM CadTamanho WHERE codigo=:codigo';
 CadTamanhoDataModule.SelectQuery.ParamByName('codigo').AsString := codigo;
 CadTamanhoDataModule.SelectQuery.Open;

 if NOT CadTamanhoDataModule.SelectQuery.IsEmpty then begin
 showmessage('Tamanho já cadastrado!')
 end
 else begin

 CadTamanhoDataModule.InsertQuery.SQL.Clear;
 CadTamanhoDataModule.InsertQuery.SQL.Text :=
 'insert into CadTamanho (codigo, descricao, ativo) values (:codigo, :descricao, :ativo)';
 CadTamanhoDataModule.InsertQuery.ParamByName('codigo').AsString := codigo;
 CadTamanhoDataModule.InsertQuery.ParamByName('descricao').AsString := descricao;
 CadTamanhoDataModule.InsertQuery.ParamByName('ativo').AsString := ativo;

 LogModule.InserirLog.SQL.Clear;
 LogModule.InserirLog.SQL.Text :=
 'insert into logs (descricao, tela, data, emp_id, usuario) values (:descricao, :tela, :data, :emp_id, :usuario)';
 LogModule.InserirLog.ParamByName('descricao').AsString :=
 'Inseriu o tamanho ' + descricao + ' no código ' + codigo + ' e ativo ' + ativo;
 LogModule.InserirLog.ParamByName('tela').AsString := 'CadTamanho';
 LogModule.InserirLog.ParamByName('data').AsDatetime := Now;
 LogModule.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
 LogModule.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
 try
 CadTamanhoDataModule.InsertQuery.ExecSQL;
 LogModule.InserirLog.ExecSQL;
 ShowMessage('Gravado com sucesso!');
 BtnIncluir.Visible := True;
 BtnAlterar.Visible := True;
 BtnExcluir.Visible := True;
 BtnConsultar.Visible := True;

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

procedure TCadTamanho.btnAlterarClick(Sender: TObject);
begin
  if EdtCodigo.Text = '' then
  ShowMessage('Nenhum tamanho selecionado!')
  else begin
  BtnConsultar.Visible := False;
  BtnIncluir.Visible := False;
  BtnGravarIncluir.Visible := False;
  BtnExcluir.Visible := False;
  BtnAlterar.Visible := False;

  BtnGravarAlterar.Visible := True;
  BtnDesistir.Visible := True;
  EdtDescricao.Enabled := True;
  CBAtivo.Enabled := True;
end;
end;

procedure TCadTamanho.btnGravarAlterarClick(Sender: TObject);
var codigo, descricao, ativo: string;
begin
 codigo:= EdtCodigo.Text;
 descricao:= EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S'
 else ativo := 'N';

 if EdtCodigo.Text = '' then begin
 ShowMessage('Código não pode ser vazio!');
 end
 else begin

 if EdtDescricao.Text = '' then begin
 ShowMessage('Descrição não pode ser vazia!');
 end
 else begin

 CadTamanhoDataModule.UpdateQuery.SQL.Clear;
 CadTamanhoDataModule.UpdateQuery.SQL.Text :=
 'update CadTamanho set descricao = :descricao, ativo = :ativo where codigo = :codigo';
 CadTamanhoDataModule.UpdateQuery.ParamByName('codigo').AsString := codigo;
 CadTamanhoDataModule.UpdateQuery.ParamByName('descricao').AsString := descricao;
 CadTamanhoDataModule.UpdateQuery.ParamByName('ativo').AsString := ativo;

 LogModule.InserirLog.SQL.Clear;
 LogModule.InserirLog.SQL.Text :=
 'insert into logs (descricao, tela, data, emp_id, usuario) values (:descricao, :tela, :data, :emp_id, :usuario)';
 LogModule.InserirLog.ParamByName('descricao').AsString :=
 'Alterou o tamanho ' + descricao + ' no código ' + codigo + ' e ativo ' + ativo;
 LogModule.InserirLog.ParamByName('tela').AsString := 'CadTamanho';
 LogModule.InserirLog.ParamByName('data').AsDatetime := Now;
 LogModule.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
 LogModule.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
 try
 CadTamanhoDataModule.UpdateQuery.ExecSQL;
 LogModule.InserirLog.ExecSQL;
 ShowMessage('Gravado com sucesso!');
 BtnIncluir.Visible := True;
 BtnAlterar.Visible := True;
 BtnExcluir.Visible := True;
 BtnConsultar.Visible := True;

 BtnGravarIncluir.Visible := False;
 BtnDesistir.Visible := False;
 BtnGravarAlterar.Visible := False;

 EdtCodigo.Enabled := False;
 EdtDescricao.Enabled := False;
 CBAtivo.Enabled := False;
 except
 ShowMessage('Erro na gravação!');
 end;
end;
end;
end;

procedure TCadTamanho.btnConsultarClick(Sender: TObject);
var codigo, descricao, ativo: string;
begin
  CadTamanhoDataModule.ConsultarTamanho.SQL.Clear;
  CadTamanhoDataModule.ConsultarTamanho.SQL.Text :=
  'select * from cadtamanho';
  CadTamanhoDataModule.ConsultarTamanho.Open;
  Application.CreateForm(TConsultarTamanho, ConsultarTamanho);
  codigo := ConsultarTamanho.SelecionarTamanho;
  if codigo <> '' then
  begin
    descricao := ConsultarTamanho.Descricao;
    EdtCodigo.Text := codigo;
    EdtDescricao.Text := descricao;
    ativo := ConsultarTamanho.Ativo;
    CBAtivo.Checked := ativo = 'S';
  end;
end;

procedure TCadTamanho.btnDesistirClick(Sender: TObject);
begin
  BtnIncluir.Visible := True;

  BtnGravarIncluir.Visible := False;
  BtnDesistir.Visible := False;
  BtnGravarAlterar.Visible := False;

  EdtCodigo.Enabled := False;
  EdtDescricao.Enabled := False;
  CBAtivo.Enabled := False;

  EdtCodigo.Clear;
  EdtDescricao.Clear;

  BtnAlterar.Visible := True;
  BtnExcluir.Visible := True;
  BtnConsultar.Visible := True;
end;

procedure TCadTamanho.btnExcluirClick(Sender: TObject);
var codigo, tela, descricao, ativo: string;
begin
 codigo:= EdtCodigo.Text;
 descricao := EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S'
 else ativo := 'N';

 CadTamanhoDataModule.SelectQuery.SQL.Clear;
 CadTamanhoDataModule.SelectQuery.SQL.Text :=
 'SELECT * FROM CadTamanho WHERE CODIGO = :codigo';
 CadTamanhoDataModule.SelectQuery.ParamByName('codigo').AsString := codigo;
 CadTamanhoDataModule.SelectQuery.Open;

 if CadTamanhoDataModule.SelectQuery.IsEmpty then begin
 ShowMessage('Tamanho não encontrado!')
 end
 else begin

 CadTamanhoDataModule.SelectQuery.SQL.Clear;
 CadTamanhoDataModule.SelectQuery.SQL.Text :=
  'SELECT cf.codigo FROM CadFaixa cf ' +
  'INNER JOIN CadTamanho ct ON CONCAT('' / '', cf.descricao, '' / '') LIKE CONCAT(''% / '', ct.descricao, '' / %'') ' +
  'WHERE ct.descricao = :descricao';
 CadTamanhoDataModule.SelectQuery.ParamByName('descricao').AsString := descricao;
 CadTamanhoDataModule.SelectQuery.Open;

 if not CadTamanhoDataModule.SelectQuery.IsEmpty then begin
 ShowMessage('Tamanho usado em uma Faixa de Tamanho! Favor verifique!');
 end
 else begin

 CadTamanhoDataModule.DeleteQuery.SQL.Clear;
 CadTamanhoDataModule.DeleteQuery.SQL.Text :=
 'delete from CadTamanho where codigo = :codigo';
 CadTamanhoDataModule.DeleteQuery.ParamByName('codigo').AsString := codigo;

 LogModule.InserirLog.SQL.Clear;
 LogModule.InserirLog.SQL.Text :=
 'insert into logs (descricao, tela, data, emp_id, usuario) values (:descricao, :tela, :data, :emp_id, :usuario)';
 LogModule.InserirLog.ParamByName('descricao').AsString :=
 'Deletou o tamanho ' + descricao + ' no código ' + codigo + ' e ativo ' + ativo;
 LogModule.InserirLog.ParamByName('tela').AsString := 'CadTamanho';
 LogModule.InserirLog.ParamByName('data').AsDatetime := Now;
 LogModule.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
 LogModule.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
 try
 CadTamanhoDataModule.DeleteQuery.ExecSQL;
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

procedure TCadTamanho.btnFecharClick(Sender: TObject);
begin
 Fechartela(sender);
end;
end.
