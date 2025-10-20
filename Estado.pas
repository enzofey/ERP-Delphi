unit Estado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.ComCtrls,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Data.DB, Vcl.DBGrids, Vcl.Buttons,
  EstadoDM, ConsultarEstadoForm,
  ConsultarPaisForm, PaisDM,
  Log, LogDM,
  GlobalUnit;

type
  TCadEstado = class(TForm)
    Pages: TPageControl;
    PagesCadastro: TTabSheet;
    btnAlterar: TButton;
    btnDesistir: TButton;
    btnExcluir: TButton;
    btnFechar: TButton;
    btnGravarAlterar: TButton;
    btnGravarIncluir: TButton;
    btnIncluir: TButton;
    CBAtivo: TCheckBox;
    EdtCodigo: TEdit;
    EdtEstado: TEdit;
    EdtPaisSigla: TEdit;
    EdtSigla: TEdit;
    Grid: TDBGrid;
    lblAtivo: TLabel;
    lblCodigo: TLabel;
    lblEstado: TLabel;
    lblPais: TLabel;
    lblSigla: TLabel;
    SBPais: TSpeedButton;
    AcessoPage: TTabSheet;
    RGAcessoAtivo: TRadioGroup;
    lblAcessoSigla: TLabel;
    EdtAcessoSiglaEstado: TEdit;
    EdtAcessoEstado: TEdit;
    btnAcessoFechar: TButton;
    btnAcessoConsultar: TButton;
    AcessoGrid: TDBGrid;
    SBConsEstado: TSpeedButton;
    lblAcessoPais: TLabel;
    EdtAcessoSiglaPais: TEdit;
    EdtAcessoPais: TEdit;
    SBConsPais: TSpeedButton;
    EdtPais: TEdit;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnGravarIncluirClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure SBPaisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure SBConsEstadoClick(Sender: TObject);
    procedure SBConsPaisClick(Sender: TObject);
    procedure EdtPaisSiglaChange(Sender: TObject);
    procedure EdtAcessoSiglaEstadoChange(Sender: TObject);
    procedure EdtAcessoSiglaPaisChange(Sender: TObject);
    procedure btnAcessoConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadEstado: TCadEstado;

implementation

{$R *.dfm}

procedure TCadEstado.FormShow(Sender: TObject);
var i: Integer;
begin
 with CadEstadoDM.qryConsultarEstado do
 begin
  SQL.Clear;
  SQL.Add('select * from cadestado');
  Open;
 end;

 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TCadEstado.btnIncluirClick(Sender: TObject);
var i: integer;
begin
 with CadEstadoDM.qryConsultarEstado do
 begin
  SQL.Clear;
  SQL.Add('select * from cadestado');
  Open;
 end;

 EdtCodigo.Clear;
 EdtSigla.Clear;
 EdtEstado.Clear;
 EdtPaisSigla.Clear;
 EdtPais.Clear;

 EdtSigla.Enabled := True;
 EdtCodigo.Enabled := True;
 CBAtivo.Enabled := True;
 EdtEstado.Enabled := True;
 EdtPaisSigla.Enabled := True;
 SBPais.Enabled := True;

 btnIncluir.Visible := False;
 btnExcluir.Visible := False;
 btnAlterar.Visible := False;
 btnGravarAlterar.Visible := False;
 Grid.Enabled := False;

 btnGravarIncluir.Visible := True;
 btnDesistir.Visible := True;

 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TCadEstado.btnGravarIncluirClick(Sender: TObject);
var codigo, estado, pais, ativo, sigla: string;
    I: integer;
begin
 codigo := EdtCodigo.Text;
 Estado := EdtEstado.Text;
 Pais := EdtPaisSigla.Text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';
 sigla := EdtSigla.Text;

 if codigo = '' then begin
  ShowMessage('Código não pode ser vazio!');
  Abort;
 end;

 if Estado = '' then begin
  ShowMessage('Estado não pode ser vazio!');
  Abort;
 end;

 if Pais = '' then begin
  ShowMessage('País não pode ser vazio!');
  Abort;
 end;

 if Sigla = '' then begin
  ShowMessage('Sigla não pode ser vazio!');
  Abort;
 end;

 with CadEstadoDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadestado where codigo = :codigo');
  ParamByName('codigo').AsString := codigo;
  Open;

  if not IsEmpty then begin
   ShowMessage('Estado já cadastrado!');
   Abort;
  end;
 end;

 CadEstadoDM.Conexão.StartTransaction;
 try
  with CadEstadoDM.qryInsert do
  begin
   SQL.Clear;
   SQL.Add('insert into cadestado (codigo, estado, pais, sigla, ativo)');
   SQL.Add('values');
   SQL.Add('(:codigo, :estado, :pais, :sigla, :ativo)');
   ParamByName('codigo').AsString := codigo;
   ParamByName('estado').AsString := estado;
   ParamByName('pais').AsString := pais;
   ParamByName('sigla').AsString := sigla;
   ParamByName('ativo').AsString := ativo;
   ExecSQL
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
   ParamByName('descricao').AsString :=
   'Inseriu o Estado ' + Estado + ' na sigla ' + sigla + ' no país ' + pais + ' no código ' + codigo + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadEstado';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadEstadoDM.Conexão.Commit;
  ShowMessage('Gravado com sucesso');
  EdtCodigo.Enabled := False;
  CBAtivo.Enabled := False;
  EdtEstado.Enabled := False;
  EdtPais.Enabled := False;
  EdtPaisSigla.Enabled := False;
  EdtSigla.Enabled := False;
  Grid.Enabled := True;

  btnIncluir.Visible := True;
  btnExcluir.Visible := True;
  btnAlterar.Visible := True;
  SBPais.Enabled := False;
  btnGravarAlterar.Visible := False;
  btnGravarIncluir.Visible := False;
  btnDesistir.Visible := False;

  with CadEstadoDM.qryConsultarEstado do
  begin
   SQL.Clear;
   SQL.Add('select * from cadestado');
   Open;
  end;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

  except
  ShowMessage('Erro na gravação, operação abortada!');
  CadEstadoDM.Conexão.Rollback;
 end;
end;

procedure TCadEstado.btnAlterarClick(Sender: TObject);
var I: integer;
begin
 with CadEstadoDM.qryConsultarEstado do
 begin
  SQL.Clear;
  SQL.Add('select * from cadestado');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 if EdtCodigo.Text = '' then begin
  ShowMessage('Nenhum estado selecionado!');
  Abort;
 end;

 CBAtivo.Enabled := True;
 EdtEstado.Enabled := True;
 EdtPaisSigla.Enabled := True;
 EdtSigla.Enabled := True;

 Grid.Enabled := False;
 btnIncluir.Visible := False;
 btnExcluir.Visible := False;
 btnAlterar.Visible := False;
 SBPais.Enabled := True;
 btnGravarAlterar.Visible := True;

 btnGravarIncluir.Visible := False;
 btnDesistir.Visible := True
end;

procedure TCadEstado.btnGravarAlterarClick(Sender: TObject);
var codigo, estado, pais, ativo, sigla: string;
    I: integer;
begin
 codigo := EdtCodigo.Text;
 estado := EdtEstado.Text;
 Pais := EdtPaisSigla.Text;
 if CBAtivo.Checked then Ativo := 'S' else Ativo := 'N';
 sigla := EdtSigla.Text;

 if Codigo = '' then begin
  ShowMessage('Código não pode ser vazio!');
  Abort;
 end;

 if Estado = '' then begin
  ShowMessage('Estado não pode ser vazio!');
  Abort;
 end;

 if Pais = '' then begin
  ShowMessage('País não pode ser vazio!');
  Abort;
 end;

 if Sigla = '' then begin
  ShowMessage('Sigla não pode ser vazio!');
  Abort;
 end;

 CadEstadoDM.Conexão.StartTransaction;
 try
  with CadEstadoDM.qryUpdate do
  begin
   SQL.Clear;
   SQL.Add('update cadestado set estado = :estado, sigla = :sigla, pais = :pais, ativo = :ativo where codigo = :codigo');
   ParamByName('codigo').AsString := codigo;
   ParamByName('estado').AsString := estado;
   ParamByName('pais').AsString := pais;
   ParamByName('ativo').AsString := ativo;
   ParamByName('sigla').AsString := sigla;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
   ParamByName('descricao').AsString :=
   'Alterou o Estado ' + Estado + ' na sigla ' + sigla + ' no país ' + pais + ' no código ' + codigo + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadEstado';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   LogsDM.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadEstadoDM.Conexão.Commit;
  ShowMessage('Alterado com sucesso!');
  EdtCodigo.Enabled := False;
  CBAtivo.Enabled := False;
  EdtEstado.Enabled := False;
  EdtPaisSigla.Enabled := False;
  EdtSigla.Enabled := False;
  Grid.Enabled := True;

  btnIncluir.Visible := True;
  btnExcluir.Visible := True;
  btnAlterar.Visible := True;
  SBPais.Enabled := False;
  btnGravarAlterar.Visible := False;
  btnGravarIncluir.Visible := False;
  btnDesistir.Visible := False;

  with CadEstadoDM.qryConsultarEstado do
  begin
   SQL.Clear;
   SQL.Add('select * from cadestado');
   Open;
  end;

  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
  except
  CadEstadoDM.Conexão.Rollback;
  ShowMessage('Erro na gravação, operação abortada!');
 end;
end;

procedure TCadEstado.btnDesistirClick(Sender: TObject);
begin
 with CadEstadoDM.qryConsultarEstado do
 begin
  SQL.Clear;
  SQL.Add('select * from cadestado');
  Open;
 end;

 EdtCodigo.Enabled := False;
 CBAtivo.Enabled := False;
 EdtEstado.Enabled := False;
 EdtPaisSigla.Enabled := False;
 EdtSigla.Enabled := False;
 Grid.Enabled := True;

 btnIncluir.Visible := True;
 btnExcluir.Visible := True;
 btnAlterar.Visible := True;
 SBPais.Enabled := False;
 btnGravarAlterar.Visible := False;
 btnGravarIncluir.Visible := False;
 btnDesistir.Visible := False;

 EdtCodigo.Clear;
 EdtEstado.Clear;
 EdtPais.Clear;
 EdtPaisSigla.Clear;
 EdtSigla.Clear;
end;

procedure TCadEstado.btnExcluirClick(Sender: TObject);
var codigo, estado, pais, ativo, sigla: string;
    I: integer;
begin
 codigo := EdtCodigo.Text;
 estado := EdtEstado.Text;
 Pais := EdtPaisSigla.Text;
 if CBAtivo.Checked then Ativo := 'S' else Ativo := 'N';
 sigla := EdtSigla.Text;

 with CadEstadoDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcidade where estado = :sigla');
  ParamByName('sigla').AsString := sigla;
  Open;

  if not IsEmpty then begin
   ShowMessage('Estado está sendo usado no cadastro de Cidade! Favor verifique!');
   Abort;
  end;

  SQL.Clear;
  SQL.Add('select * from cadcep where estado = :sigla');
  ParamByName('sigla').AsString := sigla;
  Open;

  if not IsEmpty then begin
   ShowMessage('Estado está sendo usado no cadastro de CEP! Favor verifique!');
   Abort;
  end;

  SQL.Clear;
  SQL.Add('select * from cadentidade where estado = :sigla');
  ParamByName('sigla').AsString := codigo;
  Open;

  if not IsEmpty then begin
   ShowMessage('Estado está sendo usado no cadastro de Entidade! Favor verifique!');
   Abort;
  end;
 end;

 CadEstadoDM.Conexão.StartTransaction;
 try
  with CadEstadoDM.qryDelete do
  begin
   SQL.Clear;
   SQL.Add('delete from cadestado where codigo = :codigo');
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
   'Deletou o Estado ' + Estado + ' na sigla ' + sigla + ' no país ' + pais + ' no código ' + codigo + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadEstado';
   LogsDM.InserirLog.ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadEstadoDM.Conexão.Commit;
  ShowMessage('Excluído com sucesso');
  EdtCodigo.Enabled := False;
  CBAtivo.Enabled := False;
  EdtEstado.Enabled := False;
  EdtPais.Enabled := False;
  EdtSigla.Enabled := False;

  btnIncluir.Visible := True;
  btnExcluir.Visible := True;
  btnAlterar.Visible := True;
  SBPais.Enabled := False;
  btnGravarAlterar.Visible := False;
  btnGravarIncluir.Visible := False;
  btnDesistir.Visible := False;

  EdtCodigo.Clear;
  EdtEstado.Clear;
  EdtPais.Clear;
  EdtPaisSigla.Clear;
  EdtSigla.Clear;

  with CadEstadoDM.qryConsultarEstado do
  begin
   SQL.Clear;
   SQL.Add('select * from cadestado');
   Open;
  end;

  for i := 0 to Grid.Columns.Count - 1 do
   Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
  except
  ShowMessage('Erro na gravação!');
  CadEstadoDM.Conexão.Rollback;
 end;
end;

procedure TCadEstado.GridCellClick(Column: TColumn);
var codigo, estado, pais, ativo: string;
begin
 with CadEstadoDM.qryConsultarEstado do
 begin
  EdtCodigo.Text := FieldByName('codigo').AsString;
  EdtSigla.Text := FieldByName('sigla').AsString;
  EdtEstado.Text := FieldByName('estado').AsString;
  EdtPaisSigla.Text := FieldByName('pais').AsString;
  CBAtivo.Checked := FieldByName('ativo').AsString = 'S';
 end;
end;

procedure TCadEstado.SBPaisClick(Sender: TObject);
var Pais, codigo, sigla: string;
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
  EdtPaisSigla.Text := sigla;
  pais := ConsultarPais.Pais;
  EdtPais.Text := Pais;
 end;
end;

procedure TCadEstado.btnAcessoConsultarClick(Sender: TObject);
var estado, pais: string;
    temwhere: boolean;
    I: integer;
begin
 estado := EdtAcessoSiglaEstado.Text;
 pais := EdtAcessoSiglaPais.Text;

 CadEstadoDM.AcessoQuery.SQL.Clear;
 CadEstadoDM.AcessoQuery.SQL.Text :=
 'select * from cadestado';
 temwhere := false;

 if estado <> '' then begin
  if temwhere then begin
   CadEstadoDM.AcessoQuery.SQL.Add('and sigla = :sigla');
  end
  else begin
   CadEstadoDM.AcessoQuery.SQL.Add('where sigla = :sigla');
   temwhere := true;
  end;
  CadEstadoDM.AcessoQuery.ParamByName('sigla').AsString := estado;
 end;

 if pais <> '' then begin
  if temwhere then begin
   CadEstadoDM.AcessoQuery.SQL.Add('and pais = :pais');
  end
  else begin
   CadEstadoDM.AcessoQuery.SQL.Add('where pais = :pais');
   temwhere := true;
  end;
  CadEstadoDM.AcessoQuery.ParamByName('pais').AsString := pais;
 end;

 if RGAcessoAtivo.ItemIndex = 0 then begin
  if temwhere then begin
   CadEstadoDM.AcessoQuery.SQL.Add('and ativo = :ativo');
  end
  else begin
   CadEstadoDM.AcessoQuery.SQL.Add('where ativo = :ativo');
   temwhere := true;
  end;
  CadEstadoDM.AcessoQuery.ParamByName('ativo').AsString := 'S';
 end;

  if RGAcessoAtivo.ItemIndex = 1 then begin
  if temwhere then begin
   CadEstadoDM.AcessoQuery.SQL.Add('and ativo = :ativo');
  end
  else begin
   CadEstadoDM.AcessoQuery.SQL.Add('where ativo = :ativo');
   temwhere := true;
  end;
  CadEstadoDM.AcessoQuery.ParamByName('ativo').AsString := 'N';
 end;
 CadEstadoDM.AcessoQuery.Open;
 for i := 0 to AcessoGrid.Columns.Count - 1 do
  AcessoGrid.Columns[i].Width := AcessoGrid.Canvas.TextWidth(AcessoGrid.Columns[i].Title.Caption + '     ');
end;

procedure TCadEstado.EdtAcessoSiglaEstadoChange(Sender: TObject);
var sigla: string;
begin
 Sigla := EdtAcessoSiglaEstado.Text;

 with CadEstadoDM.qryConsultarEstado do
 begin
  SQL.Clear;
  SQL.Add('select * from cadestado where sigla = :sigla');
  ParamByName('sigla').AsString := Sigla;
  Open;

  EdtAcessoEstado.Text := FieldByName('estado').AsString;
 end;
end;

procedure TCadEstado.EdtAcessoSiglaPaisChange(Sender: TObject);
var sigla: string;
begin
 sigla := EdtAcessoSiglaPais.Text;

 with CadPaisDM.qryConsultarPais do
 begin
  SQL.Clear;
  SQL.Add('select * from cadpais where sigla = :sigla');
  ParamByName('sigla').AsString := sigla;
  Open;

  EdtAcessoPais.Text := FieldByName('pais').AsString;
 end;
end;

procedure TCadEstado.EdtPaisSiglaChange(Sender: TObject);
var Pais, sigla: string;
begin
 sigla := EdtPaisSigla.Text;

 with CadPaisDM.qryConsultarPais do
 begin
  SQL.Clear;
  SQL.Add('select * from cadpais where sigla = :sigla');
  ParamByName('sigla').AsString := sigla;
  Open;

  EdtPais.Text := FieldByName('pais').AsString;
 end;
end;

procedure TCadEstado.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;

procedure TCadEstado.SBConsEstadoClick(Sender: TObject);
var sigla, codigo, estado: string;
begin
 with CadEstadoDM.qryConsultarEstado do
 begin
  SQL.Clear;
  SQL.Add('select * from cadestado');
  Open;
 end;

 Application.CreateForm(TConsultarEstado, ConsultarEstado);
 codigo := ConsultarEstado.SelecionarEstado;

 if codigo <> '' then begin
  sigla := ConsultarEstado.Sigla;
  EdtAcessoSiglaEstado.Text := sigla;
  Estado := ConsultarEstado.Estado;
  EdtAcessoEstado.Text := Estado;
 end;
end;

procedure TCadEstado.SBConsPaisClick(Sender: TObject);
var codigo, pais, sigla: string;
begin
 with CadPaisDM.qryConsultarPais do
 begin
  SQL.Clear;
  SQL.Add('select * from cadpais');
  Open;
 end;

 Application.CreateForm(TConsultarPais, ConsultarPais);
 codigo := ConsultarPais.SelecionarPais;

 if codigo <> '' then begin
  sigla := ConsultarPais.Sigla;
  EdtAcessoSiglaPais.Text := sigla;
  Pais := ConsultarPais.Pais;
  EdtAcessoPais.Text := Pais;
 end;
end;
end.
