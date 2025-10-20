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
  GeralDataModule;

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
    procedure FormShow(Sender: TObject);
    procedure EdtValFreteExit(Sender: TObject);
    procedure NIGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtValDescontoExit(Sender: TObject);
    procedure SBNaturezaClick(Sender: TObject);
    procedure SBEntidadeClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
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

 NIGrid.RowCount := 1;

 SBEntidade.Enabled := False;
 SBNatureza.Enabled := False;

 BtnGravar.Visible := False;
 BtnDesistir.Visible := False;
 btnIncluir.Visible := Visible;
end;

procedure TFatGeralForm.btnGravarClick(Sender: TObject);
VAR  Produto, Cor, Tamanho, Deposito, Lote, Natureza, CST_ICMS, CSOSN, CST_IPI, ENQ_IPI, CST_PIS, CST_COFINS, cBenef, cCredPres: string;
Qtde, Preco_Uni, Valor,
ALIQ_ICMS, Base_ICMS, Valor_ICMS,
ALIQ_IPI, Base_IPI, Valor_IPI,
ALIQ_COFINS, Base_COFINS, Valor_COFINS,
ALIQ_PIS, Base_PIS, Valor_PIS,
Desconto, Valor_Frete: double;
i: integer;
begin
 Produto := NIGrid.Cells[0,1];
 Cor := NIGrid.Cells[1,1];
 Tamanho := NIGrid.Cells[2,1];
 Deposito := NIGrid.Cells[3,1];
 Lote := NIGrid.Cells[4,1];
 Qtde := StrToFloatDef(NIGrid.Cells[5, NIGrid.Row], 0);
 Preco_Uni := StrToFloatDef(NIGrid.Cells[6, NIGrid.Row], 0);
 Natureza := NIGrid.Cells[8,1];
 CST_ICMS := NIGrid.Cells[9,1];
 CSOSN := NIGrid.Cells[10,1];
 CST_IPI := NIGrid.Cells[14,1];
 ENQ_IPI := NIGrid.Cells[15,1];
 CST_PIS := NIGrid.Cells[19,1];
 CST_COFINS := NIGrid.Cells[23,1];
 cBenef := NIGrid.Cells[29,1];
 cCredPres := NIGrid.Cells[30,1];
 ALIQ_ICMS := StrToFloatDef(NIGrid.Cells[11,1], 0);
 ALIQ_PIS := StrToFloatDef(NIGrid.Cells[20,1], 0);
 ALIQ_IPI := StrToFloatDef(NIGrid.Cells[16,1], 0);
 ALIQ_COFINS := StrToFloatDef(NIGrid.Cells[24,1], 0);
 Desconto := StrToFloatDef(NIGrid.Cells[27,1], 0);
 Valor_Frete := StrToFloatDef(NIGrid.Cells[28,1], 0);

 Base_ICMS := ((Qtde * Preco_Uni) - Desconto + Valor_Frete);
 for i := 1 to NIGrid.RowCount - 1 do
 NIGrid.Cells[12, i] := FormatFloat('0.00', Base_ICMS);
 Valor_ICMS := (((Qtde * Preco_Uni) - Desconto + Valor_Frete)*(ALIQ_ICMS/100));
 for i := 1 to NIGrid.RowCount - 1 do
 NIGrid.Cells[13, i] := FormatFloat('0.00', Valor_ICMS);

 BASE_IPI := ((Qtde * Preco_Uni) - Desconto + Valor_Frete + Valor_ICMS);
 for i := 1 to NIGrid.RowCount - 1 do
 NIGrid.Cells[17, i] := FormatFloat('0.00', Base_IPI);
 Valor_IPI := (((Qtde * Preco_Uni) - Desconto + Valor_Frete + Valor_ICMS)*(ALIQ_IPI/100));
 for i := 1 to NIGrid.RowCount - 1 do
 NIGrid.Cells[18, i] := FormatFloat('0.00', Valor_IPI);

 BASE_PIS := ((Qtde * Preco_Uni) - Desconto + Valor_Frete);
 for i := 1 to NIGrid.RowCount - 1 do
 NIGrid.Cells[21, i] := FormatFloat('0.00', Base_PIS);
 Valor_PIS := (((Qtde * Preco_Uni) - Desconto + Valor_Frete)*(ALIQ_PIS/100));
 for i := 1 to NIGrid.RowCount - 1 do
 NIGrid.Cells[22, i] := FormatFloat('0.00', Valor_PIS);

 Base_COFINS := ((Qtde * Preco_Uni) - Desconto + Valor_Frete);
 for i := 1 to NIGrid.RowCount - 1 do
 NIGrid.Cells[25, i] := FormatFloat('0.00', Base_COFINS);
 Valor_COFINS := (((Qtde * Preco_Uni) - Desconto + Valor_Frete)*(ALIQ_COFINS/100));
 for i := 1 to NIGrid.RowCount - 1 do
 NIGrid.Cells[26, i] := FormatFloat('0.00', Valor_COFINS);

 Valor := ((Qtde * Preco_Uni) - Desconto);
 for i := 1 to NIGrid.RowCount - 1 do
 NIGrid.Cells[7, i] := FormatFloat('0.00', Valor);

 FatGeralDataModule.SelectQuery.SQL.Clear;
 FatGeralDataModule.SelectQuery.Close;
 FatGeralDataModule.SelectQuery.SQL.Text :=
 'select qtde from estoque ' +
 'where codigo = :codigo ' +
 'and cor = :cor ' +
 'and tamanho = :tamanho ' +
 'and deposito = :deposito ' +
 'and lote = :lote ' +
 'having qtde >= :qtde';
 FatGeralDataModule.SelectQuery.ParamByName('codigo').AsString := produto;
 FatGeralDataModule.SelectQuery.ParamByName('cor').AsString := cor;
 FatGeralDataModule.SelectQuery.ParamByName('tamanho').AsString := tamanho;
 FatGeralDataModule.SelectQuery.ParamByName('deposito').AsString := deposito;
 FatGeralDataModule.SelectQuery.ParamByName('lote').AsString := lote;
 FatGeralDataModule.SelectQuery.ParamByName('qtde').AsFloat := qtde;
 FatGeralDataModule.SelectQuery.Open;

 if FatGeralDataModule.SelectQuery.IsEmpty then begin
 ShowMessage('Sem quantidades disponíveis no estoque para o produto: ' + produto + ' na cor: ' + cor + ' no tamanho: ' + tamanho +
             ' no lote: ' + lote + ' no depósito: ' + deposito);
 end
 else begin

 if EdtEntidade.Text = '' then begin
 ShowMessage('Cliente não pode ser vazio!');
 end
 else begin

 if EdtNatureza.Text = '' then begin
 ShowMessage('Natureza não pode ser vazio!');
 end
 else begin

 if EdtSerie.Text = '' then begin
 ShowMessage('Série não pode ser vazio!');
 end
 else begin

 FatGeralDataModule.InsertNOTA.SQL.CLear;
 FatGeralDataModule.InsertNOTA.SQL.Text :=
 'insert into nota (Natureza, qtde, Valor, ALIQ_ICMS, Base_ICMS, Valor_ICMS, ALIQ_IPI, Base_IPI, Valor_IPI, ALIQ_COFINS, Base_COFINS, ' +
 'Valor_COFINS, ALIQ_PIS, Base_PIS, Valor_PIS, Desconto, Valor_Frete) '+
 'values ' +
 '(:Natureza, :qtde, :Valor, :ALIQ_ICMS, :Base_ICMS, :Valor_ICMS, :ALIQ_IPI, :Base_IPI, :Valor_IPI, :ALIQ_COFINS, :Base_COFINS, ' +
 ':Valor_COFINS, :ALIQ_PIS, :Base_PIS, :Valor_PIS, :Desconto, :Valor_Frete)';
 FatGeralDataModule.InsertNOTA.ParamByName('natureza').AsString := natureza;
 FatGeralDataModule.InsertNOTA.ParamByName('qtde').AsFloat := qtde;
 FatGeralDataModule.InsertNOTA.ParamByName('Valor').AsFloat := Valor;
 FatGeralDataModule.InsertNOTA.ParamByName('ALIQ_ICMS').AsFloat := ALIQ_ICMS;
 FatGeralDataModule.InsertNOTA.ParamByName('Base_ICMS').AsFloat := Base_ICMS;
 FatGeralDataModule.InsertNOTA.ParamByName('Valor_ICMS').AsFloat := Valor_ICMS;
 FatGeralDataModule.InsertNOTA.ParamByName('ALIQ_IPI').AsFloat := ALIQ_IPI;
 FatGeralDataModule.InsertNOTA.ParamByName('Base_IPI').AsFloat := Base_IPI;
 FatGeralDataModule.InsertNOTA.ParamByName('Valor_IPI').AsFloat := Valor_IPI;
 FatGeralDataModule.InsertNOTA.ParamByName('ALIQ_COFINS').AsFloat := ALIQ_COFINS;
 FatGeralDataModule.InsertNOTA.ParamByName('Base_COFINS').AsFloat := Base_COFINS;
 FatGeralDataModule.InsertNOTA.ParamByName('Valor_COFINS').AsFloat := Valor_COFINS;
 FatGeralDataModule.InsertNOTA.ParamByName('ALIQ_PIS').AsFloat := ALIQ_PIS;
 FatGeralDataModule.InsertNOTA.ParamByName('Base_PIS').AsFloat := Base_PIS;
 FatGeralDataModule.InsertNOTA.ParamByName('Valor_PIS').AsFloat := Valor_PIS;
 FatGeralDataModule.InsertNOTA.ParamByName('Desconto').AsFloat := Desconto;
 FatGeralDataModule.InsertNOTA.ParamByName('Valor_Frete').AsFloat := Valor_Frete;

 FatGeralDataModule.InsertNOTAITEN.SQL.CLear;
 FatGeralDataModule.InsertNOTAITEN.SQL.Text :=
 'insert into notaiten (Produto, Cor, Tamanho, Deposito, Lote, Natureza, CST_ICMS, CSOSN, CST_IPI, ENQ_IPI, CST_PIS, CST_COFINS, cBenef, ' +
 'cCredPres, Qtde, Preco_Uni, Valor, ALIQ_ICMS, Base_ICMS, Valor_ICMS, ALIQ_IPI, Base_IPI, Valor_IPI, ALIQ_COFINS, Base_COFINS, Valor_COFINS, ' +
 'ALIQ_PIS, Base_PIS, Valor_PIS, Desconto, Valor_Frete) ' +
 'values ' +
 '(:Produto, :Cor, :Tamanho, :Deposito, :Lote, :Natureza, :CST_ICMS, :CSOSN, :CST_IPI, :ENQ_IPI, :CST_PIS, :CST_COFINS, :cBenef, ' +
 ':cCredPres, :Qtde, :Preco_Uni, :Valor, :ALIQ_ICMS, :Base_ICMS, :Valor_ICMS, :ALIQ_IPI, :Base_IPI, :Valor_IPI, :ALIQ_COFINS, :Base_COFINS, ' +
 ':Valor_COFINS, :ALIQ_PIS, :Base_PIS, :Valor_PIS, :Desconto, :Valor_Frete)';
 FatGeralDataModule.InsertNOTAITEN.ParamByName('Produto').AsString := Produto;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('Cor').AsString := Cor;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('Tamanho').AsString := Tamanho;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('Lote').AsString := Lote;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('natureza').AsString := natureza;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('CST_ICMS').AsString := CST_ICMS;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('CSOSN').AsString := CSOSN;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('CST_IPI').AsString := CST_IPI;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('ENQ_IPI').AsString := ENQ_IPI;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('CST_PIS').AsString := CST_PIS;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('CST_COFINS').AsString := CST_COFINS;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('cBenef').AsString := cBenef;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('cCredPres').AsString := cCredPres;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('Qtde').AsFloat := Qtde;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('Preco_Uni').AsFloat := Preco_Uni;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('Valor').AsFloat := Valor;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('ALIQ_ICMS').AsFloat := ALIQ_ICMS;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('Base_ICMS').AsFloat := Base_ICMS;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('Valor_ICMS').AsFloat := Valor_ICMS;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('ALIQ_IPI').AsFloat := ALIQ_IPI;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('Base_IPI').AsFloat := Base_IPI;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('Valor_IPI').AsFloat := Valor_IPI;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('ALIQ_COFINS').AsFloat := ALIQ_COFINS;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('Base_COFINS').AsFloat := Base_COFINS;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('Valor_COFINS').AsFloat := Valor_COFINS;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('ALIQ_PIS').AsFloat := ALIQ_PIS;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('Base_PIS').AsFloat := Base_PIS;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('Valor_PIS').AsFloat := Valor_PIS;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('Desconto').AsFloat := Desconto;
 FatGeralDataModule.InsertNOTAITEN.ParamByName('Valor_Frete').AsFloat := Valor_Frete;
 try
 FatGeralDataModule.InsertNOTA.ExecSQL;
 FatGeralDataModule.InsertNOTAITEN.ExecSQL;
 ShowMessage('Gravado com sucesso!');
 except
 ShowMessage('Erro na gravação!');
 end;
end;
end;
end;
end;
end;

procedure TFatGeralForm.EdtValDescontoExit(Sender: TObject);
var
  i: Integer;
  valorTotal, valorUnitario: Double;
begin
  valorTotal := StrToFloat(EdtValFrete.Text);
  valorUnitario := valorTotal / (NIGrid.RowCount - 1);

  for i := 1 to NIGrid.RowCount - 1 do
    NIGrid.Cells[27, i] := FormatFloat('0.00', valorUnitario);
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
      CadProdutoModule.FDQuery.Close;
      CadProdutoModule.FDQuery.Open;
      FormProduto := TConsultarProduto.Create(Self);
      FormProduto.ShowModal;
      produto := FormProduto.SelecionarProduto;
      NIGrid.Cells[0, NIGrid.Row] := produto;
      TConsultarProduto.Create(Self).Free;
    end;

    1:
    begin
      CadCorModule.FDQuery.Close;
      CadCorModule.FDQuery.Open;
      FormCor := TConsultarCor.Create(Self);
      FormCor.ShowModal;
      cor := FormCor.SelecionarCor;
      descricaocor := FormCor.Descricao;
      NIGrid.Cells[1, NIGrid.Row] := descricaocor;
      FormCor.Free;
    end;

    2:
    begin
      CadTamanhoDataModule.FDQuery.Close;
      CadTamanhoDataModule.FDQuery.Open;
      FormTamanho := TConsultarTamanho.Create(Self);
      FormTamanho.ShowModal;
      tamanho := FormTamanho.SelecionarTamanho;
      NIGrid.Cells[2, NIGrid.Row] := tamanho;
      FormTamanho.Free;
    end;

    3:
    begin
     CadDepositoDataModule.FDQuery.Close;
     CadDepositoDataModule.FDQuery.Open;
     FormDeposito := TConsultarDeposito.Create(Self);
     FormDeposito.ShowModal;
     deposito := FormDeposito.SelecionarDeposito;
     NIGrid.Cells[3, NIGrid.Row] := deposito;
     FormDeposito.Free;
    end;

    8:
    begin
     CadNaturezaDataModule.QueryNaturezas.Close;
     CadNaturezaDataModule.QueryNaturezas.Open;
     FormNatureza := TConsultarNatureza.Create(Self);
     FormNatureza.ShowModal;
     Natureza := FormNatureza.SelecionarNatureza;
     NIGrid.Cells[8, NIGrid.Row] := natureza;
     FormNatureza.Free;
    end;

    9:
    begin
     CadCSTICMSDataModule.GridQuery.Close;
     CadCSTICMSDataModule.GridQuery.Open;
     FormCSTICMS := TConsultarCSTICMS.Create(Self);
     FormCSTICMS.ShowModal;
     CST_ICMS := FormCSTICMS.SelecionarICMSCST;
     NIGrid.Cells[9, NIGrid.Row] := CST_ICMS;
     FormCSTICMS.Free
    end;

    10:
    begin
     CadCSOSNDataModule.GridQuery.Close;
     CadCSOSNDataModule.GridQuery.Open;
     FormCSOSN := TConsultarCSOSN.Create(Self);
     FormCSOSN.ShowModal;
     CSOSN := FormCSOSN.SelecionarCSOSN;
     NIGrid.Cells[10, NIGrid.Row] := CSOSN;
     FormCSOSN.Free;
    end;

    14:
    begin
     CadCSTIPIDataModule.GridQuery.Close;
     CadCSTIPIDataModule.GridQuery.Open;
     FormCSTIPI := TConsultarCSTIPI.Create(Self);
     FormCSTIPI.ShowModal;
     CST_IPI := FormCSTIPI.SelecionarCstIPI;
     NIGrid.Cells[14, NIGrid.Row] := CST_IPI;
     FormCSTIPI.Free
    end;

    15:
    begin
     CadENQIPIDataModule.GridQuery.Close;
     CadENQIPIDataModule.GridQuery.Open;
     FormENQIPI := TConsultarENQIPI.Create(Self);
     FormENQIPI.ShowModal;
     ENQ_IPI := FormENQIPI.SelecionarENQIPI;
     NIGrid.Cells[15, NIGrid.Row] := ENQ_IPI;
     FormENQIPI.Free;
    end;

    19:
    begin
     CadCSTPISDataModule.GridQuery.Close;
     CadCSTPISDataModule.GridQuery.Open;
     FormCSTPIS := TConsultarCSTPIS.Create(Self);
     FormCSTPIS.ShowModal;
     CST_PIS := FormCSTPIS.SelecionarPisCST;
     NIGrid.Cells[19, NIGrid.Row] := CST_PIS;
     FormCSTPIS.Free;
    end;

    23:
    begin
     CadCSTCOFINSDataModule.GridQuery.Close;
     CadCSTCOFINSDataModule.GridQuery.Open;
     FormCSTCOFINS := TConsultarCSTCOFINS.Create(Self);
     FormCSTCOFINS.ShowModal;
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
 CadEntidadeDataModule.FDQuery1.Close;
 CadEntidadeDataModule.FDQuery1.Open;
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
