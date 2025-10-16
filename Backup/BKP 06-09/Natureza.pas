unit Natureza;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.ComCtrls,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  NaturezaDM, ConsultarNaturezaForm,
  Log, LogDM,
  GlobalUnit, Vcl.Buttons,
  CSOSNDM, ConsultarCSOSNForm,
  CSTCOFINSDM, ConsultarCSTCOFINSForm,
  CSTICMSDM, ConsultarCSTICMSForm,
  CSTPISDM, ConsultarCSTPISForm,
  CSTIPIDM, ConsultarCSTIPIForm,
  ENQIPIDM, ConsultarEnqIPIForm;

type
  TCadNatureza = class(TForm)
    Panel1: TPanel;
    lblNatureza: TLabel;
    lblDescricao: TLabel;
    lblAtivo: TLabel;
    CBAtivo: TCheckBox;
    lblCSTICMS: TLabel;
    lblCSTPIS: TLabel;
    lblCSTCOFINS: TLabel;
    lblCSTIPI: TLabel;
    lblCSOSN: TLabel;
    lblEnquadraIPI: TLabel;
    edtNatureza: TEdit;
    edtDescricao: TEdit;
    EdtCSTICMS: TEdit;
    EdtCSOSN: TEdit;
    EdtCSTPIS: TEdit;
    EdtCSTIPI: TEdit;
    EdtEnqIPI: TEdit;
    EdtCSTCOFINS: TEdit;
    lblcBenef: TLabel;
    lblcCredPres: TLabel;
    EdtcCredPres: TEdit;
    EdtcBenef: TEdit;
    btnAlterar: TButton;
    BtnConsultar: TButton;
    BtnDesistir: TButton;
    BtnExcluir: TButton;
    btnFechar: TButton;
    BtnGravarAlterar: TButton;
    BtnGravarIncluir: TButton;
    btnIncluir: TButton;
    lblTipo: TLabel;
    CBTipo: TComboBox;
    SBCSTICMS: TSpeedButton;
    SBCSOSN: TSpeedButton;
    SBCSTPIS: TSpeedButton;
    SBCSTCOFINS: TSpeedButton;
    SBCSTIPI: TSpeedButton;
    SBENQIPI: TSpeedButton;
    lblAliqICMS: TLabel;
    EdtAliqICMS: TEdit;
    EdtAliqPIS: TEdit;
    lblAliqPIS: TLabel;
    EdtAliqCOFINS: TEdit;
    lblAliqCOFINS: TLabel;
    lblAliqIPI: TLabel;
    EdtAliqIPI: TEdit;
    lblAliq_Cred_Pres: TLabel;
    EdtAliq_Cred_Pres: TEdit;
    CBRealiarCalcCredPres: TCheckBox;
    RGConfiguracoes: TRadioGroup;
    procedure btnIncluirClick(Sender: TObject);
    procedure BtnDesistirClick(Sender: TObject);
    procedure BtnGravarIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure BtnGravarAlterarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure SBCSOSNClick(Sender: TObject);
    procedure SBCSTCOFINSClick(Sender: TObject);
    procedure SBCSTICMSClick(Sender: TObject);
    procedure SBCSTPISClick(Sender: TObject);
    procedure SBENQIPIClick(Sender: TObject);
    procedure SBCSTIPIClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadNatureza: TCadNatureza;

implementation

{$R *.dfm}

procedure TCadNatureza.btnIncluirClick(Sender: TObject);
begin
 EdtNatureza.Clear;
 EdtDescricao.Clear;
 EdtCSTICMS.Clear;
 EdtCSOSN.Clear;
 EdtCSTIPI.Clear;
 EdtEnqIPI.Clear;
 EdtCSTPIS.Clear;
 EdtCSTCOFINS.Clear;
 EdtcBenef.Clear;
 EdtcCredPres.Clear;
 EdtAliqICMS.Clear;
 EdtAliqIPI.Clear;
 EdtAliqPIS.Clear;
 EdtAliqCOFINS.Clear;
 edtAliq_Cred_pres.Clear;

 EdtNatureza.Enabled := True;
 EdtDescricao.Enabled := True;
 CBTipo.Enabled := True;
 CBAtivo.Enabled := True;
 EdtCSTICMS.Enabled := True;
 EdtCSOSN.Enabled := True;
 EdtCSTIPI.Enabled := True;
 EdtEnqIPI.Enabled := True;
 EdtCSTPIS.Enabled := True;
 EdtCSTCOFINS.Enabled := True;
 EdtcBenef.Enabled := True;
 EdtcCredPres.Enabled := True;
 EdtAliqICMS.Enabled := True;
 EdtAliqIPI.Enabled := True;
 EdtAliqPIS.Enabled := True;
 EdtAliqCOFINS.Enabled := True;
 EdtAliq_Cred_pres.enabled := True;

 btnIncluir.Visible := False;
 btnAlterar.Visible := False;
 BtnExcluir.Visible := False;
 btnConsultar.Visible := False;
 btnFechar.Visible := False;

 btnGravarIncluir.Visible := True;
 btnDesistir.Visible := True;
 SBCSOSN.Enabled := True;
 SBCSTICMS.Enabled := True;
 SBCSTIPI.Enabled := True;
 SBEnqIPI.Enabled := True;
 SBCSTPIS.Enabled := True;
 SBCSTCOFINS.Enabled := True;
end;

procedure TCadNatureza.BtnGravarIncluirClick(Sender: TObject);
var natureza, descricao, tipo, ativo, cBenef, cCredPres, cst_icms, csosn, cst_ipi, enq_ipi, cst_pis, cst_cofins,
    aliq_icms, aliq_ipi, aliq_cofins, aliq_pis, tela, aliq_cred_pres: string;
begin
  natureza := EdtNatureza.Text;
  descricao := EdtDescricao.Text;
  tipo := CBTipo.Text;
  if CBAtivo.Checked then ativo := 'S' else ativo := 'N';
  cBenef := EdtcBenef.Text;
  cCredPres := EdtcCredPres.Text;
  cst_icms := EdtCSTICMS.Text;
  csosn := EdtCSOSN.Text;
  cst_ipi := EdtCSTIPI.Text;
  enq_ipi := EdtEnqIPI.Text;
  cst_pis := EdtCSTPIS.Text;
  cst_cofins := EdtCSTCOFINS.Text;
  aliq_ICMS := EdtAliqICMS.Text;
  aliq_PIS := EdtAliqPIS.Text;
  aliq_COFINS := EdtAliqCOFINS.Text;
  aliq_IPI := EdtAliqIPI.Text;
  Aliq_Cred_Pres := EdtAliq_Cred_Pres.Text;

  if EdtNatureza.Text = '' then begin
  ShowMessage('Natureza não pode ficar vazia!');
  end
  else begin

  if EdtDescricao.Text = '' then begin
  ShowMessage('Descrição não pode ficar vazia!');
  end
  else begin

  if CBTipo.Text = '' then begin
  ShowMessage('Tipo não pode ficar vazia!');
  end
  else begin

  if EdtCSTICMS.Text = '' then begin
  ShowMessage('CST ICMS não pode ficar vazia!');
  end
  else begin

  if EdtCSOSN.Text = '' then begin
  ShowMessage('CSOSN não pode ficar vazia!');
  end
  else begin

  if EdtCSTIPI.Text = '' then begin
  ShowMessage('CST IPI não pode ficar vazia!');
  end
  else begin

  if EdtCSTPIS.Text = '' then begin
  ShowMessage('CST PIS não pode ficar vazia!');
  end
  else begin

  if EdtCSTCOFINS.Text = '' then begin
  ShowMessage('CST COFINS não pode ficar vazia!');
  end
  else begin

  if EdtAliqICMS.Text = '' then begin
  EdtAliqICMS.Text := '0';
  end
  else begin

  if EdtAliqIPI.Text = '' then begin
  EdtAliqIPI.Text := '0';
  end
  else begin

  if EdtAliqPIS.Text = '' then begin
  EdtAliqPIS.Text := '0';
  end
  else begin

  if EdtAliqCOFINS.Text = '' then begin
  EdtAliqCOFINS.Text := '0';
  end
  else begin

  if EdtAliq_Cred_Pres.Text = '' then begin
  EdtAliq_Cred_Pres.Text := '0';
  end
  else begin

  CadNaturezaDM.SelectQuery.SQL.Clear;
  CadNaturezaDM.SelectQuery.Close;
  CadNaturezaDM.SelectQuery.SQL.Text :=
  'select * from cadnatureza where natureza = :natureza';
  CadNaturezaDM.SelectQuery.ParamByName('natureza').AsString := natureza;
  CadNaturezaDM.SelectQuery.Open;

  if not CadNaturezaDM.SelectQuery.IsEmpty then begin
  ShowMessage('Natureza já cadastrada!');
  end
  else begin

  CadNaturezaDM.InsertQuery.SQL.Clear;
  CadNaturezaDM.InsertQuery.SQL.Text :=
  'insert into cadnatureza (natureza, descricao, tipo, ativo, cBenef, cCredPres, cst_icms, csosn, cst_ipi, enq_ipi, cst_pis, cst_cofins, aliq_icms, ' +
  'aliq_ipi, aliq_pis, aliq_cofins, Aliq_Cred_Pres) ' +
  'values ' +
  '(:natureza, :descricao, :tipo, :ativo, :cbenef, :ccredpres, :cst_icms, :csosn, :cst_ipi, :enq_ipi, :cst_pis, :cst_cofins, :aliq_icms, :Aliq_Cred_Pres, ' +
  ':aliq_ipi, :aliq_pis, :aliq_cofins)';
  CadNaturezaDM.InsertQuery.ParamByName('natureza').AsString := natureza;
  CadNaturezaDM.InsertQuery.ParamByName('descricao').AsString := descricao;
  CadNaturezaDM.InsertQuery.ParamByName('tipo').AsString := tipo;
  CadNaturezaDM.InsertQuery.ParamByName('ativo').AsString := ativo;
  CadNaturezaDM.InsertQuery.ParamByName('cBenef').AsString := cBenef;
  CadNaturezaDM.InsertQuery.ParamByName('cCredPres').AsString := cCredPres;
  CadNaturezaDM.InsertQuery.ParamByName('cst_icms').AsString := cst_icms;
  CadNaturezaDM.InsertQuery.ParamByName('csosn').AsString := csosn;
  CadNaturezaDM.InsertQuery.ParamByName('cst_ipi').AsString := cst_ipi;
  CadNaturezaDM.InsertQuery.ParamByName('enq_ipi').AsString := enq_ipi;
  CadNaturezaDM.InsertQuery.ParamByName('cst_pis').AsString := cst_pis;
  CadNaturezaDM.InsertQuery.ParamByName('cst_cofins').AsString := cst_cofins;
  CadNaturezaDM.InsertQuery.ParamByName('aliq_icms').AsFloat := StrToFloat(EdtAliqICMS.Text);
  CadNaturezaDM.InsertQuery.ParamByName('aliq_ipi').AsFloat := StrToFloat(EdtAliqIPI.Text);
  CadNaturezaDM.InsertQuery.ParamByName('aliq_pis').AsFloat := StrToFloat(EdtAliqPIS.Text);
  CadNaturezaDM.InsertQuery.ParamByName('aliq_cofins').AsFloat := StrToFloat(EdtAliqCOFINS.Text);
  CadNaturezaDM.InsertQuery.ParamByName('Aliq_Cred_Pres').AsFloat := StrToFloat(EdtAliq_Cred_Pres.Text);


  LogsDM.InserirLog.SQL.Clear;
  LogsDM.InserirLog.SQL.Text :=
  'insert into logs (descricao, tela, data, emp_id, usuario) values (:descricao, :tela, :data, :emp_id, :usuario)';
  LogsDM.InserirLog.ParamByName('descricao').AsString :=
  'Inseriu a natureza ' + natureza + ' na descrição ' + descricao + ' do tipo ' + tipo + ' com o cBenef ' + cBenef + ' com o cCredPres ' + cCredPres +
  ' no CST ICMS ' + CST_ICMS + ' no CSOSN ' + CSOSN + ' no CST IPI ' + CST_IPI + ' no Enquadra IPI ' + Enq_IPI + ' no CST PIS ' + CST_PIS +
  ' no CST COFINS ' + CST_COFINS + ' alíquota de ICMS ' + aliq_icms + ' alíquota de IPI ' + aliq_ipi + ' alíquota de PIS ' + aliq_PIS +
  ' alíquota de COFINS ' + aliq_COFINS;
  LogsDM.InserirLog.ParamByName('tela').AsString := 'CadNatureza';
  LogsDM.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
  LogsDM.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
  LogsDM.InserirLog.ParamByName('data').AsDateTime := Now;

  try
  LogsDM.InserirLog.ExecSQL;
  CadNaturezaDM.InsertQuery.ExecSQL;
  ShowMessage('Gravado com sucesso!');
  EdtNatureza.Enabled := False;
  EdtDescricao.Enabled := False;
  CBTipo.Enabled := False;
  CBAtivo.Enabled := False;
  EdtCSTICMS.Enabled := False;
  EdtCSOSN.Enabled := False;
  EdtCSTIPI.Enabled := False;
  EdtEnqIPI.Enabled := False;
  EdtCSTPIS.Enabled := False;
  EdtCSTCOFINS.Enabled := False;
  EdtcBenef.Enabled := False;
  EdtcCredPres.Enabled := False;
  EdtAliqICMS.Enabled := False;
  EdtAliqIPI.Enabled := False;
  EdtAliqCOFINS.Enabled := False;
  EdtAliqPIS.Enabled := False;
  EdtAliq_Cred_Pres.Enabled := False;

  btnIncluir.Visible := True;
  btnAlterar.Visible := True;
  BtnExcluir.Visible := True;
  btnConsultar.Visible := True;
  btnFechar.Visible := True;

  btnGravarIncluir.Visible := False;
  btnDesistir.Visible := False;
  SBCSOSN.Enabled := False;
  SBCSTICMS.Enabled := False;
  SBCSTIPI.Enabled := False;
  SBEnqIPI.Enabled := False;
  SBCSTPIS.Enabled := False;
  SBCSTCOFINS.Enabled := False;
  except
  ShowMessage('Erro na inclusão!');
  end;
end;
end;
end;
end;
end;
end;
end;
end;
end;
end;
end;
end;
end;
end;
end;

procedure TCadNatureza.btnAlterarClick(Sender: TObject);
begin
 if EdtNatureza.Text = '' then begin
 ShowMessage('Nenhuma Natureza selecionada!');
 end
 else begin

 EdtDescricao.Enabled := True;
 CBTipo.Enabled := True;
 CBAtivo.Enabled := True;
 EdtCSTICMS.Enabled := True;
 EdtCSOSN.Enabled := True;
 EdtCSTIPI.Enabled := True;
 EdtEnqIPI.Enabled := True;
 EdtCSTPIS.Enabled := True;
 EdtCSTCOFINS.Enabled := True;
 EdtcBenef.Enabled := True;
 EdtcCredPres.Enabled := True;
 EdtAliqICMS.Enabled := True;
 EdtAliqIPI.Enabled := True;
 EdtAliqCOFINS.Enabled := True;
 EdtAliqPIS.Enabled := True;
 EdtAliq_cred_pres.Enabled := True;

 btnIncluir.Visible := False;
 btnAlterar.Visible := False;
 BtnExcluir.Visible := False;
 btnConsultar.Visible := False;
 btnFechar.Visible := False;

 btnGravarAlterar.Visible := True;
 btnDesistir.Visible := True;
 SBCSOSN.Enabled := True;
 SBCSTICMS.Enabled := True;
 SBCSTIPI.Enabled := True;
 SBEnqIPI.Enabled := True;
 SBCSTPIS.Enabled := True;
 SBCSTCOFINS.Enabled := True;
end;
end;

procedure TCadNatureza.BtnGravarAlterarClick(Sender: TObject);
var natureza, descricao, tipo, ativo, cBenef, cCredPres, cst_icms, csosn, cst_ipi, enq_ipi, cst_pis, cst_cofins,
    aliq_icms, aliq_ipi, aliq_cofins, aliq_pis, Aliq_Cred_Pres: string;
begin
  natureza := EdtNatureza.Text;
  descricao := EdtDescricao.Text;
  tipo := CBTipo.Text;
  if CBAtivo.Checked then ativo := 'S' else ativo := 'N';
  cBenef := EdtcBenef.Text;
  cCredPres := EdtcCredPres.Text;
  cst_icms := EdtCSTICMS.Text;
  csosn := EdtCSOSN.Text;
  cst_ipi := EdtCSTIPI.Text;
  enq_ipi := EdtEnqIPI.Text;
  cst_pis := EdtCSTPIS.Text;
  cst_cofins := EdtCSTCOFINS.Text;
  aliq_ICMS := EdtAliqICMS.Text;
  aliq_PIS := EdtAliqPIS.Text;
  aliq_COFINS := EdtAliqCOFINS.Text;
  aliq_IPI := EdtAliqIPI.Text;
  Aliq_Cred_Pres := EdtAliq_Cred_Pres.Text;

  if EdtNatureza.Text = '' then begin
  ShowMessage('Natureza não pode ficar vazia!');
  end
  else begin

  if EdtDescricao.Text = '' then begin
  ShowMessage('Descrição não pode ficar vazia!');
  end
  else begin

  if CBTipo.Text = '' then begin
  ShowMessage('Tipo não pode ficar vazia!');
  end
  else begin

  if EdtCSTICMS.Text = '' then begin
  ShowMessage('CST ICMS não pode ficar vazia!');
  end
  else begin

  if EdtCSOSN.Text = '' then begin
  ShowMessage('CSOSN não pode ficar vazia!');
  end
  else begin

  if EdtCSTIPI.Text = '' then begin
  ShowMessage('CST IPI não pode ficar vazia!');
  end
  else begin

  if EdtCSTPIS.Text = '' then begin
  ShowMessage('CST PIS não pode ficar vazia!');
  end
  else begin

  if EdtCSTCOFINS.Text = '' then begin
  ShowMessage('CST COFINS não pode ficar vazia!');
  end
  else begin

  if EdtAliqICMS.Text = '' then begin
  EdtAliqICMS.Text := '0';
  end
  else begin

  if EdtAliqIPI.Text = '' then begin
  EdtAliqIPI.Text := '0';
  end
  else begin

  if EdtAliqPIS.Text = '' then begin
  EdtAliqPIS.Text := '0';
  end
  else begin

  if EdtAliqCOFINS.Text = '' then begin
  EdtAliqCOFINS.Text := '0';
  end
  else begin

  if EdtAliq_Cred_Pres.Text = '' then begin
  EdtAliq_Cred_Pres.Text := '0';
  end
  else begin

  CadNaturezaDM.UpdateQuery.SQL.Clear;
  CadNaturezaDM.UpdateQuery.SQL.Text :=
  'update cadnatureza set descricao = :descricao, tipo = :tipo, ativo = :ativo, cBenef = :cbenef, cCredPres = :ccredpres, ' +
  'cst_icms = :cst_icms, csosn = :csosn, cst_ipi = :cst_ipi, enq_ipi = :enq_ipi, cst_pis = :cst_pis, cst_cofins = :cst_cofins, ' +
  'aliq_ICMS = :aliq_icms, aliq_ipi = :aliq_ipi, aliq_pis = :aliq_pis, aliq_cofins = :aliq_cofins, Aliq_Cred_Pres = :Aliq_Cred_Pres ' +
  'where natureza = :natureza';
  CadNaturezaDM.UpdateQuery.ParamByName('natureza').AsString := natureza;
  CadNaturezaDM.UpdateQuery.ParamByName('descricao').AsString := descricao;
  CadNaturezaDM.UpdateQuery.ParamByName('tipo').AsString := tipo;
  CadNaturezaDM.UpdateQuery.ParamByName('ativo').AsString := ativo;
  CadNaturezaDM.UpdateQuery.ParamByName('cBenef').AsString := cBenef;
  CadNaturezaDM.UpdateQuery.ParamByName('cCredPres').AsString := cCredPres;
  CadNaturezaDM.UpdateQuery.ParamByName('cst_icms').AsString := cst_icms;
  CadNaturezaDM.UpdateQuery.ParamByName('csosn').AsString := csosn;
  CadNaturezaDM.UpdateQuery.ParamByName('cst_ipi').AsString := cst_ipi;
  CadNaturezaDM.UpdateQuery.ParamByName('enq_ipi').AsString := enq_ipi;
  CadNaturezaDM.UpdateQuery.ParamByName('cst_pis').AsString := cst_pis;
  CadNaturezaDM.UpdateQuery.ParamByName('cst_cofins').AsString := cst_cofins;
  CadNaturezaDM.UpdateQuery.ParamByName('aliq_icms').AsFloat := StrToFloat(EdtAliqICMS.Text);
  CadNaturezaDM.UpdateQuery.ParamByName('aliq_ipi').AsFloat := StrToFloat(EdtAliqIPI.Text);
  CadNaturezaDM.UpdateQuery.ParamByName('aliq_pis').AsFloat := StrToFloat(EdtAliqPIS.Text);
  CadNaturezaDM.UpdateQuery.ParamByName('aliq_cofins').AsFloat := StrToFloat(EdtAliqCOFINS.Text);
  CadNaturezaDM.UpdateQuery.ParamByName('Aliq_Cred_Pres').AsFloat := StrToFloat(EdtAliq_Cred_Pres.Text);

  LogsDM.InserirLog.SQL.Clear;
  LogsDM.InserirLog.SQL.Text :=
  'insert into logs (descricao, tela, data, emp_id, usuario) values (:descricao, :tela, :data, :emp_id, :usuario)';
  LogsDM.InserirLog.ParamByName('descricao').AsString :=
  'Alterou a natureza ' + natureza + ' na descrição ' + descricao + ' do tipo ' + tipo + ' com o cBenef ' + cBenef + ' com o cCredPres ' + cCredPres +
  ' no CST ICMS ' + CST_ICMS + ' no CSOSN ' + CSOSN + ' no CST IPI ' + CST_IPI + ' no Enquadra IPI ' + Enq_IPI + ' no CST PIS ' + CST_PIS +
  ' no CST COFINS ' + CST_COFINS + ' alíquota de ICMS ' + aliq_icms + ' alíquota de IPI ' + aliq_ipi + ' alíquota de PIS ' + aliq_PIS +
  ' alíquota de COFINS ' + aliq_COFINS;
  LogsDM.InserirLog.ParamByName('tela').AsString := 'CadNatureza';
  LogsDM.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
  LogsDM.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
  LogsDM.InserirLog.ParamByName('data').AsDateTime := Now;

  try
  LogsDM.InserirLog.ExecSQL;
  CadNaturezaDM.UpdateQuery.ExecSQL;
  ShowMessage('Gravado com sucesso!');
  EdtNatureza.Enabled := False;
  EdtDescricao.Enabled := False;
  CBTipo.Enabled := False;
  CBAtivo.Enabled := False;
  EdtCSTICMS.Enabled := False;
  EdtCSOSN.Enabled := False;
  EdtCSTIPI.Enabled := False;
  EdtEnqIPI.Enabled := False;
  EdtCSTPIS.Enabled := False;
  EdtCSTCOFINS.Enabled := False;
  EdtcBenef.Enabled := False;
  EdtcCredPres.Enabled := False;
  EdtAliqICMS.Enabled := False;
  EdtAliqIPI.Enabled := False;
  EdtAliqCOFINS.Enabled := False;
  EdtAliqPIS.Enabled := False;
  EdtAliq_Cred_Pres.Enabled := False;

  btnIncluir.Visible := True;
  btnAlterar.Visible := True;
  BtnExcluir.Visible := True;
  btnConsultar.Visible := True;
  btnFechar.Visible := True;

  btnGravarAlterar.Visible := False;
  btnDesistir.Visible := False;
  SBCSOSN.Enabled := False;
  SBCSTICMS.Enabled := False;
  SBCSTIPI.Enabled := False;
  SBEnqIPI.Enabled := False;
  SBCSTPIS.Enabled := False;
  SBCSTCOFINS.Enabled := False;
  except
  ShowMessage('Erro na Alteração!');
  end;
end;
end;
end;
end;
end;
end;
end;
end;
end;
end;
end;
end;
end;
end;

procedure TCadNatureza.BtnConsultarClick(Sender: TObject);
var natureza, descricao, tipo, ativo, cBenef, cCredPres, cst_icms, csosn, cst_ipi, enq_ipi, cst_pis, cst_cofins,
    aliq_icms, aliq_ipi, aliq_cofins, aliq_pis, Aliq_Cred_Pres: string;
begin
  CadNaturezaDM.ConsultarNatureza.SQL.Clear;
  CadNaturezaDM.ConsultarNatureza.SQL.Text :=
  'select * from cadnatureza where ativo = :ativo';
  CadNaturezaDM.ConsultarNatureza.ParamByName('ativo').AsString := 'S';
  CadNaturezaDM.ConsultarNatureza.Open;

  Application.CreateForm(TConsultarNatureza, ConsultarNatureza);
  natureza := ConsultarNatureza.SelecionarNatureza;
  if natureza <> '' then
  begin
    EdtNatureza.Text := natureza;

    descricao := ConsultarNatureza.Descricao;
    EdtDescricao.Text := descricao;

    ativo := ConsultarNatureza.Ativo;
    CBAtivo.Checked := ativo = 'S';

    cBenef := ConsultarNatureza.cBenef;
    EdtcBenef.Text := cBenef;

    cCredPres := ConsultarNatureza.cCredPres;
    EdtcCredPres.Text := cCredPres;

    enq_ipi := ConsultarNatureza.enq_ipi;
    Edtenqipi.Text := enq_ipi;

    cst_icms := ConsultarNatureza.cst_icms;
    Edtcsticms.Text := cst_icms;

    csosn := ConsultarNatureza.csosn;
    Edtcsosn.Text := csosn;

    cst_ipi := ConsultarNatureza.cst_ipi;
    Edtcstipi.Text := cst_ipi;

    cst_pis := ConsultarNatureza.cst_pis;
    Edtcstpis.Text := cst_pis;

    cst_cofins := ConsultarNatureza.cst_cofins;
    Edtcstcofins.Text := cst_cofins;

    tipo := ConsultarNatureza.Tipo;
    CBTipo.ItemIndex := CBTipo.Items.IndexOf(tipo);

    aliq_icms := ConsultarNatureza.Aliq_icms;
    Edtaliqicms.Text := aliq_icms;

    aliq_ipi := ConsultarNatureza.aliq_ipi;
    Edtaliqipi.Text := aliq_ipi;

    aliq_pis := ConsultarNatureza.aliq_pis;
    Edtaliqpis.Text := aliq_pis;

    aliq_cofins := ConsultarNatureza.aliq_cofins;
    Edtaliqcofins.Text := aliq_cofins;

    Aliq_Cred_Pres := ConsultarNatureza.Aliq_Cred_Pres;
    EdtAliq_Cred_Pres.Text := Aliq_Cred_Pres
  end;
end;

procedure TCadNatureza.BtnDesistirClick(Sender: TObject);
begin
 EdtNatureza.Clear;
 EdtDescricao.Clear;
 EdtCSTICMS.Clear;
 EdtCSOSN.Clear;
 EdtCSTIPI.Clear;
 EdtEnqIPI.Clear;
 EdtCSTPIS.Clear;
 EdtCSTCOFINS.Clear;
 EdtcBenef.Clear;
 EdtcCredPres.Clear;
 EdtAliqICMS.Clear;
 EdtAliqIPI.Clear;
 EdtAliqPIS.Clear;
 EdtAliqCOFINS.Clear;
 EdtAliq_Cred_Pres.Clear;

 EdtNatureza.Enabled := False;
 EdtDescricao.Enabled := False;
 CBTipo.Enabled := False;
 CBAtivo.Enabled := False;
 EdtCSTICMS.Enabled := False;
 EdtCSOSN.Enabled := False;
 EdtCSTIPI.Enabled := False;
 EdtEnqIPI.Enabled := False;
 EdtCSTPIS.Enabled := False;
 EdtAliqICMS.Enabled := False;
 EdtAliqIPI.Enabled := False;
 EdtAliqPIS.Enabled := False;
 EdtAliqCOFINS.Enabled := False;
 EdtAliq_Cred_Pres.Enabled := False;

 btnIncluir.Visible := True;
 btnAlterar.Visible := True;
 BtnExcluir.Visible := True;
 btnConsultar.Visible := True;
 btnFechar.Visible := True;

 btnGravarIncluir.Visible := False;
 btnDesistir.Visible := False;
 SBCSOSN.Enabled := False;
 SBCSTICMS.Enabled := False;
 SBCSTIPI.Enabled := False;
 SBEnqIPI.Enabled := False;
 SBCSTPIS.Enabled := False;
 SBCSTCOFINS.Enabled := False;
end;

procedure TCadNatureza.BtnExcluirClick(Sender: TObject);
var natureza, descricao, tipo, ativo, cBenef, cCredPres, cst_icms, csosn, cst_ipi, enq_ipi, cst_pis, cst_cofins,
    aliq_icms, aliq_ipi, aliq_cofins, aliq_pis: string;
begin
  natureza := EdtNatureza.Text;
  descricao := EdtDescricao.Text;
  tipo := CBTipo.Text;
  if CBAtivo.Checked then ativo := 'S' else ativo := 'N';
  cBenef := EdtcBenef.Text;
  cCredPres := EdtcCredPres.Text;
  cst_icms := EdtCSTICMS.Text;
  csosn := EdtCSOSN.Text;
  cst_ipi := EdtCSTIPI.Text;
  enq_ipi := EdtEnqIPI.Text;
  cst_pis := EdtCSTPIS.Text;
  cst_cofins := EdtCSTCOFINS.Text;
  aliq_icms := EdtAliqICMS.Text;
  aliq_ipi := EdtAliqIPI.Text;
  aliq_pis := EdtAliqPIS.Text;
  aliq_cofins := EdtAliqCofins.Text;

  CadNaturezaDM.SelectQuery.SQL.Clear;
  CadNaturezaDM.SelectQuery.Close;
  CadNaturezaDM.SelectQuery.SQL.Text :=
  'select * from cadnatureza where natureza = :natureza';
  CadNaturezaDM.SelectQuery.ParamByName('natureza').AsString := natureza;
  CadNaturezaDM.SelectQuery.Open;

  if CadNaturezaDM.SelectQuery.IsEmpty then begin
  ShowMessage('Natureza não encontrada!');
  end
  else begin

  CadNaturezaDM.DeleteQuery.SQL.Clear;
  CadNaturezaDM.DeleteQuery.SQL.Text :=
  'delete from cadnatureza where natureza = :natureza';
  CadNaturezaDM.DeleteQuery.ParamByName('natureza').AsString := natureza;

  LogsDM.InserirLog.SQL.Clear;
  LogsDM.InserirLog.SQL.Text :=
  'insert into logs (descricao, tela, data, emp_id, usuario) values (:descricao, :tela, :data, :emp_id, :usuario)';
  LogsDM.InserirLog.ParamByName('descricao').AsString :=
  'Excluíu a natureza ' + natureza + ' na descrição ' + descricao + ' do tipo ' + tipo + ' com o cBenef ' + cBenef + ' com o cCredPres ' + cCredPres +
  ' no CST ICMS ' + CST_ICMS + ' no CSOSN ' + CSOSN + ' no CST IPI ' + CST_IPI + ' no Enquadra IPI ' + Enq_IPI + ' no CST PIS ' + CST_PIS +
  ' no CST COFINS ' + CST_COFINS + ' alíquota de ICMS ' + aliq_icms + ' alíquota de IPI ' + aliq_ipi + ' alíquota de PIS ' + aliq_PIS +
  ' alíquota de COFINS ' + aliq_COFINS;
  LogsDM.InserirLog.ParamByName('tela').AsString := 'CadNatureza';
  LogsDM.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
  LogsDM.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
  LogsDM.InserirLog.ParamByName('data').AsDateTime := Now;
  try
  LogsDM.InserirLog.ExecSQL;
  CadNaturezaDM.DeleteQuery.ExecSQL;
  ShowMessage('Excluído com sucesso!');
  EdtNatureza.Clear;
  EdtDescricao.Clear;
  EdtCSTICMS.Clear;
  EdtCSOSN.Clear;
  EdtCSTIPI.Clear;
  EdtEnqIPI.Clear;
  EdtCSTPIS.Clear;
  EdtCSTCOFINS.Clear;
  EdtcBenef.Clear;
  EdtcCredPres.Clear;
  EdtAliqICMS.Clear;
  EdtAliqIPI.Clear;
  EdtAliqPIS.Clear;
  EdtAliqCOFINS.Clear;
  except
  ShowMessage('Erro na Alteração!');
  end;
end;
end;

procedure TCadNatureza.btnFecharClick(Sender: TObject);
begin
 Fechartela(sender);
end;

procedure TCadNatureza.SBCSOSNClick(Sender: TObject);
var CSOSN: string;
begin
  CadCSOSNDM.ConsultarCSOSN.SQL.Clear;
  CadCSOSNDM.ConsultarCSOSN.SQL.Text :=
  'select * from cadcsosn where ativo = :ativo';
  CadCSOSNDM.ConsultarCSOSN.ParamByName('ativo').AsString := 'S';
  CadCSOSNDM.ConsultarCSOSN.Open;

  Application.CreateForm(TConsultarCSOSN, ConsultarCSOSN);
  CSOSN := ConsultarCSOSN.SelecionarCSOSN;
  EdtCSOSN.Text := CSOSN;
end;

procedure TCadNatureza.SBCSTCOFINSClick(Sender: TObject);
var CofinsCST: string;
begin
  CadCSTCOFINSDM.ConsultarCSTCOFINS.SQL.Clear;
  CadCSTCOFINSDM.ConsultarCSTCOFINS.SQL.Text :=
  'select * from cadcstcofins where ativo = :ativo';
  CadCSTCOFINSDM.ConsultarCSTCOFINS.ParamByName('ativo').AsString := 'S';
  CadCSTCOFINSDM.ConsultarCSTCOFINS.Open;

  Application.CreateForm(TConsultarCSTCOFINS, ConsultarCSTCOFINS);
  CofinsCST := ConsultarCSTCOFINS.SelecionarCofinsCST;
  EdtCSTCOFINS.Text := CofinsCST;
end;

procedure TCadNatureza.SBCSTICMSClick(Sender: TObject);
var IcmsCST: String;
begin
  CadCSTICMSDM.ConsultarCSTICMS.SQL.Clear;
  CadCSTICMSDM.ConsultarCSTICMS.SQL.Text :=
  'select * from cadcsticms where ativo = :ativo';
  CadCSTICMSDM.ConsultarCSTICMS.ParamByName('ativo').AsString := 'S';
  CadCSTICMSDM.ConsultarCSTICMS.Open;

  Application.CreateForm(TConsultarCSTICMS, ConsultarCSTICMS);
  IcmsCST := ConsultarCSTICMS.SelecionarIcmsCST;
  EdtCSTICMS.Text := IcmsCST;
end;

procedure TCadNatureza.SBCSTPISClick(Sender: TObject);
var CSTPIS: string;
begin
 CadCSTPISDM.ConsultarCSTPIS.SQL.Clear;
 CadCSTPISDM.ConsultarCSTPIS.SQL.Text :=
 'select * from cadcstpis where ativo = :ativo';
 CadCSTPISDM.ConsultarCSTPIS.ParamByName('ativo').AsString := 'S';
 CadCSTPISDM.ConsultarCSTPIS.Open;

 Application.CreateForm(TConsultarCSTPIS, ConsultarCSTPIS);
 CSTPIS := ConsultarCSTPIS.SelecionarPisCST;
 EdtCSTPIS.Text := CSTPIS;
end;

procedure TCadNatureza.SBCSTIPIClick(Sender: TObject);
var CSTIPI: string;
begin
 CadCSTIPIDM.ConsultarCSTIPI.SQL.Clear;
 CadCSTIPIDM.ConsultarCSTIPI.SQL.Text :=
 'select * from cadcstipi where ativo = :ativo';
 CadCSTIPIDM.ConsultarCSTIPI.ParamByName('ativo').AsString := 'S';
 CadCSTIPIDM.ConsultarCSTIPI.Open;

 Application.CreateForm(TConsultarCSTIPI, ConsultarCSTIPI);
 CstIPI := ConsultarCSTIPI.SelecionarCstIPI;
 EdtCSTIPI.Text := CstIPI;
end;

procedure TCadNatureza.SBENQIPIClick(Sender: TObject);
var EnqIPI: String;
begin
  CadENQIPIDM.ConsultarENQIPI.SQL.Clear;
  CadENQIPIDM.ConsultarENQIPI.SQL.Text :=
  'select * from cadenqipi where ativo = :ativo';
  CadENQIPIDM.ConsultarENQIPI.ParamByName('ativo').AsString := 'S';
  CadENQIPIDM.ConsultarENQIPI.Open;

  Application.CreateForm(TConsultarEnqIPI, ConsultarEnqIPI);
  EnqIPI := ConsultarEnqIPI.SelecionarEnqIPI;
  EdtEnqIPI.Text := EnqIPI;
end;
end.
