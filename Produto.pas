unit Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons,
  ProdutoDM, ConsultarProdutoForm,
  LogDM,
  Cor, CorDM, ConsultarCorForm,
  FaixaTamanho, FaixaTamanhoDM, ConsultarFaixaForm,
  GlobalUnit,
  NCMDM, ConsultarNCMForm,
  UnidadeDM;

type
  TCadProduto = class(TForm)
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    EdtDescricao: TEdit;
    edtCodigo: TEdit;
    LblAtivo: TLabel;
    CBAtivo: TCheckBox;
    btnIncluir: TButton;
    btnGravarIncluir: TButton;
    btnDesistir: TButton;
    btnAlterar: TButton;
    btnConsultar: TButton;
    btnExcluir: TButton;
    btnGravarAlterar: TButton;
    btnFechar: TButton;
    GridCorEstoque: TDBGrid;
    lblFaixa: TLabel;
    EdtFaixaTamanho: TEdit;
    lblUniCom: TLabel;
    CBUniCom: TComboBox;
    lblUniVenda: TLabel;
    CBUniVenda: TComboBox;
    lblBrinde: TLabel;
    CBBrinde: TCheckBox;
    EdtFaixaDescricao: TEdit;
    SBFaixa: TSpeedButton;
    Pages: TPageControl;
    CadastroPage: TTabSheet;
    TributacoesPage: TTabSheet;
    lblNCM: TLabel;
    EdtNCM: TEdit;
    EdtNCMNCM: TEdit;
    SBNCM: TSpeedButton;
    CBOrigem: TComboBox;
    lblOrigem: TLabel;
    AcessoPage: TTabSheet;
    lblAcessoCodigo: TLabel;
    lblAcessoUniCom: TLabel;
    lblAcessoUniVen: TLabel;
    lblAcessoFaixa: TLabel;
    EdtAcessoCodigo: TEdit;
    EdtAcessoDescricao: TEdit;
    SBAcessoConsProduto: TSpeedButton;
    CBAcessoUniCom: TComboBox;
    CBAcessoUniVenda: TComboBox;
    EdtAcessoFaixa: TEdit;
    EdtAcessoFaixaDescricao: TEdit;
    SBAcessoConsFaixa: TSpeedButton;
    CBAcessoOrigem: TComboBox;
    lblAcessoOrigem: TLabel;
    lblAcessoNCM: TLabel;
    EdtAcessoNCM: TEdit;
    EdtAcessoNCMNCM: TEdit;
    SBAcessoConsNCM: TSpeedButton;
    btnAcessoConsultar: TButton;
    btnAcessoFechar: TButton;
    RGAcessoAtivo: TRadioGroup;
    AcessoGrid: TDBGrid;
    RGAcessoBrinde: TRadioGroup;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnGravarIncluirClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure SBFaixaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SBNCMClick(Sender: TObject);
    procedure CBUniComDropDown(Sender: TObject);
    procedure CBUniVendaDropDown(Sender: TObject);
    procedure CBOrigemDropDown(Sender: TObject);
    procedure SBAcessoConsProdutoClick(Sender: TObject);
    procedure SBAcessoConsFaixaClick(Sender: TObject);
    procedure SBAcessoConsNCMClick(Sender: TObject);
    procedure btnAcessoConsultarClick(Sender: TObject);
    procedure EdtAcessoCodigoChange(Sender: TObject);
    procedure EdtAcessoFaixaChange(Sender: TObject);
    procedure EdtAcessoNCMChange(Sender: TObject);
    procedure EdtNCMChange(Sender: TObject);
    procedure EdtFaixaTamanhoChange(Sender: TObject);
    procedure CBAcessoOrigemDropDown(Sender: TObject);
  private
  public
  end;

var
  CadProduto: TCadProduto;

implementation

{$R *.dfm}

procedure TCadProduto.FormShow(Sender: TObject);
begin
 CadCorDM.qryCorEstoque.SQL.Clear;
end;

procedure TCadProduto.CBAcessoOrigemDropDown(Sender: TObject);
begin
 CBAcessoOrigem.Items.Clear;
 CBAcessoOrigem.Items.Add('0 – Nacional');
 CBAcessoOrigem.Items.Add('1 – Estrangeira – Importação direta');
 CBAcessoOrigem.Items.Add('2 – Estrangeira – Adquirida no mercado interno');
 CBAcessoOrigem.Items.Add('3 – Nacional, mercadoria ou bem com conteúdo de importação acima de 40%');
 CBAcessoOrigem.Items.Add('4 – Nacional, conforme processos produtivos básicos (PPB)');
 CBAcessoOrigem.Items.Add('5 – Nacional, mercadoria ou bem com conteúdo de importação inferior ou igual a 40%');
 CBAcessoOrigem.Items.Add('6 – Estrangeira – Importação direta, sem similar nacional, conforme Resolução CAMEX');
 CBAcessoOrigem.Items.Add('7 – Estrangeira – Adquirida no mercado interno, sem similar nacional');
 CBAcessoOrigem.Items.Add('8 – Nacional, mercadoria ou bem com conteúdo de importação superior a 70%');
end;

procedure TCadProduto.CBOrigemDropDown(Sender: TObject);
begin
 CBOrigem.Items.Clear;
 CBOrigem.Items.Add('0 – Nacional');
 CBOrigem.Items.Add('1 – Estrangeira – Importação direta');
 CBOrigem.Items.Add('2 – Estrangeira – Adquirida no mercado interno');
 CBOrigem.Items.Add('3 – Nacional, mercadoria ou bem com conteúdo de importação acima de 40%');
 CBOrigem.Items.Add('4 – Nacional, conforme processos produtivos básicos (PPB)');
 CBOrigem.Items.Add('5 – Nacional, mercadoria ou bem com conteúdo de importação inferior ou igual a 40%');
 CBOrigem.Items.Add('6 – Estrangeira – Importação direta, sem similar nacional, conforme Resolução CAMEX');
 CBOrigem.Items.Add('7 – Estrangeira – Adquirida no mercado interno, sem similar nacional');
 CBOrigem.Items.Add('8 – Nacional, mercadoria ou bem com conteúdo de importação superior a 70%');
end;

procedure TCadProduto.CBUniComDropDown(Sender: TObject);
begin
 CBUniCom.Items.Clear;
 CBAcessoUniCom.Items.Clear;

 with CadUnidadeDM.qryConsultarUnidade do
 begin
  SQL.Clear;
  SQL.Add('select unidade from cadunidade where ativo = :ativo');
  ParamByName('ativo').AsString := 'S';
  Open;

  First;
  while not Eof do
  begin
   CBUniCom.Items.Add(FieldByName('Unidade').AsString);
   CBAcessoUniCom.Items.Add(FieldByName('Unidade').AsString);
   Next;
  end;
 end;
end;

procedure TCadProduto.CBUniVendaDropDown(Sender: TObject);
begin
 CBUniVenda.Items.Clear;
 CBAcessoUniVenda.Items.Clear;

 with CadUnidadeDM.qryConsultarUnidade do
 begin
  SQL.Clear;
  SQL.Add('select unidade from cadunidade where ativo = :ativo');
  ParamByName('ativo').AsString := 'S';
  Open;

  First;
  while not Eof do
  begin
   CBUniVenda.Items.Add(FieldByName('Unidade').AsString);
   CBAcessoUniVenda.Items.Add(FieldByName('Unidade').AsString);
   Next;
  end;
 end;
end;

procedure TCadProduto.btnIncluirClick(Sender: TObject);
begin
 EdtCodigo.Clear;
 EdtDescricao.Clear;
 EdtFaixaTamanho.Clear;
 EdtFaixaDescricao.Clear;
 EdtNCM.Clear;
 EdtNCMNCM.Clear;
 CadCorDM.qryCorEstoque.SQL.Clear;

 EdtCodigo.Enabled := True;
 EdtDescricao.Enabled := True;
 EdtFaixaTamanho.Enabled := True;
 EdtNCM.Enabled := True;

 CBAtivo.Enabled := True;
 CBUniCom.Enabled := True;
 CBUniVenda.Enabled := True;
 CBBrinde.Enabled := True;
 CBOrigem.Enabled := True;

 SBNCM.Enabled := True;
 SBFaixa.Enabled := True;

 BtnIncluir.Visible := False;
 BtnAlterar.Visible := False;
 BtnGravarAlterar.Visible := False;
 BtnConsultar.Visible:= False;
 BtnExcluir.Visible := False;

 BtnGravarIncluir.Visible := True;
 BtnDesistir.Visible := True;
end;

procedure TCadProduto.btnGravarIncluirClick(Sender: TObject);
var codigo, descricao, ativo, faixa, NCM, UniCom, UniVenda, Brinde, Origem: string;
begin
 codigo := EdtCodigo.Text;
 descricao := EdtDescricao.Text;
 faixa := EdtFaixaTamanho.Text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';
 NCM := EdtNCM.Text;
 UniCom := CBUniCom.Text;
 UniVenda := CBUniVenda.Text;
 if CBOrigem.ItemIndex = 0 then origem := '0'
 else if CBOrigem.ItemIndex = 1 then origem := '1'
 else if CBOrigem.ItemIndex = 2 then origem := '2'
 else if CBOrigem.ItemIndex = 3 then origem := '3'
 else if CBOrigem.ItemIndex = 4 then origem := '4'
 else if CBOrigem.ItemIndex = 5 then origem := '5'
 else if CBOrigem.ItemIndex = 6 then origem := '6'
 else if CBOrigem.ItemIndex = 7 then origem := '7'
 else if CBOrigem.ItemIndex = 8 then origem := '8';
 if CBBrinde.Checked then brinde := 'S' else brinde := 'N';

 if codigo = '' then begin
  ShowMessage('Código não pode ser vazio!');
  Abort;
 end;

 if Descricao = '' then begin
  ShowMessage('Descrição não pode ser vazia!');
  Abort;
 end;

 if Faixa = '' then begin
  ShowMessage('Faixa de tamanho não pode ser vazia!');
  Abort;
 end;

 if EdtNCMNCM.Text = '' then begin
  ShowMessage('NCM não pode ser vazia!');
  Abort;
 end;

 if Origem = '' then begin
  ShowMessage('Origem do produto não pode ser vazio!');
  Abort;
 end;

 if UniVenda = '' then begin
  ShowMessage('Unidade de venda não pode ser vazia!');
  Abort;
 end;

 if UniCom = '' then begin
  ShowMessage('Unidade de compra não pode ser vazia!');
  Abort;
 end;

 with CadProdutoDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadproduto where codigo = :codigo');
  ParamByName('codigo').AsString := codigo;
  Open;

  if not IsEmpty then begin
  ShowMessage('Produto já cadastrado!');
  Abort;
  end;
 end;

 CadProdutoDM.Conexão.StartTransaction;
 try
  with CadProdutoDM.qryInsert do
  begin
   SQL.Clear;
   SQL.Add('insert into cadproduto (codigo, descricao, ativo, faixa, NCM, UniCom, UniVenda, Brinde, Origem)');
   SQL.Add('values');
   SQL.Add('(:codigo, :descricao, :ativo, :faixa, :NCM, :UniCom, :UniVenda, :Brinde, :Origem)');
   ParamByName('codigo').AsString := codigo;
   ParamByName('descricao').AsString := descricao;
   ParamByName('ativo').AsString := ativo;
   ParamByName('faixa').AsString := faixa;
   ParamByName('NCM').AsString := NCM;
   ParamByName('UniVenda').AsString := UniVenda;
   ParamByName('UniCom').AsString := UniCom;
   ParamByName('Brinde').AsString := Brinde;
   ParamByName('Origem').AsString := Origem;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
  SQL.Clear;
  SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
  SQL.Add('values');
  SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
  ParamByName('tela').AsString := 'CadProduto';
  ParamByName('data').AsDateTime := Now;
  ParamByName('descricao').AsString :=
  'Inseriu o produto ' + descricao + ' no código ' + codigo + ' na faixa de tamanho ' + faixa + ' ativo ' + ativo + ' e no NCM ' + NCM;
  ParamByName('usuario').AsString := UsuarioLogado;
  ParamByName('emp_id').AsString := EmpresaLogada;
  ExecSQL;
  end;

  CadProdutoDM.Conexão.Commit;
  ShowMessage('Incluido com sucesso!');
  BtnIncluir.Visible := True;
  BtnAlterar.Visible := True;
  BtnConsultar.Visible := True;
  BtnExcluir.Visible := True;

  BtnGravarIncluir.Visible := False;
  BtnDesistir.Visible := False;

  EdtCodigo.Enabled := False;
  EdtDescricao.Enabled := False;
  EdtFaixaTamanho.Enabled := False;
  EdtNCM.Enabled := False;

  CBAtivo.Enabled := False;
  CBUniCom.Enabled := False;
  CBUniVenda.Enabled := False;
  CBBrinde.Enabled := False;
  CBOrigem.Enabled := False;

  SBNCM.Enabled := False;
  SBFaixa.Enabled := False;
  except
  CadProdutoDM.Conexão.Rollback;
  ShowMessage('Erro na gravação!');
 end;
end;

procedure TCadProduto.btnAcessoConsultarClick(Sender: TObject);
var codigo, faixa, ncm, unicom, univen, origem, brinde, ativo: string;
    temwhere: boolean;
    i: integer;
begin
 codigo := EdtAcessoCodigo.Text;
 Faixa := EdtAcessoFaixa.Text;
 NCM := EdtAcessoNCM.Text;
 UniCom := CBAcessoUniCom.Text;
 UniVen := CBAcessoUniVenda.Text;
 if CBAcessoOrigem.ItemIndex = 0 then origem := '0'
 else if CBAcessoOrigem.ItemIndex = 1 then origem := '1'
 else if CBAcessoOrigem.ItemIndex = 2 then origem := '2'
 else if CBAcessoOrigem.ItemIndex = 3 then origem := '3'
 else if CBAcessoOrigem.ItemIndex = 4 then origem := '4'
 else if CBAcessoOrigem.ItemIndex = 5 then origem := '5'
 else if CBAcessoOrigem.ItemIndex = 6 then origem := '6'
 else if CBAcessoOrigem.ItemIndex = 7 then origem := '7'
 else if CBAcessoOrigem.ItemIndex = 8 then origem := '8';
 if RGAcessoBrinde.ItemIndex = 0 then brinde := 'S'
 else if RGAcessoBrinde.ItemIndex = 1 then brinde := 'N';

 if RGAcessoAtivo.ItemIndex = 0 then ativo := 'S'
 else if RGAcessoAtivo.ItemIndex = 1 then ativo := 'N';

 with CadProdutoDM.qryAcesso do
 begin
 SQL.Clear;
 SQL.Add('select * from cadproduto');
 temwhere := false;

  if brinde = 'S' then begin
   if temwhere then begin
    SQL.Add('and brinde = :brinde');
   end
   else begin
    SQL.Add('where brinde = :brinde');
    temwhere := true;
   end;
  ParamByName('brinde').AsString := brinde;
  end;

  if brinde = 'N' then begin
   if temwhere then begin
    SQL.Add('and brinde = :brinde');
   end
   else begin
    SQL.Add('where brinde = :brinde');
    temwhere := true;
   end;
  ParamByName('brinde').AsString := brinde;
  end;

  if ativo = 'S' then begin
   if temwhere then begin
    SQL.Add('and ativo = :ativo');
   end
   else begin
    SQL.Add('where ativo = :ativo');
    temwhere := true;
   end;
  ParamByName('ativo').AsString := ativo;
  end;

  if ativo = 'N' then begin
   if temwhere then begin
    SQL.Add('and ativo = :ativo');
   end
   else begin
    SQL.Add('where ativo = :ativo');
    temwhere := true;
   end;
  ParamByName('ativo').AsString := ativo;
  end;

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

  if faixa <> '' then begin
   if temwhere then begin
    SQL.Add('and faixa = :faixa');
   end
   else begin
    SQL.Add('where faixa = :faixa');
    temwhere := true;
   end;
  ParamByName('faixa').AsString := Faixa;
  end;

  if NCM <> '' then begin
   if temwhere then begin
    SQL.Add('and NCM = :NCM');
   end
   else begin
    SQL.Add('where NCM = :NCM');
    temwhere := true;
   end;
  ParamByName('NCM').AsString := NCM;
  end;

  if UniCom <> '' then begin
   if temwhere then begin
    SQL.Add('and UniCom = :UniCom');
   end
   else begin
    SQL.Add('where UniCom = :UniCom');
    temwhere := true;
   end;
  ParamByName('UniCom').AsString := UniCom;
  end;

  if UniVen <> '' then begin
   if temwhere then begin
    SQL.Add('and UniVenda = :UniVenda');
   end
   else begin
    SQL.Add('where UniVenda = :UniVenda');
    temwhere := true;
   end;
  ParamByName('UniVenda').AsString := UniVen;
  end;

  if origem <> '' then begin
   if temwhere then begin
    SQL.Add('and origem = :origem');
   end
   else begin
    SQL.Add('where origem = :origem');
    temwhere := true;
   end;
  ParamByName('origem').AsString := origem;
  end;

  Open;
  for i := 0 to AcessoGrid.Columns.Count - 1 do
  AcessoGrid.Columns[i].Width := AcessoGrid.Canvas.TextWidth(AcessoGrid.Columns[i].Title.Caption + '     ');
 end;
end;

procedure TCadProduto.btnAlterarClick(Sender: TObject);
begin
 if EdtCodigo.Text = '' then begin
  ShowMessage('Nenhum produto selecionado!');
  Abort;
 end;

 BtnIncluir.Visible := False;
 BtnGravarIncluir.Visible := False;
 BtnConsultar.Visible := False;
 BtnAlterar.Visible := False;
 BtnExcluir.Visible := False;

 BtnDesistir.Visible := True;
 BtnGravarAlterar.Visible := True;

 EdtDescricao.Enabled := True;
 EdtFaixaTamanho.Enabled := True;
 EdtNCM.Enabled := True;

 CBAtivo.Enabled := True;
 CBUniCom.Enabled := True;
 CBUniVenda.Enabled := True;
 CBBrinde.Enabled := True;
 CBOrigem.Enabled := True;

 SBNCM.Enabled := True;
 SBFaixa.Enabled := True;
end;

procedure TCadProduto.btnGravarAlterarClick(Sender: TObject);
var codigo, descricao, ativo, NCM, faixa, UniCom, UniVenda, Brinde, Origem: string;
begin
 codigo:= EdtCodigo.Text;
 descricao:= EdtDescricao.Text;
 faixa := EdtFaixaTamanho.Text;
 NCM := EdtNCM.Text;
 UniCom := CBUniCom.Text;
 UniVenda := CBUniVenda.Text;
 if CBOrigem.ItemIndex = 0 then origem := '0'
 else if CBOrigem.ItemIndex = 1 then origem := '1'
 else if CBOrigem.ItemIndex = 2 then origem := '2'
 else if CBOrigem.ItemIndex = 3 then origem := '3'
 else if CBOrigem.ItemIndex = 4 then origem := '4'
 else if CBOrigem.ItemIndex = 5 then origem := '5'
 else if CBOrigem.ItemIndex = 6 then origem := '6'
 else if CBOrigem.ItemIndex = 7 then origem := '7'
 else if CBOrigem.ItemIndex = 8 then origem := '8';
 if CBBrinde.Checked then brinde := 'S' else brinde := 'N';
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if codigo = '' then begin
  ShowMessage('Código não pode ser vazio!');
  Abort;
 end;

 if Descricao = '' then begin
  ShowMessage('Descrição não pode ser vazia!');
  Abort;
 end;

 if Faixa = '' then begin
  ShowMessage('Faixa de tamanho não pode ser vazia!');
  Abort;
 end;

 if EdtNCMNCM.Text = '' then begin
  ShowMessage('NCM não pode ser vazia!');
  Abort;
 end;

 if Origem = '' then begin
  ShowMessage('Origem do produto não pode ser vazio!');
  Abort;
 end;

 if UniVenda = '' then begin
  ShowMessage('Unidade de venda não pode ser vazia!');
  Abort;
 end;

 if UniCom = '' then begin
  ShowMessage('Unidade de compra não pode ser vazia!');
  Abort;
 end;

 CadProdutoDM.Conexão.StartTransaction;
 try
  with CadProdutoDM.qryUpdate do
  begin
   SQL.Clear;
   SQL.Add('update cadproduto set NCM = :NCM, faixa = :faixa, descricao = :descricao, ativo = :ativo, unicom = :unicom, univenda = :univenda,');
   SQL.Add('brinde = :brinde, origem = :origem where codigo = :codigo');
   ParamByName('codigo').AsString := codigo;
   ParamByName('descricao').AsString := descricao;
   ParamByName('ativo').AsString := ativo;
   ParamByName('faixa').AsString := faixa;
   ParamByName('NCM').AsString := NCM;
   ParamByName('UniVenda').AsString := UniVenda;
   ParamByName('UniCom').AsString := UniCom;
   ParamByName('Brinde').AsString := Brinde;
   ParamByName('Origem').AsString := Origem;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
   ParamByName('tela').AsString := 'CadProduto';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ParamByName('descricao').AsString :=
   'Alterou o produto ' + descricao + ' no código ' + codigo + ' na faixa de tamanho ' + faixa + ' ativo ' + ativo + ' e no NCM ' + NCM;
   ExecSQL;
  end;

  CadProdutoDM.Conexão.Commit;
  ShowMessage('Alterado com sucesso!');
  BtnIncluir.Visible := True;
  BtnAlterar.Visible := True;
  BtnConsultar.Visible := True;
  BtnExcluir.Visible := True;

  BtnGravarAlterar.Visible := False;
  BtnGravarIncluir.Visible := False;
  BtnDesistir.Visible := False;

  EdtCodigo.Enabled := False;
  EdtDescricao.Enabled := False;
  EdtFaixaTamanho.Enabled := False;
  EdtNCM.Enabled := False;

  CBAtivo.Enabled := False;
  CBUniCom.Enabled := False;
  CBUniVenda.Enabled := False;
  CBBrinde.Enabled := False;
  CBOrigem.Enabled := False;

  SBFaixa.Enabled := False;
  SBNCM.Enabled := False;
  except
  CadProdutoDM.Conexão.Rollback;
  ShowMessage('Erro na gravação!');
 end;
end;

procedure TCadProduto.btnDesistirClick(Sender: TObject);
begin
 CadCorDM.qryCorEstoque.SQL.Clear;

 EdtCodigo.Clear;
 EdtDescricao.Clear;
 EdtNCM.Clear;
 EdtNCMNCM.Clear;
 EdtFaixaTamanho.Clear;
 EdtFaixaDescricao.Clear;

 EdtCodigo.Enabled := False;
 EdtDescricao.Enabled := False;
 EdtFaixaTamanho.Enabled := False;
 EdtNCM.Enabled := False;

 SBFaixa.Enabled := False;
 SBNCM.Enabled := False;

 CBUniCom.Enabled := False;
 CBUniCom.Items.Clear;
 CBUniVenda.Enabled := False;
 CBUniVenda.Items.Clear;
 CBBrinde.Enabled := False;
 CBOrigem.Enabled := False;
 CBOrigem.Items.Clear;
 CBAtivo.Enabled := False;

 BtnGravarIncluir.Visible := False;
 BtnDesistir.Visible := False;
 BtnGravarAlterar.Visible := False;

 BtnIncluir.Visible := True;
 BtnAlterar.Visible := True;
 BtnConsultar.Visible := True;
 BtnExcluir.Visible := True;
end;

procedure TCadProduto.btnExcluirClick(Sender: TObject);
var codigo, descricao, faixa, ativo, NCM, UniCom, UniVenda, Brinde, Origem: string;
begin
 codigo:= EdtCodigo.Text;
 faixa := EdtFaixaTamanho.text;
 descricao := EdtDescricao.text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';
 NCM := EdtNCM.Text;

 if EdtCodigo.Text = '' then begin
  ShowMessage('Nenhum produto selecionado!');
  Abort;
 end;

 with CadProdutoDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadproduto where codigo = :codigo');
  ParamByName('codigo').AsString := codigo;
  Open;

  if IsEmpty then begin
  ShowMessage('Produto não encontrado!');
  Abort;
  end;
 end;

 CadProdutoDM.Conexão.StartTransaction;
 try
  with CadProdutoDM.qryDelete do
  begin
   SQL.Clear;
   SQL.Add('delete from cadproduto where codigo = :codigo');
   ParamByName('codigo').AsString := codigo;
   ExecSQL;
  end;

  With LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
   ParamByName('descricao').AsString :=
   'Deletou o produto ' + descricao + ' no código ' + codigo;
   ParamByName('tela').AsString := 'CadProduto';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  with CadProdutoDM.qryDeleteProdMov do
  begin
   SQL.CLear;
   SQL.Add('delete from prodmov where codigo = :codigo');
   ParamByName('codigo').AsString := codigo;
   ExecSQL;
  end;

  With LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
   ParamByName('descricao').AsString :=
   'Deletou as movimentações do produto ' + descricao + ' no código ' + codigo;
   ParamByName('tela').AsString := 'CadProduto';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  with CadProdutoDM.qryDeleteEstoque do
  begin
   SQL.CLear;
   SQL.Add('delete from estoque where codigo = :codigo');
   ParamByName('codigo').AsString := codigo;
   ExecSQL;
  end;

  With LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
   ParamByName('descricao').AsString :=
   'Deletou do estoque os registros do produto ' + descricao + ' no código ' + codigo;
   ParamByName('tela').AsString := 'CadProduto';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadProdutoDM.Conexão.Commit;
  ShowMessage('Excluído com sucesso!');
  EdtCodigo.Clear;
  EdtDescricao.Clear;
  EdtFaixaTamanho.Clear;
  EdtNCM.Clear;
  CBUniVenda.Items.Clear;
  CBUniCom.Items.Clear;
  CBOrigem.Items.Clear;
  CadCorDM.qryCorEstoque.SQL.Clear;
  except
  CadProdutoDM.Conexão.Rollback;
  ShowMessage('Erro na gravação!');
 end;
end;

procedure TCadProduto.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;

procedure TCadProduto.btnConsultarClick(Sender: TObject);
var codigo, descricao, ativo, faixa, faixadescricao, NCM, ncmdescricao, UniCom, UniVenda, Brinde, Origem: string;
    I: integer;
begin
 with CadProdutoDM.qryConsultarProduto do
 begin
  SQL.Clear;
  SQL.Add('select cp.codigo, cp.descricao, cp.ativo, cp.faixa, cf.descricao as faixa_descricao, cp.ncm, cn.ncm as ncm_ncm, cp.unicom,');
  SQL.Add('cp.univenda, cp.brinde, cp.origem');
  SQL.Add('from cadproduto cp');
  SQL.Add('inner join cadncm cn on (cn.codigo = cp.ncm)');
  SQL.Add('inner join cadfaixa cf on (cf.codigo = cp.faixa)');
  Open;

  Application.CreateForm(TConsultarProduto, ConsultarProduto);
  codigo := ConsultarProduto.SelecionarProduto;
   if codigo <> '' then begin
    EdtCodigo.Text := codigo;

    descricao := ConsultarProduto.Descricao;
    EdtDescricao.Text := descricao;

    ativo := ConsultarProduto.Ativo;
    CBAtivo.Checked := ativo = 'S';

    faixa := ConsultarProduto.Faixa;
    EdtFaixaTamanho.Text := faixa;
    EdtFaixaDescricao.Text := FieldByName('faixa_descricao').AsString;

    NCM := ConsultarProduto.NCM;
    EdtNCM.Text := NCM;
    EdtNCMNCM.Text := FieldByName('ncm_ncm').AsString;

    UniCom := ConsultarProduto.UniCom;
    CBUniCom.Items.Add(UniCom);
    CBUniCom.ItemIndex := CBUniCom.Items.IndexOf(UniCom);

    UniVenda := ConsultarProduto.UniVenda;
    CBUniVenda.Items.Add(UniVenda);
    CBUniVenda.ItemIndex := CBUniVenda.Items.IndexOf(UniVenda);

    Brinde := ConsultarProduto.Brinde;
    CBBrinde.Checked := Brinde = 'S';

    CBOrigem.Items.Clear;
    CBOrigem.Items.Add('0 – Nacional');
    CBOrigem.Items.Add('1 – Estrangeira – Importação direta');
    CBOrigem.Items.Add('2 – Estrangeira – Adquirida no mercado interno');
    CBOrigem.Items.Add('3 – Nacional, mercadoria ou bem com conteúdo de importação acima de 40%');
    CBOrigem.Items.Add('4 – Nacional, conforme processos produtivos básicos (PPB)');
    CBOrigem.Items.Add('5 – Nacional, mercadoria ou bem com conteúdo de importação inferior ou igual a 40%');
    CBOrigem.Items.Add('6 – Estrangeira – Importação direta, sem similar nacional, conforme Resolução CAMEX');
    CBOrigem.Items.Add('7 – Estrangeira – Adquirida no mercado interno, sem similar nacional');
    CBOrigem.Items.Add('8 – Nacional, mercadoria ou bem com conteúdo de importação superior a 70%');

    if ConsultarProduto.Origem = '0' then CBOrigem.ItemIndex := 0
    else if ConsultarProduto.Origem = '1' then CBOrigem.ItemIndex := 1
    else if ConsultarProduto.Origem = '2' then CBOrigem.ItemIndex := 2
    else if ConsultarProduto.Origem = '3' then CBOrigem.ItemIndex := 3
    else if ConsultarProduto.Origem = '4' then CBOrigem.ItemIndex := 4
    else if ConsultarProduto.Origem = '5' then CBOrigem.ItemIndex := 5
    else if ConsultarProduto.Origem = '6' then CBOrigem.ItemIndex := 6
    else if ConsultarProduto.Origem = '7' then CBOrigem.ItemIndex := 7
    else if ConsultarProduto.Origem = '8' then CBOrigem.ItemIndex := 8
   end;
   for i := 0 to GridCorEstoque.Columns.Count - 1 do
   GridCorEstoque.Columns[i].Width := GridCorEstoque.Canvas.TextWidth(GridCorEstoque.Columns[i].Title.Caption + '     ');
 end;
end;

procedure TCadProduto.SBAcessoConsFaixaClick(Sender: TObject);
var codigo, descricao: string;
begin
 with CadFaixaTamanhoDM.qryConsultarFaixa do
 begin
  SQL.Clear;
  SQL.Add('select * from cadfaixa');
  Open;
 end;

 Application.CreateForm(TConsultarFaixa, ConsultarFaixa);
 codigo := ConsultarFaixa.SelecionarFaixa;
 descricao := ConsultarFaixa.descricao;
 if codigo <> '' then begin
  EdtAcessoFaixa.Text := codigo;
  EdtAcessoFaixaDescricao.Text := Descricao;
 end;
end;

procedure TCadProduto.SBAcessoConsNCMClick(Sender: TObject);
var codigo, NCM: String;
begin
 with CadNCMDM.qryConsultarNCM do
 begin
  SQL.Clear;
  SQL.Add('select * from cadncm');
  Open;
 end;

 Application.CreateForm(TConsultarNCM, ConsultarNCM);
 codigo := ConsultarNCM.SelecionarNCM;
 if codigo <> '' then begin
  EdtAcessoNCM.Text := codigo;
  NCM := ConsultarNCM.NCM;
  EdtAcessoNCMNCM.Text := NCM;
 end;
end;

procedure TCadProduto.SBAcessoConsProdutoClick(Sender: TObject);
var codigo, descricao: string;
begin
 with CadProdutoDM.qryConsultarProduto do
 begin
  SQL.Clear;
  SQL.Add('select * from cadproduto');
  Open;
 end;

 Application.CreateForm(TConsultarProduto, ConsultarProduto);
 codigo := ConsultarProduto.SelecionarProduto;
 if codigo <> '' then begin
  EdtAcessoCodigo.Text := codigo;
  descricao := ConsultarProduto.Descricao;
  EdtAcessoDescricao.Text := descricao;
 end;
end;

procedure TCadProduto.SBFaixaClick(Sender: TObject);
var codigo, descricao: string;
begin
 with CadFaixaTamanhoDM.qryConsultarFaixa do
 begin
  SQL.Clear;
  SQL.Add('select * from cadfaixa where ativo = :ativo');
  ParamByName('ativo').AsString := 'S';
  Open;
 end;

 Application.CreateForm(TConsultarFaixa, ConsultarFaixa);
 codigo := ConsultarFaixa.SelecionarFaixa;
 descricao := ConsultarFaixa.descricao;
 if codigo <> '' then begin
  EdtFaixaTamanho.Text := codigo;
  EdtFaixaDescricao.Text := Descricao;
 end;
end;

procedure TCadProduto.SBNCMClick(Sender: TObject);
var codigo, NCM: String;
begin
 with CadNCMDM.qryConsultarNCM do
 begin
  SQL.Clear;
  SQL.Add('select * from cadncm where ativo = :ativo');
  ParamByName('ativo').AsString := 'S';
  Open;
 end;

 Application.CreateForm(TConsultarNCM, ConsultarNCM);
 codigo := ConsultarNCM.SelecionarNCM;
 if codigo <> '' then begin
  EdtNCM.Text := codigo;
  NCM := ConsultarNCM.NCM;
  EdtNCMNCM.Text := NCM;
 end;
end;

procedure TCadProduto.EdtAcessoCodigoChange(Sender: TObject);
var codigo, descricao: string;
begin
 codigo := EdtAcessoCodigo.Text;

 with CadProdutoDM.qryConsultarProduto do
 begin
  SQL.Clear;
  SQL.Add('select * from cadproduto where codigo = :codigo');
  ParamByName('codigo').AsString := codigo;
  Open;

 EdtAcessoDescricao.Text := FieldByName('descricao').AsString;
 end;
end;

procedure TCadProduto.EdtAcessoFaixaChange(Sender: TObject);
var codigo, descricao: string;
begin
 codigo := EdtAcessoFaixa.Text;

 with CadFaixaTamanhoDM.qryConsultarFaixa do
 begin
  SQL.Clear;
  SQL.Add('select * from cadfaixa where codigo = :codigo');
  ParamByName('codigo').AsString := codigo;
  Open;

 EdtAcessoFaixaDescricao.Text := FieldByName('descricao').AsString;
 end;
end;

procedure TCadProduto.EdtAcessoNCMChange(Sender: TObject);
var codigo, descricao: String;
begin
 codigo := EdtAcessoNCM.Text;

 with CadNCMDM.qryConsultarNCM do
 begin
  SQL.Clear;
  SQL.Add('select * from cadncm where codigo = :codigo');
  ParamByName('codigo').AsString := codigo;
  Open;

  EdtAcessoNCMNCM.Text := FieldByName('NCM').AsString;
 end;
end;

procedure TCadProduto.EdtFaixaTamanhoChange(Sender: TObject);
var codigo, descricao: string;
begin
 codigo := EdtFaixaTamanho.Text;

 with CadFaixaTamanhoDM.qryConsultarFaixa do
 begin
  SQL.Clear;
  SQL.Add('select * from cadfaixa where codigo = :codigo');
  ParamByName('codigo').AsString := codigo;
  Open;

 EdtFaixaDescricao.Text := FieldByName('descricao').AsString;
 end;
end;

procedure TCadProduto.EdtNCMChange(Sender: TObject);
var codigo, descricao: String;
begin
 codigo := EdtNCM.Text;

 with CadNCMDM.qryConsultarNCM do
 begin
  SQL.Clear;
  SQL.Add('select * from cadncm where codigo = :codigo');
  ParamByName('codigo').AsString := codigo;
  Open;

  EdtNCMNCM.Text := FieldByName('NCM').AsString;
 end;
end;
end.
