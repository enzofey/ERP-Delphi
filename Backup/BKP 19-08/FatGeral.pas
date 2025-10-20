unit FatGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.Grids, Data.DB, Vcl.DBGrids,
  ConsultarNaturezaForm, NaturezaDataModule,
  ConsultarProdutoForm, ProdutoDataModule,
  ConsultarCorForm, CorDataModule,
  ConsultarDepositoForm, DepositoDataModule,
  ConsultarTamanhoForm, TamanhoDataModule,
  ConsultarEntidadeForm, EntidadeDataModule,
  ConsultarCSTICMSForm, CSTICMSDataModule,
  ConsultarCSOSNForm, CSOSNDataModule,
  ConsultarCSTIPIForm, CSTIPIDataModule,
  ConsultarENQIPIForm, ENQIPIDataModule,
  ConsultarCSTPISForm, CSTPISDataModule,
  ConsultarCSTCOFINSForm, CSTCOFINSDataModule,
  GeralDataModule,
  Log, LogDataModule,
  GlobalUnit;

type
  TFatGeralForm = class(TForm)
    Panel1: TPanel;
    lblCliente: TLabel;
    lblSerie: TLabel;
    EdtEntidade: TEdit;
    lblNatureza: TLabel;
    lbldtEmissão: TLabel;
    lbldtSaida: TLabel;
    DTEmissao: TDateTimePicker;
    DTSaida: TDateTimePicker;
    EdtSerie: TEdit;
    EdtNatureza: TEdit;
    SBNatureza: TSpeedButton;
    btnIncluir: TButton;
    btnGravar: TButton;
    btnDesistir: TButton;
    btnFechar: TButton;
    lblValFrete: TLabel;
    EdtValFrete: TEdit;
    lblDesconto: TLabel;
    EdtValDesconto: TEdit;
    NIGrid: TStringGrid;
    SBEntidade: TSpeedButton;
    Totais: TGroupBox;
    lblValor_Total: TLabel;
    edtValor_total: TEdit;
    EdtValor_Base_ICMS: TEdit;
    lblValor_base_icms: TLabel;
    lblValor_ICMS: TLabel;
    edtValor_ICMS: TEdit;
    edtValor_Base_IPI: TEdit;
    lblValor_Base_IPI: TLabel;
    EdtValor_IPI: TEdit;
    lblValor_IPI: TLabel;
    lblValor_Base_PIS: TLabel;
    lblValor_PIS: TLabel;
    lblValor_Base_Cofins: TLabel;
    lblValor_COFINS: TLabel;
    EdtValor_base_PIS: TEdit;
    EdtValor_PIS: TEdit;
    edtvalor_base_cofins: TEdit;
    EdtValor_COFINS: TEdit;
    lblValor_Produtos: TLabel;
    EdtValor_Produtos: TEdit;
    lblQuantidade: TLabel;
    EdtQuantidade: TEdit;
    EdtDadosAdicionais: TEdit;
    RBDadosAdicionais: TRadioGroup;
    lblModFrete: TLabel;
    CBPresenca: TComboBox;
    CBmodFrete: TComboBox;
    lblPresenca: TLabel;
    lblPeso: TLabel;
    lblPesoL: TLabel;
    lblEspecie: TLabel;
    EdtEspecie: TEdit;
    EdtPesoL: TEdit;
    EdtPesoB: TEdit;
    lblVolumes: TLabel;
    EdtVolumes: TEdit;
    procedure FormShow(Sender: TObject);
    procedure EdtValFreteExit(Sender: TObject);
    procedure NIGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtValDescontoExit(Sender: TObject);
    procedure SBNaturezaClick(Sender: TObject);
    procedure SBEntidadeClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FatGeralForm: TFatGeralForm;

implementation

{$R *.dfm}

procedure TFatGeralForm.btnIncluirClick(Sender: TObject);
begin
 EdtEntidade.Enabled := True;
 EdtNatureza.Enabled := True;
 EdtSerie.Enabled := True;
 EdtValDesconto.Enabled := True;
 EdtValFrete.Enabled := True;
 NIGrid.Enabled := True;
 DTEmissao.Enabled := True;
 DtSaida.Enabled := True;
 EdtDadosAdicionais.Enabled := True;
 EdtEspecie.Enabled := True;
 EdtVolumes.Enabled := True;
 EdtPesoB.Enabled := True;
 EdtPesoL.Enabled := True;
 CBPresenca.Enabled := True;
 CBmodFrete.Enabled := True;

 NIGrid.RowCount := 2;

 SBEntidade.Enabled := True;
 SBNatureza.Enabled := True;

 BtnGravar.Visible := True;
 BtnDesistir.Visible := True;
 btnIncluir.Visible := False;
end;

procedure TFatGeralForm.btnDesistirClick(Sender: TObject);
begin
 EdtEntidade.Enabled := False;
 EdtNatureza.Enabled := False;
 EdtSerie.Enabled := False;
 EdtValDesconto.Enabled := False;
 EdtValFrete.Enabled := False;
 NIGrid.Enabled := False;
 DTEmissao.Enabled := False;
 DtSaida.Enabled := False;
 EdtDadosAdicionais.Enabled := True;
 EdtEspecie.Enabled := True;
 EdtVolumes.Enabled := True;
 EdtPesoB.Enabled := True;
 EdtPesoL.Enabled := True;
 CBPresenca.Enabled := True;
 CBmodFrete.Enabled := True;

 EdtEntidade.Clear;
 EdtNatureza.Clear;
 EdtSerie.Clear;
 EdtValDesconto.Clear;
 EdtValFrete.Clear;
 EdtDadosAdicionais.Clear;
 EdtEspecie.Clear;
 EdtVolumes.Clear;
 EdtPesoB.Clear;
 EdtPesoL.Clear;

 NIGrid.Enabled := False;
 NIGrid.RowCount := 1;

 SBEntidade.Enabled := False;
 SBNatureza.Enabled := False;

 BtnGravar.Visible := False;
 BtnDesistir.Visible := False;
 btnIncluir.Visible := Visible;
end;

procedure TFatGeralForm.btnFecharClick(Sender: TObject);
begin
 FecharTela(Sender);
end;

procedure TFatGeralForm.btnGravarClick(Sender: TObject);
var
  Produto, Cor, Tamanho, Deposito, Lote, Natureza, CST_ICMS, CSOSN, CST_IPI,
  ENQ_IPI, CST_PIS, CST_COFINS, cBenef, cCredPres, serie, entidade, dados_adicionais,
  especie, volumes, pesob, pesol, presenca, modfrete: string;
  Qtde, Preco_Uni, Valor, ALIQ_ICMS, Base_ICMS, Val_ICMS, ALIQ_IPI, Base_IPI, Val_IPI,
  ALIQ_COFINS, Base_COFINS, Val_COFINS, ALIQ_PIS, Base_PIS, Val_PIS, Val_Desconto,
  Val_Frete, valor_produtos, valor_total, valor_icms, valor_base_icms, valor_ipi,
  valor_base_ipi, valor_cofins, valor_base_cofins, valor_pis, valor_base_pis,
  quantidade, aliq_icms_nota, aliq_ipi_nota, aliq_pis_nota, aliq_cofins_nota: Double;
  i: Integer;
begin
  if EdtEntidade.Text = '' then
  begin
    ShowMessage('Cliente não pode ser vazio!');
    Exit;
  end;

  if EdtNatureza.Text = '' then
  begin
    ShowMessage('Natureza não pode ser vazia!');
    Exit;
  end;

  if EdtSerie.Text = '' then
  begin
    ShowMessage('Série não pode ser vazio!');
    Exit;
  end;

  if CBPresenca.Text = '' then
  begin
    ShowMessage('Presença precisa ser informada!');
    Exit;
  end;

  if CBmodFrete.Text = '' then
  begin
    ShowMessage('Frete precisa ser informado!');
    Exit;
  end;

  if EdtPesoB.Text = '' then EdtPesoB.Text := '0';
  if EdtPesoL.Text = '' then EdtPesoL.Text := '0';
  if EdtVolumes.Text = '' then EdtVolumes.Text := '0';
  if EdtEspecie.Text = '' then EdtEspecie.Text := '0';

  if CBPresenca.Text = '0 - Não se aplica (por exemplo, emissão de NF-e de ajuste)' then presenca := '0'
  else if CBPresenca.Text = '1 - Operação presencial' then presenca := '1'
  else if CBPresenca.Text = '2 - Operação não presencial, pela internet' then presenca := '2'
  else if CBPresenca.Text = '3 - Operação não presencial, teleatendimento' then presenca := '3'
  else if CBPresenca.Text = '5 - Operação presencial, fora do estabelecimento' then presenca := '5'
  else presenca := '9';

  if CBmodFrete.Text = '0 - Contratação do frete por conta do remetente (CIF)' then modfrete := '0'
  else if CBmodFrete.Text = '1 - Contratação do frete por conta do destinatário/remetente (FOB)' then modfrete := '1'
  else if CBmodFrete.Text = '2 - Contratação do frete por conta de terceiros' then modfrete := '2'
  else if CBmodFrete.Text = '3 - Sem frete' then modfrete := '3'
  else if CBmodFrete.Text = '4 - Contratação do transporte por conta do remetente (para venda à ordem/entrega futura)' then modfrete := '4'
  else modfrete := '9';

  serie := EdtSerie.Text;
  entidade := EdtEntidade.Text;
  dados_adicionais := EdtDadosAdicionais.Text;
  especie := EdtEspecie.Text;
  volumes := EdtVolumes.Text;
  pesob := EdtPesoB.Text;
  pesol := EdtPesoL.Text;

  FatGeralDataModule.Conexão.StartTransaction;
  try
    valor_produtos := 0;
    valor_icms := 0;
    valor_base_icms := 0;
    valor_ipi := 0;
    valor_base_ipi := 0;
    valor_cofins := 0;
    valor_base_cofins := 0;
    valor_pis := 0;
    valor_base_pis := 0;
    valor_total := 0;
    quantidade := 0;

    for i := 1 to NIGrid.RowCount - 1 do
    begin
      Produto := NIGrid.Cells[0, i];
      Cor := NIGrid.Cells[1, i];
      Tamanho := NIGrid.Cells[2, i];
      Deposito := NIGrid.Cells[3, i];
      Lote := NIGrid.Cells[4, i];
      Qtde := StrToFloatDef(NIGrid.Cells[5, i], 0);
      Preco_Uni := StrToFloatDef(NIGrid.Cells[6, i], 0);
      Natureza := NIGrid.Cells[8, i];
      CST_ICMS := NIGrid.Cells[9, i];
      CSOSN := NIGrid.Cells[10, i];
      CST_IPI := NIGrid.Cells[14, i];
      ENQ_IPI := NIGrid.Cells[15, i];
      CST_PIS := NIGrid.Cells[19, i];
      CST_COFINS := NIGrid.Cells[23, i];
      cBenef := NIGrid.Cells[29, i];
      cCredPres := NIGrid.Cells[30, i];
      ALIQ_ICMS := StrToFloatDef(NIGrid.Cells[11, i], 0);
      ALIQ_PIS := StrToFloatDef(NIGrid.Cells[20, i], 0);
      ALIQ_IPI := StrToFloatDef(NIGrid.Cells[16, i], 0);
      ALIQ_COFINS := StrToFloatDef(NIGrid.Cells[24, i], 0);
      aliq_icms_nota := ALIQ_ICMS;
      aliq_ipi_nota := ALIQ_IPI;
      aliq_pis_nota := ALIQ_PIS;
      aliq_cofins_nota := ALIQ_COFINS;
      Val_Desconto := StrToFloatDef(NIGrid.Cells[27, i], 0);
      Val_Frete := StrToFloatDef(NIGrid.Cells[28, i], 0);

      Base_ICMS := ((Qtde * Preco_Uni) - Val_Desconto + Val_Frete);
      Val_ICMS := Base_ICMS * (ALIQ_ICMS / 100);
      Base_IPI := ((Qtde * Preco_Uni) - Val_Desconto + Val_Frete + Val_ICMS);
      Val_IPI := Base_IPI * (ALIQ_IPI / 100);
      Base_PIS := ((Qtde * Preco_Uni) - Val_Desconto + Val_Frete);
      Val_PIS := Base_PIS * (ALIQ_PIS / 100);
      Base_COFINS := ((Qtde * Preco_Uni) - Val_Desconto + Val_Frete);
      Val_COFINS := Base_COFINS * (ALIQ_COFINS / 100);
      Valor := ((Qtde * Preco_Uni) - Val_Desconto);

      valor_produtos := valor_produtos + Valor;
      valor_icms := valor_icms + Val_ICMS;
      valor_base_icms := valor_base_icms + Base_ICMS;
      valor_ipi := valor_ipi + Val_IPI;
      valor_base_ipi := valor_base_ipi + Base_IPI;
      valor_cofins := valor_cofins + Val_COFINS;
      valor_base_cofins := valor_base_cofins + Base_COFINS;
      valor_pis := valor_pis + Val_PIS;
      valor_base_pis := valor_base_pis + Base_PIS;
      quantidade := quantidade + Qtde;

      FatGeralDataModule.SelectQuery.SQL.Clear;
      FatGeralDataModule.SelectQuery.SQL.Text :=
        'SELECT qtde FROM estoque WHERE codigo = :codigo AND cor = :cor ' +
        'AND tamanho = :tamanho AND deposito = :deposito AND lote = :lote ' +
        'AND qtde >= :qtde';
      FatGeralDataModule.SelectQuery.ParamByName('codigo').AsString := Produto;
      FatGeralDataModule.SelectQuery.ParamByName('cor').AsString := Cor;
      FatGeralDataModule.SelectQuery.ParamByName('tamanho').AsString := Tamanho;
      FatGeralDataModule.SelectQuery.ParamByName('deposito').AsString := Deposito;
      FatGeralDataModule.SelectQuery.ParamByName('lote').AsString := Lote;
      FatGeralDataModule.SelectQuery.ParamByName('qtde').AsFloat := Qtde;
      FatGeralDataModule.SelectQuery.Open;

      if FatGeralDataModule.SelectQuery.IsEmpty then
      begin
        ShowMessage('Sem quantidades disponíveis no estoque para o produto: ' +
          Produto + ' na cor: ' + Cor + ' no tamanho: ' + Tamanho +
          ' no lote: ' + Lote + ' no depósito: ' + Deposito);
        Exit;
      end;

      FatGeralDataModule.InsertNOTAITEN.SQL.Text :=
        'INSERT INTO notaiten (EMP_ID, Serie, Codigo, Cor, Tam, Deposito, Lote, ' +
        'Natureza, CST_ICMS, CSOSN, CST_IPI, ENQ_IPI, CST_PIS, CST_COFINS, cBenef, ' +
        'cCredPres, Qtde, Preco_Uni, Valor, ALIQ_ICMS, Val_Base_ICMS, Val_ICMS, ' +
        'ALIQ_IPI, Val_Base_IPI, Val_IPI, ALIQ_COFINS, Val_Base_COFINS, Val_COFINS, ' +
        'ALIQ_PIS, Val_Base_PIS, Val_PIS, Val_Desconto, Val_Frete) VALUES ' +
        '(:EMP_ID, :Serie, :Codigo, :Cor, :Tam, :Deposito, :Lote, :Natureza, ' +
        ':CST_ICMS, :CSOSN, :CST_IPI, :ENQ_IPI, :CST_PIS, :CST_COFINS, :cBenef, ' +
        ':cCredPres, :Qtde, :Preco_Uni, :Valor, :ALIQ_ICMS, :Val_Base_ICMS, ' +
        ':Val_ICMS, :ALIQ_IPI, :Val_Base_IPI, :Val_IPI, :ALIQ_COFINS, ' +
        ':Val_Base_COFINS, :Val_COFINS, :ALIQ_PIS, :Val_Base_PIS, :Val_PIS, ' +
        ':Val_Desconto, :Val_Frete)';

      with FatGeralDataModule.InsertNOTAITEN do
      begin
        ParamByName('EMP_ID').AsString := EmpresaLogada;
        ParamByName('Serie').AsString := serie;
        ParamByName('Codigo').AsString := Produto;
        ParamByName('Cor').AsString := Cor;
        ParamByName('Tam').AsString := Tamanho;
        ParamByName('Deposito').AsString := Deposito;
        ParamByName('Lote').AsString := Lote;
        ParamByName('natureza').AsString := Natureza;
        ParamByName('CST_ICMS').AsString := CST_ICMS;
        ParamByName('CSOSN').AsString := CSOSN;
        ParamByName('CST_IPI').AsString := CST_IPI;
        ParamByName('ENQ_IPI').AsString := ENQ_IPI;
        ParamByName('CST_PIS').AsString := CST_PIS;
        ParamByName('CST_COFINS').AsString := CST_COFINS;
        ParamByName('cBenef').AsString := cBenef;
        ParamByName('cCredPres').AsString := cCredPres;
        ParamByName('Qtde').AsFloat := Qtde;
        ParamByName('Preco_Uni').AsFloat := Preco_Uni;
        ParamByName('Valor').AsFloat := Valor;
        ParamByName('ALIQ_ICMS').AsFloat := ALIQ_ICMS;
        ParamByName('Val_Base_ICMS').AsFloat := Base_ICMS;
        ParamByName('Val_ICMS').AsFloat := Val_ICMS;
        ParamByName('ALIQ_IPI').AsFloat := ALIQ_IPI;
        ParamByName('Val_Base_IPI').AsFloat := Base_IPI;
        ParamByName('Val_IPI').AsFloat := Val_IPI;
        ParamByName('ALIQ_COFINS').AsFloat := ALIQ_COFINS;
        ParamByName('Val_Base_COFINS').AsFloat := Base_COFINS;
        ParamByName('Val_COFINS').AsFloat := Val_COFINS;
        ParamByName('ALIQ_PIS').AsFloat := ALIQ_PIS;
        ParamByName('Val_Base_PIS').AsFloat := Base_PIS;
        ParamByName('Val_PIS').AsFloat := Val_PIS;
        ParamByName('Val_Desconto').AsFloat := Val_Desconto;
        ParamByName('Val_Frete').AsFloat := Val_Frete;
        ExecSQL;
      end;

      FatGeralDataModule.UpdateEstoque.SQL.Text :=
        'UPDATE estoque SET qtde = (qtde - :qtde) WHERE codigo = :codigo ' +
        'AND cor = :cor AND deposito = :deposito AND lote = :lote AND tamanho = :tamanho';
      with FatGeralDataModule.UpdateEstoque do
      begin
        ParamByName('Codigo').AsString := Produto;
        ParamByName('Cor').AsString := Cor;
        ParamByName('tamanho').AsString := Tamanho;
        ParamByName('Deposito').AsString := Deposito;
        ParamByName('Lote').AsString := Lote;
        ParamByName('qtde').AsFloat := Qtde;
        ExecSQL;
      end;

      FatGeralDataModule.InsertProdMov.SQL.Text :=
        'INSERT INTO prodmov (codigo, cor, tamanho, deposito, lote, qtde, data, ' +
        'tipo, Usuario, OBS) VALUES (:codigo, :cor, :tamanho, :deposito, ' +
        ':lote, :qtde, :data, :tipo, :Usuario, :OBS)';
      with FatGeralDataModule.InsertProdMov do
      begin
        ParamByName('codigo').AsString := Produto;
        ParamByName('cor').AsString := Cor;
        ParamByName('tamanho').AsString := Tamanho;
        ParamByName('deposito').AsString := Deposito;
        ParamByName('lote').AsString := Lote;
        ParamByName('qtde').AsFloat := Qtde;
        ParamByName('data').AsDateTime := Now;
        ParamByName('tipo').AsString := 'S';
        ParamByName('Usuario').AsString := UsuarioLogado;
        ParamByName('OBS').AsString := 'Movimentação realizada a partir da gravação da nota ' + serie;
        ExecSQL;
      end;
    end;

    valor_total := valor_produtos + valor_icms + valor_ipi + valor_cofins + valor_pis;

    FatGeralDataModule.InsertNOTA.SQL.Text :=
      'INSERT INTO nota (EMP_ID, Serie, Codcli, dtemissao, dtsaida, Natureza, ' +
      'valor_produtos, valor_total, valor_icms, valor_base_icms, valor_frete, ' +
      'valor_ipi, valor_base_ipi, valor_cofins, valor_base_cofins, valor_pis, ' +
      'valor_base_pis, valor_desconto, quantidade, aliq_icms, aliq_ipi, aliq_pis, ' +
      'aliq_cofins, impresso, dados_adicionais, especie, volumes, pesob, pesol, ' +
      'presenca, modfrete) VALUES (:EMP_ID, :Serie, :Codcli, :dtemissao, ' +
      ':dtsaida, :Natureza, :valor_produtos, :valor_total, :valor_icms, ' +
      ':valor_base_icms, :valor_frete, :valor_ipi, :valor_base_ipi, ' +
      ':valor_cofins, :valor_base_cofins, :valor_pis, :valor_base_pis, ' +
      ':valor_desconto, :quantidade, :aliq_icms, :aliq_ipi, :aliq_pis, ' +
      ':aliq_cofins, :impresso, :dados_adicionais, :especie, :volumes, ' +
      ':pesob, :pesol, :presenca, :modfrete)';

    with FatGeralDataModule.InsertNOTA do
    begin
      ParamByName('EMP_ID').AsString := EmpresaLogada;
      ParamByName('Serie').AsString := serie;
      ParamByName('Codcli').AsString := entidade;
      ParamByName('dtemissao').AsDateTime := DtEmissao.DateTime;
      ParamByName('dtsaida').AsDateTime := DtSaida.DateTime;
      ParamByName('natureza').AsString := EdtNatureza.Text;
      ParamByName('valor_produtos').AsFloat := valor_produtos;
      ParamByName('valor_total').AsFloat := valor_total;
      ParamByName('valor_icms').AsFloat := valor_icms;
      ParamByName('valor_base_icms').AsFloat := valor_base_icms;
      ParamByName('valor_frete').AsString := EdtValFrete.Text;
      ParamByName('valor_ipi').AsFloat := valor_ipi;
      ParamByName('valor_base_ipi').AsFloat := valor_base_ipi;
      ParamByName('valor_cofins').AsFloat := valor_cofins;
      ParamByName('valor_base_cofins').AsFloat := valor_base_cofins;
      ParamByName('valor_pis').AsFloat := valor_pis;
      ParamByName('valor_base_pis').AsFloat := valor_base_pis;
      ParamByName('valor_desconto').AsString := EdtValDesconto.Text;
      ParamByName('quantidade').AsFloat := quantidade;
      ParamByName('aliq_icms').AsFloat := aliq_icms_nota;
      ParamByName('aliq_ipi').AsFloat := aliq_ipi_nota;
      ParamByName('aliq_pis').AsFloat := aliq_pis_nota;
      ParamByName('aliq_cofins').AsFloat := aliq_cofins_nota;
      ParamByName('dados_adicionais').AsString := dados_adicionais;
      ParamByName('especie').AsString := especie;
      ParamByName('pesob').AsString := pesob;
      ParamByName('pesol').AsString := pesol;
      ParamByName('presenca').AsString := presenca;
      ParamByName('modfrete').AsString := modfrete;
      ParamByName('volumes').AsString := volumes;
      ParamByName('Impresso').AsString := 'N';
      ExecSQL;
    end;

    LogModule.InserirLog.SQL.Text :=
      'INSERT INTO logs (descricao, tela, data, emp_id, usuario) VALUES ' +
      '(:descricao, :tela, :data, :emp_id, :usuario)';
    with LogModule.InserirLog do
    begin
      ParamByName('descricao').AsString := 'O usuário ' + UsuarioLogado +
        ' gravou a nota ' + serie + ' na empresa ' + EmpresaLogada +
        ' para o cliente ' + entidade;
      ParamByName('tela').AsString := 'FatGeral';
      ParamByName('emp_id').AsString := EmpresaLogada;
      ParamByName('usuario').AsString := UsuarioLogado;
      ParamByName('data').AsDateTime := Now;
      ExecSQL;
    end;

    FatGeralDataModule.Conexão.Commit;

    EdtEntidade.Enabled := False;
    EdtNatureza.Enabled := False;
    EdtSerie.Enabled := False;
    EdtValDesconto.Enabled := False;
    EdtValFrete.Enabled := False;
    NIGrid.Enabled := False;
    DTEmissao.Enabled := False;
    DtSaida.Enabled := False;
    EdtDadosAdicionais.Enabled := False;
    EdtEspecie.Enabled := False;
    EdtVolumes.Enabled := False;
    EdtPesoB.Enabled := False;
    EdtPesoL.Enabled := False;
    CBPresenca.Enabled := False;
    CBmodFrete.Enabled := False;

    EdtEntidade.Clear;
    EdtNatureza.Clear;
    EdtSerie.Clear;
    EdtValDesconto.Clear;
    EdtValFrete.Clear;
    EdtDadosAdicionais.Clear;
    EdtEspecie.Clear;
    EdtVolumes.Clear;
    EdtPesoB.Clear;
    EdtPesoL.Clear;

    NIGrid.RowCount := 1;
    SBEntidade.Enabled := False;
    SBNatureza.Enabled := False;
    BtnGravar.Visible := False;
    BtnDesistir.Visible := False;
    btnIncluir.Visible := True;

    ShowMessage('Nota fiscal gravada com sucesso!');
  except
    on E: Exception do
    begin
      FatGeralDataModule.Conexão.Rollback;
      ShowMessage('Erro na gravação: ' + E.Message);
    end;
  end;
end;

procedure TFatGeralForm.EdtValDescontoExit(Sender: TObject);
var
  i: Integer;
  valorTotal, valorUnitario: Double;
begin
  if EdtValDesconto.Text = '' then begin
  EdtValDesconto.Text := '0'
  end
  else begin
  valorTotal := StrToFloat(EdtValFrete.Text);
  valorUnitario := valorTotal / (NIGrid.RowCount - 1);

  for i := 1 to NIGrid.RowCount - 1 do
    NIGrid.Cells[27, i] := FormatFloat('0.00', valorUnitario);
end;
end;

procedure TFatGeralForm.EdtValFreteExit(Sender: TObject);
var
  i: Integer;
  valorTotal, valorUnitario: Double;
begin
  if EdtValFrete.Text = '' then begin
  EdtValFrete.Text := '0'
  end
  else begin
  valorTotal := StrToFloat(EdtValFrete.Text);
  valorUnitario := valorTotal / (NIGrid.RowCount - 1);

  for i := 1 to NIGrid.RowCount - 1 do
    NIGrid.Cells[28, i] := FormatFloat('0.00', valorUnitario);
end;
end;

procedure TFatGeralForm.FormShow(Sender: TObject);
begin
 NIGrid.Cells[0,0] := 'Produto';
 NIGrid.Cells[1,0] := 'Cor';
 NIGrid.Cells[2,0] := 'Tamanho';
 NIGrid.Cells[3,0] := 'Depósito';
 NIGrid.Cells[4,0] := 'Lote';
 NIGrid.Cells[5,0] := 'Qtde';
 NIGrid.Cells[6,0] := 'Preço_Uni';
 NIGrid.Cells[7,0] := 'Valor';
 NIGrid.Cells[8,0] := 'Natureza';
 NIGrid.Cells[9,0] := 'CST_ICMS';
 NIGrid.Cells[10,0] := 'CSOSN';
 NIGrid.Cells[11,0] := 'ALIQ_ICMS';
 NIGrid.Cells[12,0] := 'Base_ICMS';
 NIGrid.Cells[13,0] := 'Valor_ICMS';
 NIGrid.Cells[14,0] := 'CST_IPI';
 NIGrid.Cells[15,0] := 'ENQ_IPI';
 NIGrid.Cells[16,0] := 'ALIQ_IPI';
 NIGrid.Cells[17,0] := 'Base_IPI';
 NIGrid.Cells[18,0] := 'Valor_IPI';
 NIGrid.Cells[19,0] := 'CST_PIS';
 NIGrid.Cells[20,0] := 'ALIQ_PIS';
 NIGrid.Cells[21,0] := 'Base_PIS';
 NIGrid.Cells[22,0] := 'Valor_PIS';
 NIGrid.Cells[23,0] := 'CST_COFINS';
 NIGrid.Cells[24,0] := 'ALIQ_COFINS';
 NIGrid.Cells[25,0] := 'Base_COFINS';
 NIGrid.Cells[26,0] := 'Valor_COFINS';
 NIGrid.Cells[27,0] := 'Desconto';
 NIGrid.Cells[28,0] := 'Valor_Frete';
 NIGrid.Cells[29,0] := 'cBenef';
 NIGrid.Cells[30,0] := 'cCredPres';
end;

procedure TFatGeralForm.NIGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var FormDeposito: TConsultarDeposito;
    FormProduto: TConsultarProduto;
    FormCor: TConsultarCor;
    FormTamanho: TConsultarTamanho;
    FormCSTICMS: TConsultarCSTICMS;
    FormNatureza: TConsultarNatureza;
    FormCSOSN: TConsultarCSOSN;
    FormCSTIPI: TConsultarCSTIPI;
    FormENQIPI: TConsultarENQIPI;
    FormCSTPIS: TConsultarCSTPIS;
    FormCSTCOFINS: TConsultarCSTCOFINS;
    deposito, produto, cor, tamanho, CST_ICMS, CSOSN, CST_IPI, ENQ_IPI, CST_PIS, CST_COFINS, natureza, descricaocor: string;
begin
  if Key = VK_DOWN then
begin
   if NIGrid.Row = NIGrid.RowCount - 1 then
    begin
      NIGrid.RowCount := NIGrid.RowCount + 1;
      NIGrid.Row := NIGrid.RowCount - 1;
    end;
end;

  if Key = VK_F4 then
begin
  case NIGrid.Col of
    0:
begin
  CadProdutoModule.ConsultarProduto.Close;
  CadProdutoModule.ConsultarProduto.Open;
  FormProduto := TConsultarProduto.Create(Self);
  NIGrid.Cells[0, NIGrid.Row] := FormProduto.SelecionarProduto;
  FormProduto.Free;
end;
    1:
    begin
      CadCorModule.ConsultarCor.Close;
      CadCorModule.ConsultarCor.Open;
      FormCor := TConsultarCor.Create(Self);
      cor := FormCor.SelecionarCor;
      descricaocor := FormCor.Descricao;
      NIGrid.Cells[1, NIGrid.Row] := descricaocor;
      FormCor.Free;
    end;

    2:
    begin
      CadTamanhoDataModule.ConsultarTamanho.Close;
      CadTamanhoDataModule.ConsultarTamanho.Open;
      FormTamanho := TConsultarTamanho.Create(Self);
      tamanho := FormTamanho.SelecionarTamanho;
      NIGrid.Cells[2, NIGrid.Row] := tamanho;
      FormTamanho.Free;
    end;

    3:
    begin
     CadDepositoDataModule.ConsultarDeposito.Close;
     CadDepositoDataModule.ConsultarDeposito.Open;
     FormDeposito := TConsultarDeposito.Create(Self);
     deposito := FormDeposito.SelecionarDeposito;
     NIGrid.Cells[3, NIGrid.Row] := deposito;
     FormDeposito.Free;
    end;

    8:
    begin
     CadNaturezaDataModule.QueryNaturezas.Close;
     CadNaturezaDataModule.QueryNaturezas.Open;
     FormNatureza := TConsultarNatureza.Create(Self);
     Natureza := FormNatureza.SelecionarNatureza;
     NIGrid.Cells[8, NIGrid.Row] := natureza;
     FormNatureza.Free;
    end;

    9:
    begin
     CadCSTICMSDataModule.GridQuery.Close;
     CadCSTICMSDataModule.GridQuery.Open;
     FormCSTICMS := TConsultarCSTICMS.Create(Self);
     CST_ICMS := FormCSTICMS.SelecionarICMSCST;
     NIGrid.Cells[9, NIGrid.Row] := CST_ICMS;
     FormCSTICMS.Free
    end;

    10:
    begin
     CadCSOSNDataModule.GridQuery.Close;
     CadCSOSNDataModule.GridQuery.Open;
     FormCSOSN := TConsultarCSOSN.Create(Self);
     CSOSN := FormCSOSN.SelecionarCSOSN;
     NIGrid.Cells[10, NIGrid.Row] := CSOSN;
     FormCSOSN.Free;
    end;

    14:
    begin
     CadCSTIPIDataModule.GridQuery.Close;
     CadCSTIPIDataModule.GridQuery.Open;
     FormCSTIPI := TConsultarCSTIPI.Create(Self);
     CST_IPI := FormCSTIPI.SelecionarCstIPI;
     NIGrid.Cells[14, NIGrid.Row] := CST_IPI;
     FormCSTIPI.Free
    end;

    15:
    begin
     CadENQIPIDataModule.GridQuery.Close;
     CadENQIPIDataModule.GridQuery.Open;
     FormENQIPI := TConsultarENQIPI.Create(Self);
     ENQ_IPI := FormENQIPI.SelecionarENQIPI;
     NIGrid.Cells[15, NIGrid.Row] := ENQ_IPI;
     FormENQIPI.Free;
    end;

    19:
    begin
     CadCSTPISDataModule.GridQuery.Close;
     CadCSTPISDataModule.GridQuery.Open;
     FormCSTPIS := TConsultarCSTPIS.Create(Self);
     CST_PIS := FormCSTPIS.SelecionarPisCST;
     NIGrid.Cells[19, NIGrid.Row] := CST_PIS;
     FormCSTPIS.Free;
    end;

    23:
    begin
     CadCSTCOFINSDataModule.GridQuery.Close;
     CadCSTCOFINSDataModule.GridQuery.Open;
     FormCSTCOFINS := TConsultarCSTCOFINS.Create(Self);
     CST_COFINS := FormCSTCOFINS.SelecionarCofinsCST;
     NIGrid.Cells[23, NIGrid.Row] := CST_COFINS;
     FormCSTCOFINS.Free;
    end;
end;
end;
end;

procedure TFatGeralForm.SBEntidadeClick(Sender: TObject);
var codigo, nome: string;
begin
 CadEntidadeDataModule.ConsultarEntidade.SQL.Clear;
 CadEntidadeDataModule.ConsultarEntidade.SQL.Text :=
 'select * from cadentidade where ativo = :ativo';
 CadEntidadeDataModule.ConsultarEntidade.ParamByName('ativo').AsString := 'S';
 CadEntidadeDataModule.ConsultarEntidade.Open;

 Application.CreateForm(TConsultarEntidade, ConsultarEntidade);

 codigo := ConsultarEntidade.SelecionarEntidade;

 Nome := ConsultarEntidade.nome;
 EdtEntidade.Text := Nome;
end;

procedure TFatGeralForm.SBNaturezaClick(Sender: TObject);
var natureza, cBenef, cCredPres, cst_icms, csosn, cst_ipi, enq_ipi, cst_pis, cst_cofins, aliq_icms, aliq_ipi, aliq_cofins, aliq_pis: string;
    i: integer;
begin
  CadNaturezaDataModule.QueryNaturezas.Close;
  CadNaturezaDataModule.QueryNaturezas.Open;
  Application.CreateForm(TConsultarNatureza, ConsultarNatureza);
  natureza := ConsultarNatureza.SelecionarNatureza;
  if natureza <> '' then
  begin
    EdtNatureza.Text := natureza;
    for i := 1 to NIGrid.RowCount - 1 do
    NIGrid.Cells[8, i] := natureza;

    cBenef := ConsultarNatureza.cBenef;
    for i := 1 to NIGrid.RowCount - 1 do
    NIGrid.Cells[29,i] := cBenef;

    cCredPres := ConsultarNatureza.cCredPres;
    for i := 1 to NIGrid.RowCount - 1 do
    NIGrid.Cells[30,i] := cCredPres;

    enq_ipi := ConsultarNatureza.enq_ipi;
    for i := 1 to NIGrid.RowCount - 1 do
    NIGrid.Cells[15,i] := enq_ipi;

    cst_icms := ConsultarNatureza.cst_icms;
    for i := 1 to NIGrid.RowCount - 1 do
    NIGrid.Cells[9,i] := cst_icms;

    csosn := ConsultarNatureza.csosn;
    for i := 1 to NIGrid.RowCount - 1 do
    NIGrid.Cells[10,i] := csosn;

    cst_ipi := ConsultarNatureza.cst_ipi;
    for i := 1 to NIGrid.RowCount - 1 do
    NIGrid.Cells[14,i] := cst_ipi;

    cst_pis := ConsultarNatureza.cst_pis;
    for i := 1 to NIGrid.RowCount - 1 do
    NIGrid.Cells[19,i] := cst_pis;

    cst_cofins := ConsultarNatureza.cst_cofins;
    for i := 1 to NIGrid.RowCount - 1 do
    NIGrid.Cells[23,i] := cst_cofins;

    aliq_icms := ConsultarNatureza.Aliq_icms;
    for i := 1 to NIGrid.RowCount - 1 do
    NIGrid.Cells[11,i] := aliq_icms;

    aliq_ipi := ConsultarNatureza.aliq_ipi;
    for i := 1 to NIGrid.RowCount - 1 do
    NIGrid.Cells[16,i] := aliq_ipi;

    aliq_pis := ConsultarNatureza.aliq_pis;
    for i := 1 to NIGrid.RowCount - 1 do
    NIGrid.Cells[20,i] := aliq_pis;

    aliq_cofins := ConsultarNatureza.aliq_cofins;
    for i := 1 to NIGrid.RowCount - 1 do
    NIGrid.Cells[24,i] := aliq_cofins;
  end;
end;

end.
