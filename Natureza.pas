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
  ENQIPIDM, ConsultarEnqIPIForm, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TCadNatureza = class(TForm)
    Pages: TPageControl;
    AcessoPage: TTabSheet;
    CadastroPage: TTabSheet;
    btnAlterar: TButton;
    BtnConsultar: TButton;
    BtnDesistir: TButton;
    BtnExcluir: TButton;
    btnFechar: TButton;
    BtnGravarAlterar: TButton;
    BtnGravarIncluir: TButton;
    btnIncluir: TButton;
    CBAtivo: TCheckBox;
    CBRealizaCalcCredPres: TCheckBox;
    CBTipo: TComboBox;
    EdtAliq_Cred_Pres: TEdit;
    EdtAliqCOFINS: TEdit;
    EdtAliqICMS: TEdit;
    EdtAliqIPI: TEdit;
    EdtAliqPIS: TEdit;
    EdtcBenef: TEdit;
    EdtcCredPres: TEdit;
    EdtCSOSN: TEdit;
    EdtCSTCOFINS: TEdit;
    EdtCSTICMS: TEdit;
    EdtCSTIPI: TEdit;
    EdtCSTPIS: TEdit;
    edtDescricao: TEdit;
    EdtEnqIPI: TEdit;
    edtNatureza: TEdit;
    lblAliq_Cred_Pres: TLabel;
    lblAliqCOFINS: TLabel;
    lblAliqICMS: TLabel;
    lblAliqIPI: TLabel;
    lblAliqPIS: TLabel;
    lblAtivo: TLabel;
    lblcBenef: TLabel;
    lblcCredPres: TLabel;
    lblCSOSN: TLabel;
    lblCSTCOFINS: TLabel;
    lblCSTICMS: TLabel;
    lblCSTIPI: TLabel;
    lblCSTPIS: TLabel;
    lblDescricao: TLabel;
    lblEnquadraIPI: TLabel;
    lblNatureza: TLabel;
    lblTipo: TLabel;
    RGConfiguracoes: TRadioGroup;
    SBCSOSN: TSpeedButton;
    SBCSTCOFINS: TSpeedButton;
    SBCSTICMS: TSpeedButton;
    SBCSTIPI: TSpeedButton;
    SBCSTPIS: TSpeedButton;
    SBENQIPI: TSpeedButton;
    EdtAcessoDescricaoCSTICMS: TEdit;
    EdtAcessoCSTICMS: TEdit;
    AcessoGrid: TDBGrid;
    EdtAcessoDescricaoNatureza: TEdit;
    btnAcessoFechar: TButton;
    btnAcessoConsultar: TButton;
    EdtAcessoCSOSN: TEdit;
    EdtAcessoDescricaoCSOSN: TEdit;
    EdtAcessoDescricaoENQIPI: TEdit;
    EdtAcessoCSTIPI: TEdit;
    EdtAcessoDescricaoCSTIPI: TEdit;
    EdtAcessoENQIPI: TEdit;
    SBConsCSTICMS: TSpeedButton;
    lblAcessoCSTIPI: TLabel;
    SBConsCSTIPI: TSpeedButton;
    lblAcessoCSTICMS: TLabel;
    lblAcessoNatureza: TLabel;
    SBConsNatureza: TSpeedButton;
    SBAcessoClearIndIE: TSpeedButton;
    RGAcessoAtivo: TRadioGroup;
    EdtAcessoNatureza: TEdit;
    SBConsCSOSN: TSpeedButton;
    lblAcessoENQIPI: TLabel;
    SBConsENQIPI: TSpeedButton;
    lblAcessoCSOSN: TLabel;
    lblAcessoCSTPIS: TLabel;
    EdtAcessoCSTPIS: TEdit;
    EdtAcessoDescricaoCSTPIS: TEdit;
    SBConsCSTPIS: TSpeedButton;
    lblAcessoCSTCOFINS: TLabel;
    EdtAcessoCSTCOFINS: TEdit;
    EdtAcessoDescricaoCSTCOFINS: TEdit;
    SBConsCSTCOFINS: TSpeedButton;
    RGAcessoTipo: TRadioGroup;
    lblGeraDUPL: TLabel;
    CBGeraDupl: TComboBox;
    lblMovEstoque: TLabel;
    CBMovEst: TComboBox;
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
    procedure SBConsNaturezaClick(Sender: TObject);
    procedure SBConsCSTICMSClick(Sender: TObject);
    procedure SBConsCSOSNClick(Sender: TObject);
    procedure SBConsCSTIPIClick(Sender: TObject);
    procedure SBConsENQIPIClick(Sender: TObject);
    procedure SBConsCSTPISClick(Sender: TObject);
    procedure SBConsCSTCOFINSClick(Sender: TObject);
    procedure EdtAcessoNaturezaChange(Sender: TObject);
    procedure EdtAcessoCSTICMSChange(Sender: TObject);
    procedure EdtAcessoCSOSNChange(Sender: TObject);
    procedure EdtAcessoCSTIPIChange(Sender: TObject);
    procedure EdtAcessoENQIPIChange(Sender: TObject);
    procedure EdtAcessoCSTPISChange(Sender: TObject);
    procedure EdtAcessoCSTCOFINSChange(Sender: TObject);
    procedure btnAcessoConsultarClick(Sender: TObject);
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
 CBMovEst.Enabled := True;
 CBGeraDUPL.Enabled := True;
 CBRealizaCalcCredPres.Enabled := True;

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
    aliq_icms, aliq_ipi, aliq_cofins, aliq_pis, tela, aliq_cred_pres, Realiza_calc_credpres, Gera_DUPL, Mov_Est: string;
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
 if CBMovEst.ItemIndex = 0 then Mov_Est := 'S' else Mov_Est := 'N';
 if CBGeraDUPL.ItemIndex = 0 then Gera_DUPL := 'S' else Gera_DUPL := 'N';
 if CBRealizaCalcCredPres.Checked then Realiza_calc_credpres := 'S' else Realiza_calc_credpres := 'N';

 if CBMovEst.Text = '' then begin
  CBMovEst.ItemIndex := 1;
 end;

 if CBGeraDUPL.Text = '' then begin
  CBGeraDUPL.ItemIndex := 1
 end;

 if EdtNatureza.Text = '' then begin
  ShowMessage('Natureza não pode ficar vazia!');
  Abort;
 End;

 if EdtDescricao.Text = '' then begin
  ShowMessage('Descrição não pode ficar vazia!');
  Abort;
 End;

 if CBTipo.Text = '' then begin
  ShowMessage('Tipo não pode ficar vazia!');
  Abort;
 End;

 if EdtCSTICMS.Text = '' then begin
  if EdtCSOSN.Text = '' then begin
   ShowMessage('CSOSN não pode ficar vazia!');
   Abort;
  end;
 End;

 if EdtCSOSN.Text = '' then begin
  if EdtCSTICMS.Text = '' then begin
   ShowMessage('CST ICMS não pode ficar vazia!');
   Abort;
  end;
 End;

 if EdtCSTIPI.Text = '' then begin
  ShowMessage('CST IPI não pode ficar vazia!');
  Abort;
 End;

 if EdtCSTPIS.Text = '' then begin
  ShowMessage('CST PIS não pode ficar vazia!');
  Abort;
 End;

 if EdtCSTCOFINS.Text = '' then begin
  ShowMessage('CST COFINS não pode ficar vazia!');
  Abort;
 End;

 if EdtAliqICMS.Text = '' then begin
  EdtAliqICMS.Text := '0';
  Abort;
 End;

 if EdtAliqIPI.Text = '' then begin
  EdtAliqIPI.Text := '0';
  Abort;
 End;

 if EdtAliqPIS.Text = '' then begin
  EdtAliqPIS.Text := '0';
  Abort;
 End;

 if EdtAliqCOFINS.Text = '' then begin
  EdtAliqCOFINS.Text := '0';
  Abort;
 End;

 if EdtAliq_Cred_Pres.Text = '' then begin
  EdtAliq_Cred_Pres.Text := '0';
  Abort;
 End;

 CadNaturezaDM.SelectQuery.SQL.Clear;
 CadNaturezaDM.SelectQuery.SQL.Text :=
 'select * from cadnatureza where natureza = :natureza';
 CadNaturezaDM.SelectQuery.ParamByName('natureza').AsString := natureza;
 CadNaturezaDM.SelectQuery.Open;

 if not CadNaturezaDM.SelectQuery.IsEmpty then begin
  ShowMessage('Natureza já cadastrada!');
  Abort;
 End;

 CadNaturezaDM.InsertQuery.SQL.Clear;
 CadNaturezaDM.InsertQuery.SQL.Text :=
 'insert into cadnatureza (natureza, descricao, tipo, ativo, cBenef, cCredPres, cst_icms, csosn, cst_ipi, enq_ipi, cst_pis, cst_cofins, aliq_icms, ' +
 'aliq_ipi, aliq_pis, aliq_cofins, Aliq_Cred_Pres, Realiza_calc_credpres, Gera_DUPL, Mov_Est) ' +
 'values ' +
 '(:natureza, :descricao, :tipo, :ativo, :cbenef, :ccredpres, :cst_icms, :csosn, :cst_ipi, :enq_ipi, :cst_pis, :cst_cofins, :aliq_icms, :Aliq_Cred_Pres, ' +
 ':aliq_ipi, :aliq_pis, :aliq_cofins, :Realiza_calc_credpres, :Gera_DUPL, :Mov_Est)';
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
 CadNaturezaDM.InsertQuery.ParamByName('Realiza_calc_credpres').AsString := Realiza_calc_credpres;
 CadNaturezaDM.InsertQuery.ParamByName('Gera_DUPL').AsString := Gera_DUPL;
 CadNaturezaDM.InsertQuery.ParamByName('Mov_Est').AsString := Mov_Est;

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
  CBMovEst.Enabled := False;
  CBGeraDUPL.Enabled := False;
  CBRealizaCalcCredPres.Enabled := False;

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

procedure TCadNatureza.btnAlterarClick(Sender: TObject);
begin
 if EdtNatureza.Text = '' then begin
  ShowMessage('Nenhuma Natureza selecionada!');
  Abort;
 End;

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
 CBMovEst.Enabled := True;
 CBGeraDUPL.Enabled := True;
 CBRealizaCalcCredPres.Enabled := True;

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

procedure TCadNatureza.BtnGravarAlterarClick(Sender: TObject);
var natureza, descricao, tipo, ativo, cBenef, cCredPres, cst_icms, csosn, cst_ipi, enq_ipi, cst_pis, cst_cofins,
    aliq_icms, aliq_ipi, aliq_cofins, aliq_pis, Aliq_Cred_Pres, Realiza_calc_credpres, Gera_DUPL, Mov_Est: string;
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
 if CBMovEst.ItemIndex = 0 then Mov_Est := 'S' else Mov_Est := 'N';
 if CBGeraDUPL.ItemIndex = 0 then Gera_DUPL := 'S' else Gera_DUPL := 'N';
 if CBRealizaCalcCredPres.Checked then Realiza_calc_credpres := 'S' else Realiza_calc_credpres := 'N';

 if CBMovEst.Text = '' then begin
  CBMovEst.ItemIndex := 1;
 end;

 if CBGeraDUPL.Text = '' then begin
  CBGeraDUPL.ItemIndex := 1
 end;

  if EdtNatureza.Text = '' then begin
  ShowMessage('Natureza não pode ficar vazia!');
  Abort;
 End;

 if EdtDescricao.Text = '' then begin
  ShowMessage('Descrição não pode ficar vazia!');
  Abort;
 End;

 if CBTipo.Text = '' then begin
  ShowMessage('Tipo não pode ficar vazia!');
  Abort;
 End;

 if EdtCSTICMS.Text = '' then begin
  if EdtCSOSN.Text = '' then begin
   ShowMessage('Preencha ou o campo CST ICMS ou o campo CSOSN!');
   Abort;
  end;
 End;

 if EdtCSOSN.Text = '' then begin
  if EdtCSTICMS.Text = '' then begin
   ShowMessage('Preencha ou o campo CST ICMS ou o campo CSOSN!');
   Abort;
  end;
 End;

 if EdtCSTIPI.Text = '' then begin
  ShowMessage('CST IPI não pode ficar vazia!');
  Abort;
 End;

 if EdtCSTPIS.Text = '' then begin
  ShowMessage('CST PIS não pode ficar vazia!');
  Abort;
 End;

 if EdtCSTCOFINS.Text = '' then begin
  ShowMessage('CST COFINS não pode ficar vazia!');
  Abort;
 End;

 if EdtAliqICMS.Text = '' then begin
  EdtAliqICMS.Text := '0';
  Abort;
 End;

 if EdtAliqIPI.Text = '' then begin
  EdtAliqIPI.Text := '0';
  Abort;
 End;

 if EdtAliqPIS.Text = '' then begin
  EdtAliqPIS.Text := '0';
  Abort;
 End;

 if EdtAliqCOFINS.Text = '' then begin
  EdtAliqCOFINS.Text := '0';
  Abort;
 End;

 if EdtAliq_Cred_Pres.Text = '' then begin
  EdtAliq_Cred_Pres.Text := '0';
  Abort;
 End;

 CadNaturezaDM.UpdateQuery.SQL.Clear;
 CadNaturezaDM.UpdateQuery.SQL.Text :=
 'update cadnatureza set descricao = :descricao, tipo = :tipo, ativo = :ativo, cBenef = :cbenef, cCredPres = :ccredpres, ' +
 'cst_icms = :cst_icms, csosn = :csosn, cst_ipi = :cst_ipi, enq_ipi = :enq_ipi, cst_pis = :cst_pis, cst_cofins = :cst_cofins, ' +
 'aliq_ICMS = :aliq_icms, aliq_ipi = :aliq_ipi, aliq_pis = :aliq_pis, aliq_cofins = :aliq_cofins, Aliq_Cred_Pres = :Aliq_Cred_Pres, ' +
 'Realiza_calc_credpres = :Realiza_calc_credpres, Gera_DUPL = :Gera_DUPL, Mov_Est = :Mov_Est ' +
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
 CadNaturezaDM.UpdateQuery.ParamByName('Realiza_calc_credpres').AsString := Realiza_calc_credpres;
 CadNaturezaDM.UpdateQuery.ParamByName('Gera_DUPL').AsString := Gera_DUPL;
 CadNaturezaDM.UpdateQuery.ParamByName('Mov_Est').AsString := Mov_Est;

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
  CBMovEst.Enabled := False;
  CBGeraDUPL.Enabled := False;
  CBRealizaCalcCredPres.Enabled := False;

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

procedure TCadNatureza.BtnConsultarClick(Sender: TObject);
var natureza, descricao, tipo, ativo, cBenef, cCredPres, cst_icms, csosn, cst_ipi, enq_ipi, cst_pis, cst_cofins,
    aliq_icms, aliq_ipi, aliq_cofins, aliq_pis, Aliq_Cred_Pres, Realiza_calc_credpres, Gera_DUPL, Mov_Est: string;
begin
 with CadNaturezaDM.qryConsultarNatureza do
 begin
  SQL.Clear;
  SQL.Add('select * from cadnatureza where ativo = :ativo');
  ParamByName('ativo').AsString := 'S';
  Open;
 end;

 Application.CreateForm(TConsultarNatureza, ConsultarNatureza);
 natureza := ConsultarNatureza.SelecionarNatureza;
 if natureza <> '' then begin
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
  EdtAliq_Cred_Pres.Text := Aliq_Cred_Pres;
  Realiza_calc_credpres := ConsultarNatureza.Realiza_calc_credpres;
  CBRealizaCalcCredpres.checked := Realiza_calc_credpres = 'S';
  Gera_DUPL := ConsultarNatureza.Gera_DUPL;
  if Gera_DUPL = 'S' then CBGeraDupl.ItemIndex := 0;
  if Gera_DUPL = 'N' then CBGeraDupl.ItemIndex := 1;
  Mov_Est := ConsultarNatureza.Mov_Est;
  if Mov_Est = 'S' then CBMovEst.ItemIndex := 0;
  if Mov_Est = 'N' then CBMovEst.ItemIndex := 1;
 end;
end;

procedure TCadNatureza.SBConsNaturezaClick(Sender: TObject);
var natureza, descricao: string;
begin
 with CadNaturezaDM.qryConsultarNatureza do
 begin
  SQL.Clear;
  SQL.Add('select * from cadnatureza');
  Open;
 end;

 Application.CreateForm(TConsultarNatureza, ConsultarNatureza);
 natureza := ConsultarNatureza.SelecionarNatureza;
 if natureza <> '' then begin
  EdtAcessoNatureza.Text := natureza;
  Descricao := ConsultarNatureza.Descricao;
  EdtAcessoDescricaoNatureza.Text := Descricao;
 end;
end;

procedure TCadNatureza.EdtAcessoNaturezaChange(Sender: TObject);
var natureza: string;
begin
 natureza := EdtAcessoNatureza.Text;

 with CadNaturezaDM.qryConsultarNatureza do
 begin
  SQL.Clear;
  SQL.Add('select * from cadnatureza where natureza = :natureza');
  ParamByName('natureza').AsString := natureza;
  Open;

  EdtAcessoDescricaoNatureza.Text := FieldbyName('descricao').AsString;
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
 EdtCSTCOFINS.Enabled := False;
 EdtAliqICMS.Enabled := False;
 EdtAliqIPI.Enabled := False;
 EdtAliqPIS.Enabled := False;
 EdtAliqCOFINS.Enabled := False;
 EdtAliq_Cred_Pres.Enabled := False;
 EdtcCredPres.Enabled := False;
 EdtcBenef.Enabled := False;
 CBMovEst.Enabled := False;
 CBGeraDUPL.Enabled := False;
 CBRealizaCalcCredPres.Enabled := False;

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
 CadNaturezaDM.SelectQuery.SQL.Text :=
 'select * from cadnatureza where natureza = :natureza';
 CadNaturezaDM.SelectQuery.ParamByName('natureza').AsString := natureza;
 CadNaturezaDM.SelectQuery.Open;

 if CadNaturezaDM.SelectQuery.IsEmpty then begin
  ShowMessage('Natureza não encontrada!');
  Abort;
 End;

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

procedure TCadNatureza.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
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

procedure TCadNatureza.SBConsCSOSNClick(Sender: TObject);
var CSOSN, descricao: string;
begin
 CadCSOSNDM.ConsultarCSOSN.SQL.Clear;
 CadCSOSNDM.ConsultarCSOSN.SQL.Text :=
 'select * from cadcsosn';
 CadCSOSNDM.ConsultarCSOSN.Open;

 Application.CreateForm(TConsultarCSOSN, ConsultarCSOSN);
 CSOSN := ConsultarCSOSN.SelecionarCSOSN;
 EdtAcessoCSOSN.Text := CSOSN;
 Descricao := ConsultarCSOSN.Descricao;
 EdtAcessoDescricaoCSOSN.text := descricao;
end;

procedure TCadNatureza.EdtAcessoCSOSNChange(Sender: TObject);
var CSOSN: string;
begin
 CSOSN := EdtAcessoCSOSN.text;
 CadCSOSNDM.ConsultarCSOSN.SQL.Clear;
 CadCSOSNDM.ConsultarCSOSN.SQL.Text :=
 'select * from cadcsosn where CSOSN = :csosn';
 CadCSOSNDM.ConsultarCSOSN.Parambyname('csosn').AsString := CSOSN;
 CadCSOSNDM.ConsultarCSOSN.Open;

 EdtAcessoDescricaoCSOSN.text := CadCSOSNDM.ConsultarCSOSN.FieldByName('descricao').AsString;
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

procedure TCadNatureza.SBConsCSTCOFINSClick(Sender: TObject);
var CofinsCST, descricao: string;
begin
 CadCSTCOFINSDM.ConsultarCSTCOFINS.SQL.Clear;
 CadCSTCOFINSDM.ConsultarCSTCOFINS.SQL.Text :=
 'select * from cadcstcofins';
 CadCSTCOFINSDM.ConsultarCSTCOFINS.Open;

 Application.CreateForm(TConsultarCSTCOFINS, ConsultarCSTCOFINS);
 CofinsCST := ConsultarCSTCOFINS.SelecionarCofinsCST;
 EdtAcessoCSTCOFINS.Text := CofinsCST;
 Descricao := ConsultarCSTCOFINS.Descricao;
 EdtAcessoDescricaoCSTCOFINS.text := descricao;
end;

procedure TCadNatureza.EdtAcessoCSTCOFINSChange(Sender: TObject);
var CofinsCST: string;
begin
 CofinsCST := EdtAcessoCSTCOFINS.text;
 CadCSTCOFINSDM.ConsultarCSTCOFINS.SQL.Clear;
 CadCSTCOFINSDM.ConsultarCSTCOFINS.SQL.Text :=
 'select * from cadcstcofins where cst = :cst';
 CadCSTCOFINSDM.ConsultarCSTCOFINS.ParamByName('cst').AsString := CofinsCST;
 CadCSTCOFINSDM.ConsultarCSTCOFINS.Open;

 EdtAcessoDescricaoCSTCOFINS.text := CadCSTCOFINSDM.ConsultarCSTCOFINS.FieldByName('descricao').AsString;
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

procedure TCadNatureza.SBConsCSTICMSClick(Sender: TObject);
var IcmsCST, descricao: String;
begin
 CadCSTICMSDM.ConsultarCSTICMS.SQL.Clear;
 CadCSTICMSDM.ConsultarCSTICMS.SQL.Text :=
 'select * from cadcsticms';
 CadCSTICMSDM.ConsultarCSTICMS.Open;

 Application.CreateForm(TConsultarCSTICMS, ConsultarCSTICMS);
 IcmsCST := ConsultarCSTICMS.SelecionarIcmsCST;
 EdtAcessoCSTICMS.Text := IcmsCST;
 Descricao := ConsultarCSTICMS.Descricao;
 EdtAcessoDescricaoCSTICMS.Text := Descricao;
end;

procedure TCadNatureza.EdtAcessoCSTICMSChange(Sender: TObject);
var IcmsCST: String;
begin
 IcmsCST := EdtAcessoCSTICMS.text;
 CadCSTICMSDM.ConsultarCSTICMS.SQL.Clear;
 CadCSTICMSDM.ConsultarCSTICMS.SQL.Text :=
 'select * from cadcsticms where cst = :cst';
 CadCSTICMSDM.ConsultarCSTICMS.ParamByName('cst').AsString := IcmsCST;
 CadCSTICMSDM.ConsultarCSTICMS.Open;

 EdtAcessoDescricaoCSTICMS.Text := CadCSTICMSDM.ConsultarCSTICMS.FieldByName('descricao').AsString;
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

procedure TCadNatureza.SBConsCSTPISClick(Sender: TObject);
var CSTPIS, descricao: string;
begin
 CadCSTPISDM.ConsultarCSTPIS.SQL.Clear;
 CadCSTPISDM.ConsultarCSTPIS.SQL.Text :=
 'select * from cadcstpis';
 CadCSTPISDM.ConsultarCSTPIS.Open;

 Application.CreateForm(TConsultarCSTPIS, ConsultarCSTPIS);
 CSTPIS := ConsultarCSTPIS.SelecionarPisCST;
 EdtAcessoCSTPIS.Text := CSTPIS;
 Descricao := ConsultarCSTPIS.Descricao;
 EdtAcessoDescricaoCSTPIS.Text := Descricao;
end;

procedure TCadNatureza.EdtAcessoCSTPISChange(Sender: TObject);
var CSTPIS: string;
begin
 CSTPIS := EdtAcessoCSTPIS.text;
 CadCSTPISDM.ConsultarCSTPIS.SQL.Clear;
 CadCSTPISDM.ConsultarCSTPIS.SQL.Text :=
 'select * from cadcstpis where cst = :cst';
 CadCSTPISDM.ConsultarCSTPIS.ParamByName('cst').AsString := CSTPIS;
 CadCSTPISDM.ConsultarCSTPIS.Open;

 EdtAcessoDescricaoCSTPIS.Text := CadCSTPISDM.ConsultarCSTPIS.FieldByName('descricao').AsString;
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

procedure TCadNatureza.SBConsCSTIPIClick(Sender: TObject);
var CSTIPI, descricao: string;
begin
 CadCSTIPIDM.ConsultarCSTIPI.SQL.Clear;
 CadCSTIPIDM.ConsultarCSTIPI.SQL.Text :=
 'select * from cadcstipi';
 CadCSTIPIDM.ConsultarCSTIPI.Open;

 Application.CreateForm(TConsultarCSTIPI, ConsultarCSTIPI);
 CstIPI := ConsultarCSTIPI.SelecionarCstIPI;
 EdtAcessoCSTIPI.Text := CstIPI;
 Descricao := ConsultarCSTIPI.Descricao;
 EdtAcessoDescricaoCSTIPI.text := descricao;
end;

procedure TCadNatureza.EdtAcessoCSTIPIChange(Sender: TObject);
var CSTIPI, descricao: string;
begin
 CSTIPI := EdtAcessoCSTIPI.Text;
 CadCSTIPIDM.ConsultarCSTIPI.SQL.Clear;
 CadCSTIPIDM.ConsultarCSTIPI.SQL.Text :=
 'select * from cadcstipi where cst = :cst';
 CadCSTIPIDM.ConsultarCSTIPI.ParamByName('cst').AsString := CSTIPI;
 CadCSTIPIDM.ConsultarCSTIPI.Open;

 EdtAcessoDescricaoCSTIPI.text := CadCSTIPIDM.ConsultarCSTIPI.FieldByName('Descricao').AsString;
end;

procedure TCadNatureza.EdtAcessoENQIPIChange(Sender: TObject);
var ENQIPI: string;
begin
 ENQIPI := EdtAcessoENQIPI.Text;
 CadENQIPIDM.ConsultarENQIPI.SQL.Clear;
 CadENQIPIDM.ConsultarENQIPI.SQL.Text :=
 'select * from cadenqipi where cst = :cst';
 CadENQIPIDM.ConsultarENQIPI.ParamByName('cst').AsString := ENQIPI;
 CadENQIPIDM.ConsultarENQIPI.Open;

 EdtAcessoDescricaoENQIPI.text := CadENQIPIDM.ConsultarENQIPI.FieldByName('Descricao').AsString;
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

procedure TCadNatureza.SBConsENQIPIClick(Sender: TObject);
var EnqIPI, descricao: String;
begin
 CadENQIPIDM.ConsultarENQIPI.SQL.Clear;
 CadENQIPIDM.ConsultarENQIPI.SQL.Text :=
 'select * from cadenqipi';
 CadENQIPIDM.ConsultarENQIPI.Open;

 Application.CreateForm(TConsultarEnqIPI, ConsultarEnqIPI);
 EnqIPI := ConsultarEnqIPI.SelecionarEnqIPI;
 EdtAcessoEnqIPI.Text := EnqIPI;
 descricao := ConsultarEnqIPI.Descricao;
 EdtAcessoDescricaoEnqIPI.text := descricao;
end;

procedure TCadNatureza.btnAcessoConsultarClick(Sender: TObject);
var natureza, cst_icms, csosn, cst_ipi, enq_ipi, cst_pis, cst_cofins: string;
    temwhere: boolean;
    i: integer;
begin
 natureza := EdtAcessoNatureza.Text;
 cst_icms := EdtAcessoCSTICMS.Text;
 csosn := EdtAcessoCSOSN.Text;
 CST_IPI := EdtAcessoCSTIPI.text;
 ENQ_IPI := EdtAcessoEnqIPI.text;
 CST_PIS := EdtAcessoCSTPIS.text;
 CST_COFINS := EdtAcessoCSTCOFINS.Text;

 CadNaturezaDM.qryAcesso.SQL.Clear;
 CadNaturezaDM.qryAcesso.SQL.Text :=
 'select * from cadnatureza';
 temwhere := false;

 if natureza <> '' then begin
  if temwhere then begin
   CadNaturezaDM.qryAcesso.SQL.Add('and natureza = :natureza');
  end
  else begin
   CadNaturezaDM.qryAcesso.SQL.Add('where natureza = :natureza');
   temwhere := true;
  end;
 CadNaturezaDM.qryAcesso.ParamByName('natureza').AsString := natureza;
 end;

 if cst_icms <> '' then begin
  if temwhere then begin
   CadNaturezaDM.qryAcesso.SQL.Add('and cst_icms = :cst_icms');
  end
  else begin
   CadNaturezaDM.qryAcesso.SQL.Add('where cst_icms = :cst_icms');
   temwhere := true;
  end;
 CadNaturezaDM.qryAcesso.ParamByName('cst_icms').AsString := cst_icms;
 end;

 if csosn <> '' then begin
  if temwhere then begin
   CadNaturezaDM.qryAcesso.SQL.Add('and csosn = :csosn');
  end
  else begin
   CadNaturezaDM.qryAcesso.SQL.Add('where csosn = :csosn');
   temwhere := true;
  end;
 CadNaturezaDM.qryAcesso.ParamByName('csosn').AsString := csosn;
 end;

 if CST_IPI <> '' then begin
  if temwhere then begin
   CadNaturezaDM.qryAcesso.SQL.Add('and CST_IPI = :CST_IPI');
  end
  else begin
   CadNaturezaDM.qryAcesso.SQL.Add('where CST_IPI = :CST_IPI');
   temwhere := true;
  end;
 CadNaturezaDM.qryAcesso.ParamByName('CST_IPI').AsString := CST_IPI;
 end;

 if ENQ_IPI <> '' then begin
  if temwhere then begin
   CadNaturezaDM.qryAcesso.SQL.Add('and ENQ_IPI = :ENQ_IPI');
  end
  else begin
   CadNaturezaDM.qryAcesso.SQL.Add('where ENQ_IPI = :ENQ_IPI');
   temwhere := true;
  end;
 CadNaturezaDM.qryAcesso.ParamByName('ENQ_IPI').AsString := ENQ_IPI;
 end;

 if CST_PIS <> '' then begin
  if temwhere then begin
   CadNaturezaDM.qryAcesso.SQL.Add('and CST_PIS = :CST_PIS');
  end
  else begin
   CadNaturezaDM.qryAcesso.SQL.Add('where CST_PIS = :CST_PIS');
   temwhere := true;
  end;
 CadNaturezaDM.qryAcesso.ParamByName('CST_PIS').AsString := CST_PIS;
 end;

 if CST_COFINS <> '' then begin
  if temwhere then begin
   CadNaturezaDM.qryAcesso.SQL.Add('and CST_COFINS = :CST_COFINS');
  end
  else begin
   CadNaturezaDM.qryAcesso.SQL.Add('where CST_COFINS = :CST_COFINS');
   temwhere := true;
  end;
 CadNaturezaDM.qryAcesso.ParamByName('CST_COFINS').AsString := CST_COFINS;
 end;

 if RGAcessoAtivo.ItemIndex = 0 then begin
  if temwhere then
   begin
    CadNaturezaDM.qryAcesso.SQL.Add('and ativo = :ativo');
   end
    else begin
     CadNaturezaDM.qryAcesso.SQL.Add('where ativo = :ativo');
     temwhere := true;
    end;
 CadNaturezaDM.qryAcesso.ParamByName('ativo').AsString := 'S';
 end;

 if RGAcessoAtivo.ItemIndex = 1 then begin
  if temwhere then begin
   CadNaturezaDM.qryAcesso.SQL.Add('and ativo = :ativo');
  end
  else begin
   CadNaturezaDM.qryAcesso.SQL.Add('where ativo = :ativo');
   temwhere := true;
  end;
 CadNaturezaDM.qryAcesso.ParamByName('ativo').AsString := 'N';
 end;

 if RGAcessoTipo.ItemIndex = 0 then begin
  if temwhere then begin
   CadNaturezaDM.qryAcesso.SQL.Add('and tipo = :tipo');
  end
  else begin
   CadNaturezaDM.qryAcesso.SQL.Add('where tipo = :tipo');
   temwhere := true;
  end;
 CadNaturezaDM.qryAcesso.ParamByName('tipo').AsString := 'E';
 end;

 if RGAcessoTipo.ItemIndex = 1 then begin
  if temwhere then begin
   CadNaturezaDM.qryAcesso.SQL.Add('and tipo = :tipo');
  end
  else begin
   CadNaturezaDM.qryAcesso.SQL.Add('where tipo = :tipo');
   temwhere := true;
  end;
 CadNaturezaDM.qryAcesso.ParamByName('tipo').AsString := 'S';
 end;
 CadNaturezaDM.qryAcesso.Open;
 for i := 0 to AcessoGrid.Columns.Count - 1 do
  AcessoGrid.Columns[i].Width := AcessoGrid.Canvas.TextWidth(AcessoGrid.Columns[i].Title.Caption + '     ');
end;
end.
