unit Empresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  CEPDM, ConsultarCEPForm,
  EmpresaDM,
  Log, LogDM,
  GlobalUnit, Vcl.Mask;

type
  TCadEmpresa = class(TForm)
    Panel1: TPanel;
    lblRazaoSocial: TLabel;
    lblCNPJ: TLabel;
    lblIE: TLabel;
    lblBairro: TLabel;
    lblRua: TLabel;
    LblPais: TLabel;
    LblCEP: TLabel;
    LblCidade: TLabel;
    LblComplemento: TLabel;
    lblNumero: TLabel;
    LblEstado: TLabel;
    EdtEstado: TEdit;
    EdtCidade: TEdit;
    EdtComplemento: TEdit;
    EdtNumero: TEdit;
    EdtRua: TEdit;
    EdtPais: TEdit;
    SBCEP: TSpeedButton;
    EdtBairro: TEdit;
    EdtRazaoSocial: TEdit;
    btnAlterar: TButton;
    BtnDesistir: TButton;
    btnFechar: TButton;
    BtnGravarAlterar: TButton;
    BtnGravarIncluir: TButton;
    btnIncluir: TButton;
    lblEmpID: TLabel;
    edtEmp_ID: TEdit;
    lblSerie: TLabel;
    edtSerie: TEdit;
    GBBCRT: TGroupBox;
    CBRegime: TComboBox;
    EdtCEP: TEdit;
    EdtCNPJ: TEdit;
    EdtIE: TEdit;
    lblFantasia: TLabel;
    EdtFantasia: TEdit;
    lblTelefone: TLabel;
    EdtTelefone: TEdit;
    procedure SBCEPClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure BtnDesistirClick(Sender: TObject);
    procedure BtnGravarIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure BtnGravarAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadEmpresa: TCadEmpresa;

implementation

{$R *.dfm}

procedure TCadEmpresa.FormShow(Sender: TObject);
var nome, cnpj, IE, rua, numero, estado, bairro, cidade, pais, complemento, cep, serie, EMP_ID, CRT, Telefone, Fantasia: string;
begin
 With CadEmpresaDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from empresa where emp_id = :emp_id');
  ParamByName('EMP_ID').AsString := empresalogada;
  Open;

  nome := FieldByName('nome').AsString;
  CNPJ := FieldByName('CNPJ').AsString;
  IE := FieldByName('IE').AsString;
  Rua := FieldByName('Rua').AsString;
  Numero := FieldByName('Numero').AsString;
  Estado := FieldByName('Estado').AsString;
  Bairro := FieldByName('Bairro').AsString;
  Cidade := FieldByName('Cidade').AsString;
  Pais := FieldByName('Pais').AsString;
  complemento := FieldByName('complemento').AsString;
  CEP := FieldByName('cep').AsString;
  serie := FieldByName('serie').AsString;
  EMP_ID := FieldByName('EMP_ID').AsString;
  CRT := FieldByName('CRT').AsString;
  Fantasia := FieldByName('Fantasia').AsString;
  Telefone := FieldByName('Telefone').AsString;
 end;

 EdtTelefone.Text := telefone;
 EdtRazaoSocial.text := nome;
 EdtFantasia.Text := Fantasia;
 EdtCNPJ.Text := CNPJ;
 EdtIE.Text := IE;
 EdtRua.Text := Rua;
 EdtNumero.text := Numero;
 EdtEstado.Text := Estado;
 EdtBairro.text := Bairro;
 EdtCidade.Text := Cidade;
 EdtPais.Text := Pais;
 edtcomplemento.text := Complemento;
 edtcep.text := Cep;
 edtserie.text := Serie;
 EdtEMP_ID.Text := EmpresaLogada;
 if CRT = '1' then CBRegime.ItemIndex := CBRegime.Items.IndexOf('1 - Simples Nacional')
 else if CRT = '2' then CBRegime.ItemIndex := CBRegime.Items.IndexOf('2 - Simples Nacional, excesso sublimite')
 else if CRT = '3' then CBRegime.ItemIndex := CBRegime.Items.IndexOf('3 - Regime Normal');
end;

procedure TCadEmpresa.btnIncluirClick(Sender: TObject);
begin
 EdtRazaoSocial.Clear;
 EdtCNPJ.Clear;
 EdtIE.Clear;
 EdtRua.Clear;
 EdtNumero.Clear;
 EdtEstado.Clear;
 EdtBairro.Clear;
 EdtCidade.Clear;
 EdtPais.Clear;
 EdtComplemento.Clear;
 EdtCEP.Clear;
 EdtEMP_ID.Clear;
 EdtSerie.Clear;
 EdtFantasia.Clear;
 EdtTelefone.Clear;

 EdtTelefone.Enabled := True;
 EdtFantasia.Enabled := True;
 EdtRazaoSocial.Enabled := True;
 EdtCNPJ.Enabled := True;
 EdtIE.Enabled := True;
 EdtRua.Enabled := True;
 EdtNumero.Enabled := True;
 EdtBairro.Enabled := True;
 EdtComplemento.Enabled := True;
 EdtCEP.Enabled := True;
 edtserie.Enabled := True;
 EdtEMP_ID.Enabled := True;
 CBRegime.enabled := True;

 btnIncluir.Visible := False;
 btnAlterar.Visible := False;

 SBCEP.Enabled := True;
 btnGravarIncluir.Visible := True;
 btnDesistir.Visible := True;
end;

procedure TCadEmpresa.BtnGravarIncluirClick(Sender: TObject);
var nome, cnpj, IE, rua, numero, estado, bairro, cidade, pais, complemento, cep, serie, EMP_ID, CRT, Fantasia, telefone: string;
begin
 nome := EdtRazaoSocial.text;
 fantasia := EdtFantasia.Text;
 CNPJ := EdtCNPJ.Text;
 IE := EdtIE.Text;
 Rua := EdtRua.Text;
 Numero := EdtNumero.text;
 Estado := EdtEstado.Text;
 Bairro := EdtBairro.text;
 Cidade := EdtCidade.Text;
 Pais := EdtPais.Text;
 complemento := edtcomplemento.text;
 cep := edtcep.text;
 serie := edtserie.text;
 EMP_ID := EdtEMP_ID.Text;
 telefone := EdtTelefone.Text;

 if CBRegime.Text = '1 - Simples Nacional' then CRT := '1'
 else if CBRegime.Text = '2 - Simples Nacional, excesso sublimite' then CRT := '2'
 else if CBRegime.Text = '3 - Regime Normal' then CRT := '3';

 if Nome = '' then begin
  ShowMessage('Nome não pode ficar em branco!');
  Abort;
 end;

 if Fantasia = '' then begin
  ShowMessage('Fantasia não pode ficar em branco!');
  Abort;
 end;

 if StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(EdtCNPJ.Text, '.', '', [rfReplaceAll]), '/', '', [rfReplaceAll]), '-', '', [rfReplaceAll]), '_', '', [rfReplaceAll]), ' ', '', [rfReplaceAll]) = '' then begin
  ShowMessage('CNPJ não pode ficar em branco!');
  Abort;
 end;

 if StringReplace(StringReplace(StringReplace(StringReplace(EdtIE.Text, '.', '', [rfReplaceAll]), '-', '', [rfReplaceAll]), '_', '', [rfReplaceAll]), ' ', '', [rfReplaceAll]) = '' then begin
  ShowMessage('IE não pode ficar em branco!');
  Abort;
 end;

 if EMP_ID = '' then begin
  ShowMessage('EMP_ID não pode ficar em branco!');
  Abort;
 end;

 if Rua = '' then begin
  ShowMessage('Rua não pode ficar em branco!');
  Abort;
 end;

 if Numero = '' then begin
  ShowMessage('Numero não pode ficar em branco!');
  Abort;
 end;

 if Estado = '' then begin
  ShowMessage('Estado não pode ficar em branco!');
  Abort;
 end;

 if Bairro = '' then begin
  ShowMessage('Bairro não pode ficar em branco!');
  Abort;
 end;

 if Cidade = '' then begin
  ShowMessage('Cidade não pode ficar em branco!');
  Abort;
 end;

 if Pais = '' then begin
  ShowMessage('País não pode ficar em branco!');
  Abort;
 end;

 if Complemento = '' then begin
   ShowMessage('Complemento não pode ficar em branco!');
   Abort;
 end;

 if Serie = '' then begin
  ShowMessage('Série não pode ficar em branco!');
   Abort;
 end;

 if Telefone = '' then begin
   ShowMessage('Telefone não pode ficar em branco!');
  Abort;
 end;

 if CBRegime.Text = '' then begin
  ShowMessage('Regime não selecionado!');
  Abort;
 end;

 CadEmpresaDM.Conexão.StartTransaction;
 try
  with CadEmpresaDM.qryInsert do
  begin
   SQL.Clear;
   SQL.Add('insert into empresa (nome, Fantasia, cnpj, IE, rua, numero, estado, bairro, cidade, pais, complemento, cep, serie, EMP_ID, CRT, Telefone)');
   SQL.Add('values');
   SQL.Add('(:nome, :Fantasia, :cnpj, :IE, :rua, :numero, :estado, :bairro, :cidade, :pais, :complemento, :cep, :serie, :EMP_ID, :CRT, :Telefone)');
   ParamByName('nome').AsString := nome;
   ParamByName('cnpj').AsString := cnpj;
   ParamByName('IE').AsString := IE;
   ParamByName('rua').AsString := rua;
   ParamByName('numero').AsString := numero;
   ParamByName('estado').AsString := estado;
   ParamByName('bairro').AsString := bairro;
   ParamByName('cidade').AsString := cidade;
   ParamByName('pais').AsString := pais;
   ParamByName('complemento').AsString := complemento;
   ParamByName('cep').AsString := cep;
   ParamByName('serie').AsString := serie;
   ParamByName('EMP_ID').AsString := EMP_ID;
   ParamByName('CRT').AsString := CRT;
   ParamByName('Fantasia').AsString := Fantasia;
   ParamByName('Telefone').AsString := Telefone;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, data, tela, usuario, emp_id)');
   SQL.Add('values');
   SQL.Add('(:descricao, :data, :tela, :usuario, :emp_id)');
   ParamByName('descricao').AsString :=
   'Inseriu a empresa ' + nome + ' no CNPJ ' + CNPJ + ' na IE ' + IE + ' no CEP ' + CEP + ' na série ' + serie + ' e CRT ' + CRT;
   ParamByName('data').AsDateTime := Now;
   ParamByName('tela').AsString := 'CadEmpresa';;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadEmpresaDM.Conexão.Commit;
  ShowMessage('Gravado com sucesso');
  EdtRazaoSocial.Enabled := False;
  EdtFantasia.Enabled := False;
  EdtCNPJ.Enabled := False;
  EdtIE.Enabled := False;
  EdtRua.Enabled := False;
  EdtNumero.Enabled := False;
  EdtBairro.Enabled := False;
  EdtComplemento.Enabled := False;
  EdtCEP.Enabled := False;
  edtserie.Enabled := False;
  EdtEMP_ID.Enabled := False;
  EdtTelefone.Enabled := False;
  CBRegime.enabled := False;

  btnIncluir.Visible := True;
  btnAlterar.Visible := True;

  SBCEP.Enabled := False;
  btnGravarIncluir.Visible := False;
  btnDesistir.Visible := False;
  except
  CadEmpresaDM.Conexão.Rollback;
  ShowMessage('Erro na gravação');
  end;
end;

procedure TCadEmpresa.btnAlterarClick(Sender: TObject);
begin
 if EdtEMP_ID.Text = '' then begin
  ShowMessage('Nenhuma empresa selecionada, favor fechar e abrir a tela para recarregar as informações da empresa logada!');
  Abort;
 end;

 EdtRazaoSocial.Enabled := True;
 EdtTelefone.Enabled := True;
 EdtFantasia.Enabled := True;
 EdtCNPJ.Enabled := True;
 EdtIE.Enabled := True;
 EdtRua.Enabled := True;
 EdtNumero.Enabled := True;
 EdtBairro.Enabled := True;
 EdtComplemento.Enabled := True;
 EdtCEP.Enabled := True;
 edtserie.Enabled := True;
 CBRegime.Enabled := True;

 btnIncluir.Visible := False;
 btnAlterar.Visible := False;

 SBCEP.Enabled := True;
 btnGravarAlterar.Visible := True;
 btnDesistir.Visible := True;
end;

procedure TCadEmpresa.BtnGravarAlterarClick(Sender: TObject);
var nome, cnpj, IE, rua, numero, estado, bairro, cidade, pais, complemento, cep, serie, EMP_ID, CRT, Fantasia, telefone: string;
begin
 nome := EdtRazaoSocial.text;
 CNPJ := EdtCNPJ.Text;
 IE := EdtIE.Text;
 Rua := EdtRua.Text;
 Numero := EdtNumero.text;
 Estado := EdtEstado.Text;
 Bairro := EdtBairro.text;
 Cidade := EdtCidade.Text;
 Pais := EdtPais.Text;
 complemento := edtcomplemento.text;
 cep := edtcep.text;
 serie := edtserie.text;
 EMP_ID := EdtEMP_ID.Text;
 Fantasia := EdtFantasia.Text;
 telefone := EdtTelefone.Text;

 if CBRegime.Text = '1 - Simples Nacional' then CRT := '1'
 else if CBRegime.Text = '2 - Simples Nacional, excesso sublimite' then CRT := '2'
 else if CBRegime.Text = '3 - Regime Normal' then CRT := '3';

 if Nome = '' then begin
  ShowMessage('Nome não pode ficar em branco!');
  Abort;
 end;

 if Fantasia = '' then begin
  ShowMessage('Fantasia não pode ficar em branco!');
  Abort;
 end;

 if StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(EdtCNPJ.Text, '.', '', [rfReplaceAll]), '/', '', [rfReplaceAll]), '-', '', [rfReplaceAll]), '_', '', [rfReplaceAll]), ' ', '', [rfReplaceAll]) = '' then begin
  ShowMessage('CNPJ não pode ficar em branco!');
  Abort;
 end;

 if StringReplace(StringReplace(StringReplace(StringReplace(EdtIE.Text, '.', '', [rfReplaceAll]), '-', '', [rfReplaceAll]), '_', '', [rfReplaceAll]), ' ', '', [rfReplaceAll]) = '' then begin
  ShowMessage('IE não pode ficar em branco!');
  Abort;
 end;

 if EMP_ID = '' then begin
  ShowMessage('EMP_ID não pode ficar em branco!');
  Abort;
 end;

 if Rua = '' then begin
  ShowMessage('Rua não pode ficar em branco!');
  Abort;
 end;

 if Numero = '' then begin
  ShowMessage('Numero não pode ficar em branco!');
  Abort;
 end;

 if Estado = '' then begin
  ShowMessage('Estado não pode ficar em branco!');
  Abort;
 end;

 if Bairro = '' then begin
  ShowMessage('Bairro não pode ficar em branco!');
  Abort;
 end;

 if Cidade = '' then begin
  ShowMessage('Cidade não pode ficar em branco!');
  Abort;
 end;

 if Pais = '' then begin
  ShowMessage('País não pode ficar em branco!');
  Abort;
 end;

 if Complemento = '' then begin
   ShowMessage('Complemento não pode ficar em branco!');
   Abort;
 end;

 if Serie = '' then begin
  ShowMessage('Série não pode ficar em branco!');
   Abort;
 end;

 if Telefone = '' then begin
   ShowMessage('Telefone não pode ficar em branco!');
  Abort;
 end;

 if CBRegime.Text = '' then begin
  ShowMessage('Regime não selecionado!');
  Abort;
 end;

 CadEmpresaDM.Conexão.StartTransaction;
 try
  with CadEmpresaDM.qryInsert do
  begin
   SQL.Clear;
   SQL.Add('update empresa set telefone = :telefone, nome = :nome, cnpj = :cnpj, IE = :IE, Rua = :rua, numero = :numero, estado = :estado,');
   SQL.Add('bairro = :bairro, cidade = :cidade,');
   SQL.Add('pais = :pais, complemento = :complemento, cep = :cep, CRT = :CRT, fantasia = :fantasia, serie = :serie where EMP_ID = :EMP_ID');
   ParamByName('nome').AsString := nome;
   ParamByName('cnpj').AsString := cnpj;
   ParamByName('IE').AsString := IE;
   ParamByName('rua').AsString := rua;
   ParamByName('numero').AsString := numero;
   ParamByName('estado').AsString := estado;
   ParamByName('bairro').AsString := bairro;
   ParamByName('cidade').AsString := cidade;
   ParamByName('pais').AsString := pais;
   ParamByName('complemento').AsString := complemento;
   ParamByName('cep').AsString := cep;
   ParamByName('serie').AsString := serie;
   ParamByName('EMP_ID').AsString := EMP_ID;
   ParamByName('CRT').AsString := CRT;
   ParamByName('Fantasia').AsString := Fantasia;
   ParamByName('Telefone').AsString := Telefone;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, data, tela, usuario, emp_id)');
   SQL.Add('values');
   SQL.Add('(:descricao, :data, :tela, :usuario, :emp_id)');
   ParamByName('descricao').AsString :=
   'Alterou a empresa ' + nome + ' no CNPJ ' + CNPJ + ' na IE ' + IE + ' no CEP ' + CEP + ' na série ' + serie + ' no Regime ' + CRT;
   ParamByName('data').AsDateTime := Now;
   ParamByName('tela').AsString := 'CadEmpresa';;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadEmpresaDM.Conexão.Commit;
  ShowMessage('Gravado com sucesso');
  EdtRazaoSocial.Enabled := False;
  EdtCNPJ.Enabled := False;
  EdtIE.Enabled := False;
  EdtRua.Enabled := False;
  EdtNumero.Enabled := False;
  EdtBairro.Enabled := False;
  EdtComplemento.Enabled := False;
  EdtCEP.Enabled := False;
  edtserie.Enabled := False;
  EdtEMP_ID.Enabled := False;
  CBRegime.Enabled := False;
  EdtFantasia.Enabled := False;
  EdtTelefone.Enabled := False;

  btnIncluir.Visible := True;
  btnAlterar.Visible := True;

  SBCEP.Enabled := False;
  btnGravarIncluir.Visible := False;
  btnDesistir.Visible := False;
  except
  CadEmpresaDM.Conexão.Rollback;
  ShowMessage('Erro na gravação');
  end;
end;

procedure TCadEmpresa.BtnDesistirClick(Sender: TObject);
begin
 EdtRazaoSocial.Clear;
 EdtCNPJ.Clear;
 EdtIE.Clear;
 EdtRua.Clear;
 EdtNumero.Clear;
 EdtEstado.Clear;
 EdtBairro.Clear;
 EdtCidade.Clear;
 EdtPais.Clear;
 EdtComplemento.Clear;
 EdtCEP.Clear;
 EdtEMP_ID.Clear;
 edtserie.Clear;
 EdtFantasia.Clear;
 EdtTelefone.Clear;

 EdtRazaoSocial.Enabled := False;
 EdtCNPJ.Enabled := False;
 EdtIE.Enabled := False;
 EdtRua.Enabled := False;
 EdtNumero.Enabled := False;
 EdtBairro.Enabled := False;
 EdtComplemento.Enabled := False;
 EdtCEP.Enabled := False;
 edtserie.Enabled := False;
 EdtEMP_ID.Enabled := False;
 CBRegime.Enabled := False;
 EdtFantasia.Enabled := False;
 EdtTelefone.Enabled := False;

 btnIncluir.Visible := True;
 btnAlterar.Visible := True;

 SBCEP.Enabled := False;
 btnGravarIncluir.Visible := False;
 btnDesistir.Visible := False;
end;

procedure TCadEmpresa.SBCEPClick(Sender: TObject);
var codigo, CEP, Cidade, Estado, Pais: string;
begin
 with CadCEPDM.qryConsultarCEP do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcep where ativo = :ativo');
  ParamByName('ativo').AsString := 'S';
  Open;
 end;

 Application.CreateForm(TConsultarCEP, ConsultarCEP);
 codigo := ConsultarCEP.SelecionarCEP;

 if codigo <> '' then begin
  CEP := ConsultarCEP.CEP;
  EdtCEP.Text := CEP;
  Cidade := ConsultarCEP.Cidade;
  EdtCidade.Text := Cidade;
  Estado := ConsultarCEP.Estado;
  EdtEstado.Text := Estado;
  Pais := ConsultarCEP.Pais;
  EdtPais.Text := Pais;
 end;
end;

procedure TCadEmpresa.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;
end.
