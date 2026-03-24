unit Cidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.ComCtrls,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  EstadoDM, ConsultarEstadoForm,
  CidadeDM, ConsultarCidadeForm,
  PaisDM, ConsultarPaisForm,
  Log, LogDM,
  GlobalUnit, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TCadCidade = class(TForm)
    lblCodigoIBGE: TLabel;
    lblCidade: TLabel;
    lblAtivo: TLabel;
    CBAtivo: TCheckBox;
    EdtCodigoIBGE: TEdit;
    EdtCidade: TEdit;
    btnIncluir: TButton;
    btnGravarIncluir: TButton;
    btnGravarAlterar: TButton;
    btnAlterar: TButton;
    btnDesistir: TButton;
    btnConsultar: TButton;
    btnExcluir: TButton;
    EdtSiglaEstado: TEdit;
    lblEstado: TLabel;
    lblPais: TLabel;
    EdtCodigo_IBGEPais: TEdit;
    btnFechar: TButton;
    Pages: TPageControl;
    AcessoPage: TTabSheet;
    CadastroPage: TTabSheet;
    SBPais: TSpeedButton;
    SBEstado: TSpeedButton;
    RGAcessoAtivo: TRadioGroup;
    lblAcessoEstado: TLabel;
    EdtAcessoSiglaEstado: TEdit;
    EdtAcessoEstado: TEdit;
    lblAcessoPais: TLabel;
    EdtAcessoSiglaPais: TEdit;
    EdtAcessoPais: TEdit;
    SBConsPais: TSpeedButton;
    SBConsEstado: TSpeedButton;
    btnAcessoFechar: TButton;
    btnAcessoConsultar: TButton;
    lblAcessoCidade: TLabel;
    EdtAcessoCodigo: TEdit;
    EdtAcessoCidade: TEdit;
    SBConsCidade: TSpeedButton;
    EdtEstado: TEdit;
    EdtPais: TEdit;
    AcessoGrid: TDBGrid;
    procedure SBEstadoClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure btnGravarIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarAlterarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure SBPaisClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure SBConsCidadeClick(Sender: TObject);
    procedure SBConsEstadoClick(Sender: TObject);
    procedure SBConsPaisClick(Sender: TObject);
    procedure EdtCodigo_IBGEPaisChange(Sender: TObject);
    procedure EdtSiglaEstadoChange(Sender: TObject);
    procedure EdtAcessoCodigoChange(Sender: TObject);
    procedure EdtAcessoSiglaEstadoChange(Sender: TObject);
    procedure EdtAcessoSiglaPaisChange(Sender: TObject);
    procedure btnAcessoConsultarClick(Sender: TObject);
  private
  public
  end;

var
  CadCidade: TCadCidade;

implementation

{$R *.dfm}

procedure TCadCidade.btnIncluirClick(Sender: TObject);
begin
 BtnIncluir.Visible := False;
 btnAlterar.Visible := False;
 btnExcluir.Visible := False;
 btnGravarAlterar.Visible := False;
 btnConsultar.Visible := False;

 BtnGravarIncluir.Visible := True;
 BtnDesistir.Visible := True;
 SBEstado.Enabled := True;
 SBPais.Enabled := True;

 EdtCidade.Clear;
 EdtCodigo_IBGEPais.Clear;
 EdtSiglaEstado.Clear;
 EdtCodigoIBGE.Clear;

 EdtCodigoIBGE.Enabled := True;
 EdtCidade.Enabled := True;
 EdtCodigo_IBGEPais.Enabled := True;
 EdtSiglaEstado.Enabled := True;
 CBAtivo.Enabled := True;
end;

procedure TCadCidade.btnGravarIncluirClick(Sender: TObject);
var codigo_ibge, cidade, pais, estado, ativo: string;
begin
 codigo_ibge := EdtCodigoIBGE.Text;
 cidade := EdtCidade.Text;
 pais := EdtCodigo_IBGEPais.text;
 estado := EdtSiglaEstado.Text;
 if CBAtivo.Checked then Ativo := 'S' else Ativo := 'N';

 if Codigo_ibge = '' then begin
  ShowMessage('Código IBGE não pode ser vazio!');
  Abort;
 end;

 if Cidade = '' then begin
  ShowMessage('Cidade não pode ser vazia!');
  Abort;
 end;

 if Estado = '' then begin
 ShowMessage('Estado não pode ser vazio!');
  Abort;
 end;

 if Pais = '' then begin
  ShowMessage('País não pode ser vazia!');
  Abort;
 end;

 with CadCidadeDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcidade where codigo_ibge = :codigo_ibge');
  ParamByName('codigo_ibge').AsString := codigo_ibge;
  Open;

  if not IsEmpty then begin
   ShowMessage('Cidade já cadastrada!');
   Abort;
  end;
 end;

 CadCidadeDM.Conexão.StartTransaction;
 try
  with CadCidadeDM.qryInsert do
  begin
   SQL.Clear;
   SQL.Add('insert into cadcidade (codigo_ibge, cidade, pais, estado, ativo)');
   SQL.Add('values');
   SQL.Add('(:codigo_ibge, :cidade, :pais, :estado, :ativo)');
   ParamByName('codigo_ibge').AsString := codigo_ibge;
   ParamByName('cidade').AsString := cidade;
   ParamByName('pais').AsString := pais;
   ParamByName('estado').AsString := estado;
   ParamByName('ativo').AsString := ativo;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
   ParamByName('descricao').AsString :=
   'Inseriu a cidade ' + cidade + ' no código IBGE ' + codigo_ibge + ' no estado ' + estado + ' no país ' + pais + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadCidade';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadCidadeDM.Conexão.Commit;
  ShowMessage('Gravado com sucesso!');
  BtnIncluir.Visible := True;
  btnAlterar.Visible := True;
  btnExcluir.Visible := True;
  btnConsultar.Visible := True;

  btnGravarAlterar.Visible := False;
  BtnGravarIncluir.Visible := False;
  BtnDesistir.Visible := False;
  SBEstado.Enabled := False;
  SBPais.Enabled := False;

  EdtCodigoIBGE.Enabled := False;
  EdtCidade.Enabled := False;
  EdtCodigo_IBGEPais.Enabled := False;
  EdtSiglaEstado.Enabled := False;
  CBAtivo.Enabled := False;
  except
  CadCidadeDM.Conexão.Rollback;
  ShowMessage('Erro na gravação!');
 end;
end;

procedure TCadCidade.btnAlterarClick(Sender: TObject);
begin
 if EdtCodigoIBGE.Text = '' then begin
  ShowMessage('Nenhuma cidade selecionada');
  Abort;
 end;

 BtnIncluir.Visible := False;
 btnAlterar.Visible := False;
 btnExcluir.Visible := False;
 btnConsultar.Visible := False;
 BtnGravarIncluir.Visible := False;

 btnGravarAlterar.Visible := True;
 BtnDesistir.Visible := True;
 SBEstado.Enabled := True;
 SBPais.Enabled := True;

 EdtCidade.Enabled := True;
 EdtCodigo_IBGEPais.Enabled := True;
 EdtSiglaEstado.Enabled := True;
 CBAtivo.Enabled := True
end;

procedure TCadCidade.btnGravarAlterarClick(Sender: TObject);
var codigo_ibge, cidade, estado, pais, ativo: string;
begin
 codigo_ibge := EdtCodigoIBGE.Text;
 cidade := EdtCidade.Text;
 Estado := EdtSiglaEstado.Text;
 Pais := EdtCodigo_IBGEPais.Text;
 if CBAtivo.Checked then Ativo := 'S' else Ativo := 'N';

 if codigo_ibge = '' then begin
  ShowMessage('Código IBGE não pode ser vazio!');
  Abort;
 end;

 if Cidade = '' then begin
  ShowMessage('Cidade não pode ser vazia!');
  Abort;
 end;

 if Estado = '' then begin
  ShowMessage('Estado não pode ser vazio!');
  Abort;
 end;

 if Pais = '' then begin
  ShowMessage('País não pode ser vazia!');
  Abort;
 end;

 CadCidadeDM.Conexão.StartTransaction;
 try
  with CadCidadeDM.qryUpdate do
  begin
   SQL.Clear;
   SQL.Add('update cadcidade set cidade = :cidade, estado = :estado, pais = :pais, ativo = :ativo where codigo_ibge = :codigo_ibge');
   ParamByName('cidade').AsString := Cidade;
   ParamByName('ativo').AsString := ativo;
   ParamByName('estado').AsString := estado;
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
   'Alterou a cidade ' + cidade + ' no código IBGE ' + codigo_ibge + ' no estado ' + estado + ' no país ' + pais + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadCidade';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadCidadeDM.Conexão.Commit;
  ShowMessage('Alterado com sucesso!');
  BtnIncluir.Visible := True;
  btnAlterar.Visible := True;
  btnExcluir.Visible := True;
  btnConsultar.Visible := True;

  btnGravarAlterar.Visible := False;
  BtnGravarIncluir.Visible := False;
  BtnDesistir.Visible := False;
  SBEstado.Enabled := False;
  SBPais.Enabled := False;

  EdtCodigoIBGE.Enabled := False;
  EdtCidade.Enabled := False;
  EdtCodigo_IBGEPais.Enabled := False;
  EdtSiglaEstado.Enabled := False;
  CBAtivo.Enabled := False;
  except
  CadCidadeDM.Conexão.Rollback;
  ShowMessage('Erro na operação');
 end;
end;

procedure TCadCidade.btnConsultarClick(Sender: TObject);
var codigo, cidade, pais, estado, ativo: string;
begin
 with CadCidadeDM.qryConsultarCidade do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcidade');
  Open;
 end;

 ConsultarCidade := TConsultarCidade.Create(Self);
 codigo := ConsultarCidade.ConsultarCidade;
 if codigo <> '' then begin
  Edtcidade.Text := ConsultarCidade.cidade;
  EdtCodigoIBGE.Text := ConsultarCidade.Codigo_IBGE;
  EdtCodigo_IBGEPais.Text := ConsultarCidade.pais;
  EdtSiglaEstado.Text := ConsultarCidade.estado;
  CBAtivo.Checked := ConsultarCidade.ativo = 'S';
 end;
end;

procedure TCadCidade.btnDesistirClick(Sender: TObject);
begin
 BtnIncluir.Visible := True;
 btnAlterar.Visible := True;
 btnExcluir.Visible := True;
 btnConsultar.Visible := True;

 btnGravarAlterar.Visible := False;
 BtnGravarIncluir.Visible := False;
 BtnDesistir.Visible := False;
 SBEstado.Enabled := False;
 SBPais.Enabled := False;

 EdtCodigoIBGE.Clear;
 EdtCidade.Clear;
 EdtPais.Clear;
 EdtEstado.Clear;
 EdtCodigo_IBGEPais.Clear;
 EdtSiglaEstado.Clear;

 EdtCodigoIBGE.Enabled := False;
 EdtCidade.Enabled := False;
 EdtCodigo_IBGEPais.Enabled := False;
 EdtSiglaEstado.Enabled := False;
 CBAtivo.Enabled := False;
end;

procedure TCadCidade.btnExcluirClick(Sender: TObject);
var codigo_ibge, cidade, estado, pais, ativo: string;
begin
 codigo_ibge := EdtCodigoIBGE.Text;
 cidade := EdtCidade.Text;
 Estado := EdtSiglaEstado.Text;
 Pais := EdtCodigo_IBGEPais.Text;
 if CBAtivo.Checked then Ativo := 'S' else Ativo := 'N';

 if codigo_ibge = '' then begin
  ShowMessage('Nenhuma cidade selecionada!');
  Abort;
 end;

 with CadCidadeDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcep where cidade = :cidade');
  ParamByName('cidade').AsString := cidade;
  Open;

  if not IsEmpty then begin
   Showmessage('Cidade usada em um cadastro de CEP! Favor verificar!');
   Abort;
  end;
 end;

 CadCidadeDM.Conexão.StartTransaction;
 try
  with CadCidadeDM.qryDelete do
  begin
   SQL.Clear;
   SQL.Add('delete from cadcidade where codigo_ibge = :codigo_ibge');
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
   'Deletou a cidade ' + cidade + ' no código IBGE ' + codigo_ibge + ' no estado ' + estado + ' no país ' + pais + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadCidade';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadCidadeDM.Conexão.Commit;
  ShowMessage('Excluído com sucesso!');
  BtnIncluir.Visible := True;
  btnAlterar.Visible := True;
  btnExcluir.Visible := True;
  btnConsultar.Visible := True;

  btnGravarAlterar.Visible := False;
  BtnGravarIncluir.Visible := False;
  BtnDesistir.Visible := False;
  SBEstado.Enabled := False;

  EdtCodigoIBGE.Enabled := False;
  EdtCidade.Enabled := False;
  EdtCodigo_IBGEPais.Enabled := False;
  EdtSiglaEstado.Enabled := False;
  CBAtivo.Enabled := False;

  EdtCodigoIBGE.Clear;
  EdtCidade.Clear;
  EdtPais.Clear;
  EdtEstado.Clear;
  EdtCodigo_IBGEPais.Clear;
  EdtSiglaEstado.Clear;
  except
  CadCidadeDM.Conexão.Rollback;
  ShowMessage('Erro na operação');
 end;
end;

procedure TCadCidade.SBEstadoClick(Sender: TObject);
var codigo, sigla, estado: string;
begin
 with CadEstadoDM.qryConsultarEstado do
 begin
  SQL.Clear;
  SQL.Add('select * from cadestado where ativo = :ativo');
  Parambyname('ativo').AsString := 'S';
  Open;
 end;

 Application.CreateForm(TConsultarEstado, ConsultarEstado);
 codigo := ConsultarEstado.SelecionarEstado;

 if codigo <> '' then begin
  sigla := ConsultarEstado.Sigla;
  EdtSiglaEstado.Text := Sigla;
  Estado := ConsultarEstado.Estado;
  EdtEstado.Text := Estado;
 end;
end;

procedure TCadCidade.SBPaisClick(Sender: TObject);
var Codigo_IBGE, pais: string;
begin
 with CadPaisDM.qryConsultarPais do
 begin
  SQL.Clear;
  SQL.Add('select * from cadpais where ativo = :ativo');
  Parambyname('ativo').AsString := 'S';
  Open;
 end;

 Application.CreateForm(TConsultarPais, ConsultarPais);
 Codigo_IBGE := ConsultarPais.SelecionarPais;

 if Codigo_IBGE <> '' then begin
  EdtCodigo_IBGEPais.Text := Codigo_IBGE;
  Pais := ConsultarPais.Pais;
  EdtPais.text := Pais;
 end;
end;

procedure TCadCidade.EdtAcessoCodigoChange(Sender: TObject);
var codigo: string;
begin
 codigo := EdtAcessoCodigo.Text;

 with CadCidadeDM.qryConsultarCidade do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcidade where codigo = :codigo');
  ParamByName('codigo').AsString := codigo;
  Open;

  EdtAcessocidade.Text := FieldByName('cidade').AsString;
 end;
end;

procedure TCadCidade.EdtAcessoSiglaEstadoChange(Sender: TObject);
var sigla, estado: string;
begin
 sigla := EdtAcessoSiglaEstado.Text;

 with CadEstadoDM.qryConsultarEstado do
 begin
  SQL.Clear;
  SQL.Add('select * from cadestado where sigla = :sigla');
  Parambyname('sigla').AsString := sigla;
  Open;

  EdtAcessoEstado.Text := FieldByName('sigla').AsString;
 end;
end;

procedure TCadCidade.EdtAcessoSiglaPaisChange(Sender: TObject);
var sigla: string;
begin
 sigla := EdtAcessoSiglaPais.Text;

 with CadPaisDM.qryConsultarPais do
 begin
  SQL.Clear;
  SQL.Add('select * from cadpais where sigla = :sigla');
  Parambyname('sigla').AsString := sigla;
  Open;

  EdtAcessoPais.text := FieldbyName('Pais').AsString;
 end;
end;

procedure TCadCidade.EdtSiglaEstadoChange(Sender: TObject);
var sigla: string;
begin
 sigla := EdtSiglaEstado.Text;

 with CadEstadoDM.qryConsultarEstado do
 begin
  SQL.Clear;
  SQL.Add('select * from cadestado where sigla = :sigla');
  Parambyname('sigla').AsString := sigla;
  Open;

  EdtEstado.Text := FieldByName('estado').AsString;
 end;
end;

procedure TCadCidade.EdtCodigo_IBGEPaisChange(Sender: TObject);
var Codigo_IBGE: string;
begin
 Codigo_IBGE := EdtCodigo_IBGEPais.Text;

 with CadPaisDM.qryConsultarPais do
 begin
  SQL.Clear;
  SQL.Add('select * from cadpais where Codigo_IBGE = :Codigo_IBGE');
  Parambyname('Codigo_IBGE').AsString := Codigo_IBGE;
  Open;

  EdtPais.text := FieldByName('pais').AsString;
 end;
end;

procedure TCadCidade.SBConsCidadeClick(Sender: TObject);
var codigo, cidade: string;
begin
 with CadCidadeDM.qryConsultarCidade do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcidade');
  Open;
 end;

 ConsultarCidade := TConsultarCidade.Create(Self);
 codigo := ConsultarCidade.ConsultarCidade;

 if codigo <> '' then begin
  EdtAcessoCodigo.Text := codigo;
  Cidade := ConsultarCidade.cidade;
  EdtAcessoCidade.Text := Cidade;
 end;
end;

procedure TCadCidade.SBConsEstadoClick(Sender: TObject);
var codigo, Sigla, estado: string;
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
  Sigla := ConsultarEstado.Sigla;
  EdtAcessoSiglaEstado.Text := Sigla;
  Estado := ConsultarEstado.Estado;
  EdtAcessoEstado.Text := Estado;
 end;
end;

procedure TCadCidade.SBConsPaisClick(Sender: TObject);
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

procedure TCadCidade.btnAcessoConsultarClick(Sender: TObject);
var codigo, estado, pais: string;
    i: integer;
    temwhere: boolean;
begin
 codigo := EdtAcessoCodigo.Text;
 estado := EdtAcessoSiglaEstado.Text;
 pais := EdtAcessoSiglaPais.Text;
 CadCidadeDM.qryAcesso.SQL.Clear;
 CadCidadeDM.qryAcesso.SQL.Text :=
 'select * from cadcidade';
 temwhere := false;

 if codigo <> '' then begin
  if temwhere then begin
   CadCidadeDM.qryAcesso.SQL.Add('and codigo = :codigo');
  end
  else begin
   CadCidadeDM.qryAcesso.SQL.Add('where codigo = :codigo');
   temwhere := true;
  end;
  CadCidadeDM.qryAcesso.ParamByName('codigo').AsString := codigo;
 end;

 if estado <> '' then begin
  if temwhere then begin
   CadCidadeDM.qryAcesso.SQL.Add('and estado = :estado');
  end
  else begin
   CadCidadeDM.qryAcesso.SQL.Add('where estado = :estado');
   temwhere := true;
  end;
  CadCidadeDM.qryAcesso.ParamByName('estado').AsString := estado;
 end;

 if pais <> '' then begin
  if temwhere then begin
   CadCidadeDM.qryAcesso.SQL.Add('and pais = :pais');
  end
  else begin
   CadCidadeDM.qryAcesso.SQL.Add('where pais = :pais');
   temwhere := true;
  end;
  CadCidadeDM.qryAcesso.ParamByName('pais').AsString := pais;
 end;

 if RGAcessoAtivo.ItemIndex = 0 then begin
  if temwhere then begin
   CadCidadeDM.qryAcesso.SQL.Add('and ativo = :ativo');
  end
  else begin
   CadCidadeDM.qryAcesso.SQL.Add('where ativo = :ativo');
   temwhere := true;
  end;
 CadCidadeDM.qryAcesso.ParamByName('ativo').AsString := 'S';
 end;

 if RGAcessoAtivo.ItemIndex = 1 then begin
  if temwhere then begin
   CadCidadeDM.qryAcesso.SQL.Add('and ativo = :ativo');
  end
  else begin
   CadCidadeDM.qryAcesso.SQL.Add('where ativo = :ativo');
   temwhere := true;
  end;
 CadCidadeDM.qryAcesso.ParamByName('ativo').AsString := 'N';
 end;
 CadCidadeDM.qryAcesso.Open;
 for i := 0 to AcessoGrid.Columns.Count - 1 do
 AcessoGrid.Columns[i].Width := AcessoGrid.Canvas.TextWidth(AcessoGrid.Columns[i].Title.Caption + '     ');
end;

procedure TCadCidade.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;
end.
