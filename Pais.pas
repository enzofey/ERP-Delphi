unit Pais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.ComCtrls,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids,
  PaisDM, ConsultarPaisForm,
  Log, LogDM,
  GlobalUnit, Vcl.Buttons;

type
  TCadPaisForm = class(TForm)
    lblSigla: TLabel;
    lblPais: TLabel;
    lblAtivo: TLabel;
    EdtSigla: TEdit;
    CBAtivo: TCheckBox;
    Grid: TDBGrid;
    btnIncluir: TButton;
    btnDesistir: TButton;
    btnExcluir: TButton;
    btnGravarIncluir: TButton;
    btnGravarAlterar: TButton;
    btnAlterar: TButton;
    btnFechar: TButton;
    Pages: TPageControl;
    AcessoPage: TTabSheet;
    CadastroPage: TTabSheet;
    RGAcessoAtivo: TRadioGroup;
    lblAcessoSiglaPais: TLabel;
    EdtAcessoSiglaPais: TEdit;
    EdtAcessoPais: TEdit;
    SBConsPais: TSpeedButton;
    btnAcessoFechar: TButton;
    btnAcessoConsultar: TButton;
    AcessoGrid: TDBGrid;
    EdtPais: TEdit;
    EdtCodigo_IBGE: TEdit;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure btnGravarIncluirClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAcessoConsultarClick(Sender: TObject);
    procedure SBConsPaisClick(Sender: TObject);
    procedure EdtAcessoSiglaPaisChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadPaisForm: TCadPaisForm;

implementation

{$R *.dfm}

procedure TCadPaisForm.btnIncluirClick(Sender: TObject);
var I: Integer;
begin
 with CadPaisDM.qryConsultarPais do
 begin
  SQL.Clear;
  SQL.Add('select * from cadpais');
  Open;
 end;

 EdtSigla.Enabled := True;
 EdtCodigo_IBGE.Enabled := True;
 CBAtivo.Enabled := True;
 EdtPais.Enabled := True;

 EdtSigla.Clear;
 EdtCodigo_IBGE.Clear;
 EdtPais.Clear;

 btnIncluir.Visible := False;
 btnAlterar.Visible := False;
 btnExcluir.Visible := False;
 btnGravarAlterar.Visible := False;

 btnGravarIncluir.Visible := True;
 btnDesistir.Visible := True;

 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TCadPaisForm.btnGravarIncluirClick(Sender: TObject);
var sigla, pais, ativo, codigo_ibge: string;
    I: Integer;
begin
 sigla := EdtSigla.Text;
 Pais := EdtPais.Text;
 if CBAtivo.Checked then Ativo := 'S' else Ativo := 'N';
 codigo_ibge := EdtCodigo_IBGE.text;

 if Sigla = '' then begin
  ShowMessage('Sigla não pode ser vazia!');
  Abort;
 end;

 if Pais = '' then begin
  ShowMessage('País não pode ser vazio!');
  Abort;
 end;

 if codigo_ibge = '' then begin
  ShowMessage('Código do IBGE não pode ser vazio!');
  Abort;
 end;

 with CadPaisDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadpais where Codigo_IBGE = :Codigo_IBGE');
  ParambyName('Codigo_IBGE').AsString := Codigo_IBGE;
  Open;

  if not IsEmpty then begin
   ShowMessage('Codigo IBGE já cadastrada!');
   Abort;
  end;
 end;

 CadPaisDM.Conexão.StartTransaction;
 try
  with CadPaisDM.qryInsert do
  begin
   SQL.Clear;
   SQL.Add('insert into cadpais (sigla, pais, ativo, codigo_ibge)');
   SQL.Add('values');
   SQL.Add('(:sigla, :pais, :ativo, :codigo_ibge)');
   ParamByName('sigla').AsString := sigla;
   ParamByName('ativo').AsString := ativo;
   ParamByName('pais').AsString := pais;
   ParamByName('codigo_ibge').AsString := codigo_ibge;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
   ParamByName('descricao').AsString :=
   'Inseriu o país ' + pais + ' na sigla ' + sigla + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadPais';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadPaisDM.Conexão.Commit;
  ShowMessage('Gravado com sucesso!');
  EdtSigla.Enabled := False;
  EdtCodigo_IBGE.Enabled := False;
  CBAtivo.Enabled := False;
  EdtPais.Enabled := False;

  btnIncluir.Visible := True;
  btnAlterar.Visible := True;
  btnExcluir.Visible := True;

  btnGravarAlterar.Visible := False;
  btnGravarIncluir.Visible := False;
  btnDesistir.Visible := False;

  with CadPaisDM.qryConsultarPais do
  begin
   SQL.Clear;
   SQL.Add('select * from cadpais');
   Open;
  end;

  for i := 0 to Grid.Columns.Count - 1 do
   Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
  except
  ShowMessage('Erro na inclusão!');
  CadPaisDM.Conexão.Rollback;
 end;
end;

procedure TCadPaisForm.btnAlterarClick(Sender: TObject);
var I: integer;
begin
 if EdtCodigo_IBGE.Text = '' then begin
  ShowMessage('País não selecionado!');
  Abort;
 end;

 EdtSigla.Enabled := True;
 CBAtivo.Enabled := True;
 EdtPais.Enabled := True;

 btnIncluir.Visible := False;
 btnAlterar.Visible := False;
 btnGravarIncluir.Visible := False;
 btnExcluir.Visible := False;

 btnGravarAlterar.Visible := True;
 btnDesistir.Visible := True;

 with CadPaisDM.qryConsultarPais do
 begin
  SQL.Clear;
  SQL.Add('select * from cadpais');
  Open;
 end;

 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TCadPaisForm.btnGravarAlterarClick(Sender: TObject);
var sigla, pais, ativo, codigo_ibge: string;
    I: integer;
begin
 Sigla := EdtSigla.Text;
 Pais := EdtPais.Text;
 if CBAtivo.Checked then Ativo := 'S' else Ativo := 'N';
 codigo_ibge := EdtCodigo_IBGE.Text;

 if Sigla = '' then begin
  ShowMessage('Sigla não pode ser vazia!');
  Abort;
 end;

 if Pais = '' then begin
  ShowMessage('País não pode ser vazio!');
  Abort;
 end;

 if codigo_ibge = '' then begin
  ShowMessage('Código do IBGE não pode ser vazio!');
  Abort;
 end;

 with CadPaisDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadpais where codigo_ibge = :codigo_ibge');
  ParambyName('codigo_ibge').AsString := codigo_ibge;
  Open;

  if IsEmpty then begin
   ShowMessage('Código IBGE já cadastrado!');
   Abort;
  end;
 end;

 CadPaisDM.Conexão.StartTransaction;
 try
  with CadPaisDM.qryUpdate do
  begin
   SQL.Clear;
   SQL.Add('update cadpais set pais = :pais, ativo = :ativo, sigla = :sigla where codigo_ibge = :codigo_ibge');
   ParamByName('sigla').AsString := sigla;
   ParamByName('pais').AsString := pais;
   ParamByName('ativo').AsString := ativo;
   ParamByName('codigo_ibge').AsString := codigo_ibge;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, usuario, emp_id)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :usuario, :emp_id)');
   ParamByName('descricao').AsString :=
   'Alterou o país ' + pais + ' na sigla ' + sigla + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadPais';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadPaisDM.Conexão.Commit;
  ShowMessage('Alterado com sucesso!');

  EdtSigla.Enabled := False;
  EdtCodigo_IBGE.Enabled := False;
  CBAtivo.Enabled := False;
  EdtPais.Enabled := False;

  btnIncluir.Visible := True;
  btnAlterar.Visible := True;
  btnExcluir.Visible := True;

  btnGravarAlterar.Visible := False;
  btnGravarIncluir.Visible := False;
  btnDesistir.Visible := False;

  with CadPaisDM.qryConsultarPais do
  begin
   SQL.Clear;
   SQL.Add('select * from cadpais');
   Open;
  end;
  for i := 0 to Grid.Columns.Count - 1 do
   Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 except
  CadPaisDM.Conexão.Rollback;
  ShowMessage('Erro na alteração!');
 end;
end;

procedure TCadPaisForm.btnDesistirClick(Sender: TObject);
var I: integer;
begin
 with CadPaisDM.qryConsultarPais do
 begin
  SQL.Clear;
  SQL.Add('select * from cadpais');
  Open;
 end;

 EdtSigla.Enabled := False;
 EdtCodigo_IBGE.Enabled := False;
 CBAtivo.Enabled := False;
 EdtPais.Enabled := False;

 EdtSigla.Clear;
 EdtCodigo_IBGE.Clear;
 EdtPais.Clear;

 btnIncluir.Visible := True;
 btnAlterar.Visible := True;
 btnExcluir.Visible := True;

 btnGravarAlterar.Visible := False;
 btnGravarIncluir.Visible := False;
 btnDesistir.Visible := False;

 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TCadPaisForm.btnExcluirClick(Sender: TObject);
var Codigo_IBGE, pais, sigla, ativo: string;
    I: integer;
begin
 sigla := EdtSigla.Text;
 pais := EdtCodigo_IBGE.text;
 if CBAtivo.Checked then Ativo := 'S' else Ativo := 'N';
 Codigo_IBGE := EdtCodigo_IBGE.Text;

 with CadPaisDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadCEP where pais = :Codigo_IBGE');
  ParamByName('Codigo_IBGE').AsString := Codigo_IBGE;
  Open;

  if not IsEmpty then begin
   ShowMessage('País está sendo usado no cadastro de CEP! Favor verifique!');
   Abort;
  end;
 end;

 with CadPaisDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadestado where pais = :Codigo_IBGE');
  ParamByName('Codigo_IBGE').AsString := Codigo_IBGE;
  Open;

  if not IsEmpty then begin
   ShowMessage('País está sendo usado no cadastro de Estado! Favor verifique!');
   Abort;
  end;
 end;

 with CadPaisDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcidade where pais = :Codigo_IBGE');
  ParamByName('Codigo_IBGE').AsString := Codigo_IBGE;
  Open;

  if not IsEmpty then begin
   ShowMessage('País está sendo usado no cadastro de Cidade! Favor verifique!');
   Abort;
  end;
 end;

 with CadPaisDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadentidade where pais = :Codigo_IBGE');
  ParamByName('Codigo_IBGE').AsString := Codigo_IBGE;
  Open;

  if not IsEmpty then begin
   ShowMessage('País está sendo usado no cadastro de Entidade! Favor verifique!');
   Abort;
  end;
 end;

 CadPaisDM.Conexão.StartTransaction;
 try
  with CadPaisDM.qryDelete do
  begin
   SQL.Clear;
   SQL.Add('delete from cadpais where Codigo_IBGE = :Codigo_IBGE');
   ParamByName('Codigo_IBGE').AsString := Codigo_IBGE;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
   ParamByName('descricao').AsString :=
   'Deletou o país ' + pais + ' na sigla ' + sigla + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadPaís';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  ShowMessage('Excluído com sucesso!');
  CadPaisDM.Conexão.Commit;

  EdtSigla.Enabled := False;
  EdtCodigo_IBGE.Enabled := False;
  CBAtivo.Enabled := False;

  EdtSigla.Clear;
  EdtCodigo_IBGE.Clear;
  EdtPais.Clear;

  btnIncluir.Visible := True;
  btnAlterar.Visible := True;
  btnExcluir.Visible := True;

  btnGravarAlterar.Visible := False;
  btnGravarIncluir.Visible := False;
  btnDesistir.Visible := False;

  with CadPaisDM.qryConsultarPais do
  begin
   SQL.Clear;
   SQL.Add('select * from cadpais');
   Open;
  end;

  for i := 0 to Grid.Columns.Count - 1 do
   Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
  except
  ShowMessage('Erro na exclusão');
  CadPaisDM.Conexão.Rollback;
 end;
end;

procedure TCadPaisForm.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;

procedure TCadPaisForm.GridCellClick(Column: TColumn);
begin
 with CadPaisDM.qryConsultarPais do
 begin
  EdtPais.Text := FieldByName('Pais').AsString;
  EdtSigla.Text := FieldByName('sigla').AsString;
  EdtCodigo_IBGE.Text := FieldByName('Codigo_IBGE').AsString;
  CBAtivo.Checked := FieldByName('ativo').AsString = 'S';
 end;
end;

procedure TCadPaisForm.SBConsPaisClick(Sender: TObject);
var codigo, sigla, pais: string;
begin
 with CadPaisDM.qryConsultarPais do
 begin
  SQL.Clear;
  SQL.Add('select * from cadpais where ativo = :ativo');
  Parambyname('ativo').AsString := 'S';
  Open;
 end;

 Application.CreateForm(TConsultarPais, ConsultarPais);
 codigo := ConsultarPais.SelecionarPais;

 if codigo <> '' then begin
  sigla := ConsultarPais.Sigla;
  EdtAcessoSiglaPais.Text := sigla;
  pais := ConsultarPais.Pais;
  EdtAcessoPais.Text := Pais;
 end;
end;

procedure TCadPaisForm.EdtAcessoSiglaPaisChange(Sender: TObject);
var sigla: string;
begin
 sigla := EdtAcessoSiglaPais.Text;

 with CadPaisDM.qryConsultarPais do
 begin
  SQL.Clear;
  SQL.Add('select * from cadpais where sigla = :sigla');
  Parambyname('sigla').AsString := sigla;
  Open;

  EdtAcessoPais.Text := FieldByName('pais').AsString;
 end;
end;

procedure TCadPaisForm.FormShow(Sender: TObject);
var i: Integer;
begin
 with CadPaisDM.qryConsultarPais do
 begin
  SQL.Clear;
  SQL.Add('select * from cadpais');
  Open;
 end;

 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TCadPaisForm.btnAcessoConsultarClick(Sender: TObject);
var I: integer;
    temwhere: boolean;
    sigla: string;
begin
 sigla := EdtAcessoSiglaPais.Text;
 CadPaisDM.qryAcesso.SQL.Clear;
 CadPaisDM.qryAcesso.SQL.Text :=
 'select * from cadpais';
 temwhere := false;

 if sigla <> '' then begin
  if temwhere then begin
   CadPaisDM.qryAcesso.SQL.Add('and sigla = :sigla');
  end
  else begin
   CadPaisDM.qryAcesso.SQL.Add('where sigla = :sigla');
   temwhere := true;
  end;
  CadPaisDM.qryAcesso.ParamByName('sigla').AsString := sigla;
 end;

 if RGAcessoAtivo.ItemIndex = 0 then begin
  if temwhere then begin
   CadPaisDM.qryAcesso.SQL.Add('and ativo = :ativo');
  end
  else begin
   CadPaisDM.qryAcesso.SQL.Add('where ativo = :ativo');
   temwhere := true;
  end;
  CadPaisDM.qryAcesso.ParamByName('ativo').AsString := 'S';
 end;

 if RGAcessoAtivo.ItemIndex = 1 then begin
  if temwhere then begin
   CadPaisDM.qryAcesso.SQL.Add('and ativo = :ativo');
  end
  else begin
   CadPaisDM.qryAcesso.SQL.Add('where ativo = :ativo');
  end;
  CadPaisDM.qryAcesso.ParamByName('ativo').AsString := 'N';
 end;

 CadPaisDM.qryAcesso.Open;
 for i := 0 to AcessoGrid.Columns.Count - 1 do
  AcessoGrid.Columns[i].Width := AcessoGrid.Canvas.TextWidth(AcessoGrid.Columns[i].Title.Caption + '     ');
end;
end.
