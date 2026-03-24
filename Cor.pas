unit Cor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  CorDM, ConsultarCorForm,
  LogDM, Log, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TCadCor = class(TForm)
    Pages: TPageControl;
    AcessoPage: TTabSheet;
    CadastroPage: TTabSheet;
    btnIncluir: TButton;
    btnGravarIncluir: TButton;
    btnGravarAlterar: TButton;
    CBAtivo: TCheckBox;
    lblAtivo: TLabel;
    EdtDescricao: TEdit;
    EdtCodigo: TEdit;
    btnAlterar: TButton;
    lblDescricao: TLabel;
    lblCodigo: TLabel;
    btnConsultar: TButton;
    btnFechar: TButton;
    BtnExcluir: TButton;
    btnDesistir: TButton;
    lblConsCodigo: TLabel;
    EdtAcessoCodigo: TEdit;
    SBConsCor: TSpeedButton;
    btnAcessoConsultar: TButton;
    btnAcessoFechar: TButton;
    AcessoGrid: TDBGrid;
    RGAcessoAtivo: TRadioGroup;
    EdtAcessoDescricao: TEdit;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnGravarIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarAlterarClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAcessoConsultarClick(Sender: TObject);
    procedure SBConsCorClick(Sender: TObject);
    procedure EdtAcessoCodigoChange(Sender: TObject);
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
var codigo, descricao, ativo: string;
begin
 codigo:= EdtCodigo.Text;
 descricao:= EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if codigo = '' then begin
  ShowMessage('Código não pode ser vazio!');
  Abort;
 end;

 if Descricao = '' then begin
  ShowMessage('Descrição não pode ser vazia!');
  Abort;
 end;

 with CadCorDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcor where codigo = :codigo');
  ParamByName('codigo').AsString := codigo;
  Open;

  if not IsEmpty then begin
   ShowMessage('Cor já cadastrada!');
   Abort;
  end;
 end;

 CadCorDM.Conexão.StartTransaction;
 try
  with CadCorDM.qryInsert do
  begin
   SQL.Clear;
   SQL.Add('insert into cadcor (codigo, descricao, ativo)');
   SQL.Add('values');
   SQL.Add('(:codigo, :descricao, :ativo)');
   ParamByName('codigo').AsString := codigo;
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
   ParamByName('descricao').AsString :=
   'Inseriu a cor ' + descricao + ' no código ' + codigo + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadCor';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadCorDM.Conexão.Commit;
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
  CadCorDM.Conexão.Rollback;
  ShowMessage('Erro na gravação!');
 end;
end;

procedure TCadCor.btnAlterarClick(Sender: TObject);
begin
 if EdtCodigo.Text = '' then begin
  ShowMessage('Nenhuma cor selecionada!');
  Abort;
 end;

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

procedure TCadCor.btnGravarAlterarClick(Sender: TObject);
var codigo, descricao, ativo: string;
begin
 codigo:= EdtCodigo.Text;
 descricao:= EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if Codigo = '' then begin
  ShowMessage('Código não pode ser vazio!');
  Abort;
 end;

 if Descricao = '' then begin
  ShowMessage('Descrição não pode ser vazia!');
  Abort;
 end;

 CadCorDM.Conexão.StartTransaction;
 try
  With CadCorDM.qryUpdate do
  begin
   SQL.Clear;
   SQL.Add('update cadcor set codigo = :codigo, descricao = :descricao, ativo = :ativo where codigo = :codigo');
   ParamByName('codigo').AsString := codigo;
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
   ParamByName('descricao').AsString :=
   'Alterou a cor ' + descricao + ' no código ' + codigo + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadCor';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadCorDM.Conexão.Commit;
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
  CadCorDM.Conexão.Rollback;
  ShowMessage('Erro na alteração!');
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
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 with CadCorDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcor where codigo = :codigo');
  ParamByName('codigo').AsString := codigo;
  Open;

  if IsEmpty then begin
   ShowMessage('Cor não encontrada!');
   Abort;
  end;

  SQL.Clear;
  SQL.Add('select * from estoque where cor = :descricao');
  ParamByName('descricao').AsString := descricao;
  Open;

  if not IsEmpty then begin
   ShowMessage('Cor está sendo utilizada no cadastro de produto! Favor verifique!');
   Abort;
  end;
 end;

 CadCorDM.Conexão.StartTransaction;
 try
  with CadCorDM.qryDelete do
  begin
   SQL.Clear;
   SQL.Add('delete from cadcor where codigo = :codigo');
   ParamByName('codigo').AsString := codigo;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, usuario, emp_id)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :usuario, :emp_id)');
   ParamByName('descricao').AsString :=
   'Deletou a cor ' + descricao + ' no código ' + codigo + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadCor';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadCorDM.Conexão.Commit;
  ShowMessage('Excluído com sucesso!');
  EdtCodigo.Clear;
  EdtDescricao.Clear;
  except
  CadCorDM.Conexão.Rollback;
  ShowMessage('Erro na gravação!');
 end;
end;

procedure TCadCor.btnConsultarClick(Sender: TObject);
var codigo, descricao, ativo: string;
begin
 with CadCorDM.qryConsultarCor do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcor');
  Open;
 end;

 Application.CreateForm(TConsultarCor, ConsultarCor);
 codigo := ConsultarCor.SelecionarCor;
 if codigo <> '' then begin
  EdtCodigo.Text := codigo;
  descricao := ConsultarCor.Descricao;
  EdtDescricao.Text := descricao;
  ativo := ConsultarCor.Ativo;
  CBAtivo.Checked := ativo = 'S';
 end;
end;

procedure TCadCor.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;

procedure TCadCor.SBConsCorClick(Sender: TObject);
var codigo, descricao: string;
begin
 with CadCorDM.qryConsultarCor do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcor');
  Open;
 end;

 Application.CreateForm(TConsultarCor, ConsultarCor);
 codigo := ConsultarCor.SelecionarCor;
 if codigo <> '' then begin
  EdtAcessoCodigo.Text := codigo;
  descricao := ConsultarCor.Descricao;
  EdtAcessoDescricao.Text := descricao;
 end;
end;

procedure TCadCor.btnAcessoConsultarClick(Sender: TObject);
var codigo, ativo: string;
    temwhere: boolean;
    i: integer;
begin
 codigo := EdtAcessoCodigo.Text;
 if RGAcessoAtivo.ItemIndex = 0 then ativo := 'S'
 else if RGAcessoAtivo.ItemIndex = 1 then ativo := 'N';

 with CadCorDM.qryAcesso do
 begin;
  SQL.Clear;
  SQL.Add('select * from cadcor');
  temwhere := false;

  if codigo <> '' then begin
   if temwhere then begin
    SQL.Add('and codigo = :codigo');
   end
   else begin
    SQL.Add('where codigo = :codigo');
    temwhere := true;
   end;
  ParamByName('codigo').AsString := codigo;
  end;

  if ativo = 'S' then begin
   if temwhere then
    begin
     SQL.Add('and ativo = :ativo');
    end
    else begin
     SQL.Add('where ativo = :ativo');
     temwhere := true;
    end;
  ParamByName('ativo').AsString := 'S';
  end;

  if ativo = 'N' then begin
   if temwhere then begin
    SQL.Add('and ativo = :ativo');
   end
   else begin
    SQL.Add('where ativo = :ativo');
    temwhere := true;
   end;
  ParamByName('ativo').AsString := 'N';
  end;
 Open;
 end;
 for i := 0 to AcessoGrid.Columns.Count - 1 do
 AcessoGrid.Columns[i].Width := AcessoGrid.Canvas.TextWidth(AcessoGrid.Columns[i].Title.Caption + '     ');
end;

procedure TCadCor.EdtAcessoCodigoChange(Sender: TObject);
var codigo, descricao: string;
begin
 codigo := EdtAcessoCodigo.Text;

 with CadCorDM.qryConsultarCor do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcor where codigo = :codigo');
  ParamByName('codigo').AsString := codigo;
  Open;

  EdtAcessoDescricao.Text := FieldByName('descricao').AsString;
 end;
end;
end.
