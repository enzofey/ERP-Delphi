unit Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons,
  ProdutoDataModule, ConsultarProdutoForm,
  LogDataModule,
  Cor, CorDataModule, ConsultarCorForm,
  FaixaTamanho, FaixaTamanhoDataModule, ConsultarFaixaForm,
  GlobalUnit,
  NCMDataModule, ConsultarNCMForm,
  UnidadeDataModule;

type
  TCadProduto = class(TForm)
    Panel1: TPanel;
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
    Grid: TDBGrid;
    lblFaixa: TLabel;
    EdtFaixaTamanho: TEdit;
    SBFaixa: TSpeedButton;
    EdtNCM: TEdit;
    lblNCM: TLabel;
    SBNCM: TSpeedButton;
    lblUniCom: TLabel;
    CBUniCom: TComboBox;
    lblUniVenda: TLabel;
    CBUniVenda: TComboBox;
    lblBrinde: TLabel;
    CBBrinde: TCheckBox;
    lblOrigem: TLabel;
    CBOrigem: TComboBox;
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
  private
  public
  end;

var
  CadProduto: TCadProduto;

implementation

{$R *.dfm}

procedure TCadProduto.FormShow(Sender: TObject);
begin
 CadCorModule.CorEstoque.SQL.Clear;
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

  CadUnidadeDataModule.ConsultarUnidade.SQL.Clear;
  CadUnidadeDataModule.ConsultarUnidade.SQL.Text :=
  'select unidade from cadunidade where ativo = :ativo';
  CadUnidadeDataModule.ConsultarUnidade.ParamByName('ativo').AsString := 'S';
  CadUnidadeDataModule.ConsultarUnidade.Open;

  CadUnidadeDataModule.ConsultarUnidade.First;
  while not CadUnidadeDataModule.ConsultarUnidade.Eof do
  begin
    CBUniCom.Items.Add(CadUnidadeDataModule.ConsultarUnidade.FieldByName('Unidade').AsString);
    CadUnidadeDataModule.ConsultarUnidade.Next;
  end;
end;

procedure TCadProduto.CBUniVendaDropDown(Sender: TObject);
begin
  CBUniVenda.Items.Clear;

  CadUnidadeDataModule.ConsultarUnidade.SQL.Clear;
  CadUnidadeDataModule.ConsultarUnidade.SQL.Text :=
  'select unidade from cadunidade where ativo = :ativo';
  CadUnidadeDataModule.ConsultarUnidade.ParamByName('ativo').AsString := 'S';
  CadUnidadeDataModule.ConsultarUnidade.Open;

  CadUnidadeDataModule.ConsultarUnidade.First;
  while not CadUnidadeDataModule.ConsultarUnidade.Eof do
  begin
    CBUniVenda.Items.Add(CadUnidadeDataModule.ConsultarUnidade.FieldByName('Unidade').AsString);
    CadUnidadeDataModule.ConsultarUnidade.Next;
  end;
end;

procedure TCadProduto.btnIncluirClick(Sender: TObject);
begin
  EdtCodigo.Clear;
  EdtDescricao.Clear;
  EdtFaixaTamanho.Clear;
  CadCorModule.CorEstoque.SQL.Clear;

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
 codigo:= EdtCodigo.Text;
 descricao:= EdtDescricao.Text;
 faixa := EdtFaixaTamanho.Text;
 if CBAtivo.Checked then ativo := 'S'
 else ativo := 'N';
 NCM := EdtNCM.Text;
 UniCom := CBUniCom.Text;
 UniVenda := CBUniVenda.Text;
 if CBOrigem.Text = '0 – Nacional' then origem := '0'
 else if CBOrigem.text = '1 – Estrangeira – Importação direta' then origem := '1'
 else if CBOrigem.text = '2 – Estrangeira – Adquirida no mercado interno' then origem := '2'
 else if CBOrigem.text = '3 – Nacional, mercadoria ou bem com conteúdo de importação acima de 40%' then origem := '3'
 else if CBOrigem.text = '4 – Nacional, conforme processos produtivos básicos (PPB)' then origem := '4'
 else if CBOrigem.text = '5 – Nacional, mercadoria ou bem com conteúdo de importação inferior ou igual a 40%' then origem := '5'
 else if CBOrigem.text = '6 – Estrangeira – Importação direta, sem similar nacional, conforme Resolução CAMEX' then origem := '6'
 else if CBOrigem.text = '7 – Estrangeira – Adquirida no mercado interno, sem similar nacional' then origem := '7'
 else if CBOrigem.text = '8 – Nacional, mercadoria ou bem com conteúdo de importação superior a 70%' then origem := '8';
 if CBBrinde.Checked then brinde := 'S' else brinde := 'N';

 if EdtCodigo.Text = '' then begin
 ShowMessage('Código não pode ser vazio!');
 end
 else begin

 if EdtDescricao.Text = '' then begin
 ShowMessage('Descrição não pode ser vazia!');
 end
 else begin

 if EdtFaixaTamanho.Text = '' then begin
 ShowMessage('Faixa de tamanho não pode ser vazia!');
 end
 else begin

 if EdtNCM.Text = '' then begin
 ShowMessage('NCM não pode ser vazia!');
 end
 else begin

 if CBOrigem.Text = '' then begin
 ShowMessage('Origem do produto não pode ser vazio!');
 end
 else begin

 if CBUniVenda.Text = '' then begin
 ShowMessage('Unidade de venda não pode ser vazia!');
 end
 else begin

 if CBUniCom.Text = '' then begin
 ShowMessage('Unidade de compra não pode ser vazia!');
 end
 else begin

  CadProdutoModule.SelectQuery.SQL.Clear;
  CadProdutoModule.SelectQuery.SQL.Text :=
  'SELECT * FROM cadproduto WHERE codigo=:codigo';
  CadProdutoModule.SelectQuery.ParamByName('codigo').AsString := codigo;
  CadProdutoModule.SelectQuery.Open;

  if NOT CadProdutoModule.SelectQuery.IsEmpty then begin
  showmessage('Produto já cadastrado!');
  end
  else begin
  CadProdutoModule.InsertQuery.SQL.Clear;
  CadProdutoModule.InsertQuery.SQL.Text :=
  'insert into cadproduto (codigo, descricao, ativo, faixa, NCM, UniCom, UniVenda, Brinde, Origem) ' +
  'values (:codigo, :descricao, :ativo, :faixa, :NCM, :UniCom, :UniVenda, :Brinde, :Origem)';
  CadProdutoModule.InsertQuery.ParamByName('codigo').AsString := codigo;
  CadProdutoModule.InsertQuery.ParamByName('descricao').AsString := descricao;
  CadProdutoModule.InsertQuery.ParamByName('ativo').AsString := ativo;
  CadProdutoModule.InsertQuery.ParamByName('faixa').AsString := faixa;
  CadProdutoModule.InsertQuery.ParamByName('NCM').AsString := NCM;
  CadProdutoModule.InsertQuery.ParamByName('UniVenda').AsString := UniVenda;
  CadProdutoModule.InsertQuery.ParamByName('UniCom').AsString := UniCom;
  CadProdutoModule.InsertQuery.ParamByName('Brinde').AsString := Brinde;
  CadProdutoModule.InsertQuery.ParamByName('Origem').AsString := Origem;

  LogModule.InserirLog.SQL.Clear;
  LogModule.InserirLog.SQL.Text :=
  'insert into logs (descricao, tela, data, emp_id, usuario) values (:descricao, :tela, :data, :emp_id, :usuario)';
  LogModule.InserirLog.ParamByName('tela').AsString := 'CadProduto';
  LogModule.InserirLog.ParamByName('data').AsDateTime := Now;
  LogModule.InserirLog.ParamByName('descricao').AsString :=
  'Inseriu o produto ' + descricao + ' no código ' + codigo + ' na faixa de tamanho ' + faixa + ' ativo ' + ativo + ' e no NCM ' + NCM;
  LogModule.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
  LogModule.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
  try
  CadProdutoModule.InsertQuery.ExecSQL;
  LogModule.InserirLog.ExecSQL;
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
  ShowMessage('Erro na gravação!');
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

procedure TCadProduto.btnAlterarClick(Sender: TObject);
begin
  if EdtCodigo.Text = '' then
  ShowMessage('Nenhum produto selecionado!')
  else begin
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
end;

procedure TCadProduto.btnGravarAlterarClick(Sender: TObject);
var codigo, descricao, ativo, NCM, faixa, UniCom, UniVenda, Brinde, Origem: string;
begin
 codigo:= EdtCodigo.Text;
 descricao:= EdtDescricao.Text;
 faixa := EdtFaixaTamanho.Text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';
 NCM := EdtNCM.Text;
 UniCom := CBUniCom.Text;
 UniVenda := CBUniVenda.Text;
 if CBOrigem.Text = '0 – Nacional' then origem := '0'
 else if CBOrigem.text = '1 – Estrangeira – Importação direta' then origem := '1'
 else if CBOrigem.text = '2 – Estrangeira – Adquirida no mercado interno' then origem := '2'
 else if CBOrigem.text = '3 – Nacional, mercadoria ou bem com conteúdo de importação acima de 40%' then origem := '3'
 else if CBOrigem.text = '4 – Nacional, conforme processos produtivos básicos (PPB)' then origem := '4'
 else if CBOrigem.text = '5 – Nacional, mercadoria ou bem com conteúdo de importação inferior ou igual a 40%' then origem := '5'
 else if CBOrigem.text = '6 – Estrangeira – Importação direta, sem similar nacional, conforme Resolução CAMEX' then origem := '6'
 else if CBOrigem.text = '7 – Estrangeira – Adquirida no mercado interno, sem similar nacional' then origem := '7'
 else if CBOrigem.text = '8 – Nacional, mercadoria ou bem com conteúdo de importação superior a 70%' then origem := '8';
 if CBBrinde.Checked then brinde := 'S' else brinde := 'N';

 if EdtCodigo.Text = '' then begin
 ShowMessage('Código não pode ser vazio!');
 end
 else begin

 if EdtDescricao.Text = '' then begin
 ShowMessage('Descrição não pode ser vazia!');
 end
 else begin

 if EdtFaixaTamanho.Text = '' then begin
 ShowMessage('Faixa de tamanho não pode ser vazia!');
 end
 else begin

 if EdtNCM.Text = '' then begin
 ShowMessage('NCM não pode ser vazia!');
 end
 else begin

 if CBOrigem.Text = '' then begin
 ShowMessage('Origem do produto não pode ser vazio!');
 end
 else begin

 if CBUniVenda.Text = '' then begin
 ShowMessage('Unidade de venda não pode ser vazia!');
 end
 else begin

 if CBUniCom.Text = '' then begin
 ShowMessage('Unidade de compra não pode ser vazia!');
 end
 else begin

  CadProdutoModule.UpdateQuery.SQL.Clear;
  CadProdutoModule.UpdateQuery.SQL.Text :=
  'update cadproduto set NCM = :NCM, faixa = :faixa, descricao = :descricao, ativo = :ativo, unicom = :unicom, univenda = :univenda, brinde = :brinde, ' +
  'origem = :origem where codigo = :codigo';
  CadProdutoModule.UpdateQuery.ParamByName('codigo').AsString := codigo;
  CadProdutoModule.UpdateQuery.ParamByName('descricao').AsString := descricao;
  CadProdutoModule.UpdateQuery.ParamByName('ativo').AsString := ativo;
  CadProdutoModule.UpdateQuery.ParamByName('faixa').AsString := faixa;
  CadProdutoModule.UpdateQuery.ParamByName('NCM').AsString := NCM;
  CadProdutoModule.UpdateQuery.ParamByName('UniVenda').AsString := UniVenda;
  CadProdutoModule.UpdateQuery.ParamByName('UniCom').AsString := UniCom;
  CadProdutoModule.UpdateQuery.ParamByName('Brinde').AsString := Brinde;
  CadProdutoModule.UpdateQuery.ParamByName('Origem').AsString := Origem;

  LogModule.InserirLog.SQL.Clear;
  LogModule.InserirLog.SQL.Text :=
  'insert into logs (descricao, tela, data, emp_id, usuario) values (:descricao, :tela, :data, :emp_id, :usuario)';
  LogModule.InserirLog.ParamByName('tela').AsString := 'CadProduto';
  LogModule.InserirLog.ParamByName('data').AsDatetime := Now;
  LogModule.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
  LogModule.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
  LogModule.InserirLog.ParamByName('descricao').AsString :=
  'Alterou o produto ' + descricao + ' no código ' + codigo + ' na faixa de tamanho ' + faixa + ' ativo ' + ativo + ' e no NCM ' + NCM;

  try
  CadProdutoModule.UpdateQuery.ExecSQL;
  LogModule.InserirLog.ExecSQL;
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
  ShowMessage('Erro na gravação!');
  end;
 end;
end;
end;
end;
end;
end;
end;
end;

procedure TCadProduto.btnDesistirClick(Sender: TObject);
begin
  CadCorModule.CorEstoque.SQL.Clear;

  EdtCodigo.Clear;
  EdtDescricao.Clear;
  EdtFaixaTamanho.Clear;
  EdtNCM.Clear;

  EdtCodigo.Enabled := False;
  EdtDescricao.Enabled := False;
  EdtFaixaTamanho.Enabled := False;
  EdtNCM.Enabled := False;

  SBFaixa.Enabled := False;
  SBNCM.Enabled := False;

  CBUniCom.Enabled := False;
  CBUniVenda.Enabled := False;
  CBBrinde.Enabled := False;
  CBOrigem.Enabled := False;
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
 if CBAtivo.Checked then ativo := 'S'
 else ativo := 'N';
 NCM := EdtNCM.Text;

 CadProdutoModule.SelectQuery.SQL.Clear;
 CadProdutoModule.SelectQuery.SQL.Text :=
 'SELECT * FROM CADPRODUTO WHERE CODIGO = :codigo';
 CadProdutoModule.SelectQuery.ParamByName('codigo').AsString := codigo;
 CadProdutoModule.SelectQuery.Open;

 if CadProdutoModule.SelectQuery.IsEmpty then begin
 ShowMessage('Produto não encontrado!')
 end
 else begin
  CadProdutoModule.DeleteQuery.SQL.Clear;
  CadProdutoModule.DeleteQuery.SQL.Text := 'delete from cadproduto where codigo = :codigo';
  CadProdutoModule.DeleteQuery.ParamByName('codigo').AsString := codigo;

  CadProdutoModule.DeleteProdMovQuery.SQL.CLear;
  CadProdutoModule.DeleteProdMovQuery.SQL.Text := 'delete from prodmov where codigo = :codigo';
  CadProdutoModule.DeleteProdMovQuery.ParamByName('codigo').AsString := codigo;

  CadProdutoModule.DeleteEstoqueQuery.SQL.CLear;
  CadProdutoModule.DeleteEstoqueQuery.SQL.Text := 'delete from estoque where codigo = :codigo';
  CadProdutoModule.DeleteEstoqueQuery.ParamByName('codigo').AsString := codigo;

  LogModule.InserirLog.SQL.Clear;
  LogModule.InserirLog.SQL.Text :=
  'insert into logs (descricao, tela, data, emp_id, usuario) values (:descricao, :tela, :data, :emp_id, :usuario)';
  LogModule.InserirLog.ParamByName('descricao').AsString :=
  'Deletou o produto ' + descricao + ' no código ' + codigo + ' na faixa de tamanho ' + faixa + ' ativo ' + ativo + ' e no NCM ' + NCM;
  LogModule.InserirLog.ParamByName('tela').AsString := 'CadProduto';
  LogModule.InserirLog.ParamByName('data').AsDatetime := Now;
  LogModule.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
  LogModule.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
  try
  CadProdutoModule.DeleteQuery.ExecSQL;
  CadProdutoModule.DeleteEstoqueQuery.ExecSQL;
  CadProdutoModule.DeleteProdMovQuery.ExecSQL;
  LogModule.InserirLog.ExecSQL;
  ShowMessage('Excluído com sucesso!');
  EdtCodigo.Clear;
  EdtDescricao.Clear;
  EdtFaixaTamanho.Clear;
  EdtNCM.Clear;
  CadCorModule.CorEstoque.SQL.Clear;
  except
  ShowMessage('Erro na gravação!');
  end;
 end;
end;

procedure TCadProduto.btnFecharClick(Sender: TObject);
begin
 FecharTela(sender);
end;

procedure TCadProduto.btnConsultarClick(Sender: TObject);
var codigo, descricao, ativo, faixa, NCM, UniCom, UniVenda, Brinde, Origem: string;
    I: integer;
begin
  CadProdutoModule.ConsultarProduto.SQL.Clear;
  CadProdutoModule.ConsultarProduto.SQL.Text :=
  'select * from cadproduto';
  CadProdutoModule.ConsultarProduto.Open;

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

    NCM := ConsultarProduto.NCM;
    EdtNCM.Text := NCM;

    UniCom := ConsultarProduto.UniCom;
    CBUniCom.Items.Add(UniCom);
    CBUniCom.ItemIndex := CBUniCom.Items.IndexOf(UniCom);

    UniVenda := ConsultarProduto.UniVenda;
    CBUniVenda.Items.Add(UniVenda);
    CBUniVenda.ItemIndex := CBUniVenda.Items.IndexOf(UniVenda);

    Brinde := ConsultarProduto.Brinde;
    CBBrinde.Checked := Brinde = 'S';

    if ConsultarProduto.Origem = '0' then origem := '0 – Nacional'
    else if ConsultarProduto.Origem = '1' then origem := '1 – Estrangeira – Importação direta'
    else if ConsultarProduto.Origem = '2' then origem := '2 – Estrangeira – Adquirida no mercado interno'
    else if ConsultarProduto.Origem = '3' then origem := '3 – Nacional, mercadoria ou bem com conteúdo de importação acima de 40%'
    else if ConsultarProduto.Origem = '4' then origem := '4 – Nacional, conforme processos produtivos básicos (PPB)'
    else if ConsultarProduto.Origem = '5' then origem := '5 – Nacional, mercadoria ou bem com conteúdo de importação inferior ou igual a 40%'
    else if ConsultarProduto.Origem = '6' then origem := '6 – Estrangeira – Importação direta, sem similar nacional, conforme Resolução CAMEX'
    else if ConsultarProduto.Origem = '7' then origem := '7 – Estrangeira – Adquirida no mercado interno, sem similar nacional'
    else if ConsultarProduto.Origem = '8' then origem := '8 – Nacional, mercadoria ou bem com conteúdo de importação superior a 70%';
    CBOrigem.Items.Add(Origem);
    CBOrigem.ItemIndex := CBOrigem.Items.IndexOf(Origem);
    end;

  begin
   for i := 0 to Grid.Columns.Count - 1 do
   Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
  end;
end;

procedure TCadProduto.SBFaixaClick(Sender: TObject);
var codigo: string;
begin
  Application.CreateForm(TConsultarFaixa, ConsultarFaixa);

  CadFaixaTamanhoDataModule.ConsultarFaixa.SQL.Clear;
  CadFaixaTamanhoDataModule.ConsultarFaixa.SQL.Text :=
  'select * from cadfaixa where ativo = :ativo';
  CadFaixaTamanhoDataModule.ConsultarFaixa.ParamByName('ativo').AsString := 'S';
  CadFaixaTamanhoDataModule.ConsultarFaixa.Open;
  codigo := ConsultarFaixa.SelecionarFaixa;
  if codigo <> '' then
  begin
    EdtFaixaTamanho.Text := codigo;
  end;
end;

procedure TCadProduto.SBNCMClick(Sender: TObject);
var NCM: String;
begin
  CadNCMDataModule.ConsultarNCM.SQL.Clear;
  CadNCMDataModule.ConsultarNCM.SQL.Text :=
  'select * from cadncm where ativo = :ativo';
  CadNCMDataModule.ConsultarNCM.ParamByName('ativo').AsString := 'S';
  CadNCMDataModule.ConsultarNCM.Open;
  Application.CreateForm(TConsultarNCM, ConsultarNCM);
  NCM := ConsultarNCM.SelecionarNCM;
  if NCM <> '' then
  begin
    EdtNCM.Text := NCM
  end;
end;
end.
