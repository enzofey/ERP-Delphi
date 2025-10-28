unit EntradaNF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.DateUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Grids, Xml.XMLDoc, Xml.XMLIntf,
  EntidadeDM, ConsultarEntidadeForm,
  NaturezaDM, ConsultarNaturezaForm,
  DepositoDM, ConsultarDepositoForm;

type
  TEntradaNFForm = class(TForm)
    Pages: TPageControl;
    AcessoPage: TTabSheet;
    NotaPage: TTabSheet;
    ItensPage: TTabSheet;
    lblEntidade: TLabel;
    lblFatura: TLabel;
    EdtnNF: TEdit;
    lblSerie: TLabel;
    EdtSerie: TEdit;
    lblTpDoc: TLabel;
    EdtMod: TEdit;
    EdtCodigoEntidade: TEdit;
    EdtNomeEntidade: TEdit;
    SBEntidade: TSpeedButton;
    lblNatureza: TLabel;
    EdtCodigoNatureza: TEdit;
    EdtDescricaoNatureza: TEdit;
    SBNatureza: TSpeedButton;
    lblDeposito: TLabel;
    EdtCodigoDeposito: TEdit;
    EdtDescricaoDeposito: TEdit;
    SBDeposito: TSpeedButton;
    AbasNota: TPageControl;
    ValoresPage: TTabSheet;
    FinanceiroPage: TTabSheet;
    lblvBC: TLabel;
    lblvICMS: TLabel;
    lblvICMSDeson: TLabel;
    lblValorProdutos: TLabel;
    lblValorFrete: TLabel;
    lblValorDesconto: TLabel;
    lblValorSeguro: TLabel;
    lblValorOutros: TLabel;
    EdtvProd: TEdit;
    EdtvFrete: TEdit;
    EdtvDesc: TEdit;
    EdtvSeg: TEdit;
    EdtvOutro: TEdit;
    EdtvBC: TEdit;
    EdtvICMS: TEdit;
    EdtvICMSDeson: TEdit;
    GroupICMS: TGroupBox;
    GroupIPI: TGroupBox;
    lblvBcIPI: TLabel;
    lblvIPI: TLabel;
    lblvIPIDevol: TLabel;
    EdtvBcIPI: TEdit;
    EdtvIPI: TEdit;
    EdtvIPIDevol: TEdit;
    GroupPIS: TGroupBox;
    lblvBcPIS: TLabel;
    lblvPIS: TLabel;
    EdtvBcPIS: TEdit;
    EdtvPIS: TEdit;
    GroupCOFINS: TGroupBox;
    lblvBcCOFINS: TLabel;
    lblvCOFINS: TLabel;
    EdtvBcCOFINS: TEdit;
    EdtvCOFINS: TEdit;
    lblvBCST: TLabel;
    EdtvBCST: TEdit;
    lblvST: TLabel;
    EdtvST: TEdit;
    lblvNF: TLabel;
    EdtvNF: TEdit;
    lblMoeda: TLabel;
    EdtCodigoMoeda: TEdit;
    EdtDescricaoMoeda: TEdit;
    SBMoeda: TSpeedButton;
    lblParcelas: TLabel;
    EdtParcela1: TEdit;
    EdtParcela2: TEdit;
    EdtParcela4: TEdit;
    EdtParcela3: TEdit;
    EdtParcela7: TEdit;
    EdtParcela8: TEdit;
    EdtParcela5: TEdit;
    EdtParcela6: TEdit;
    DUPLGrid: TStringGrid;
    btnGerarDuplicata: TButton;
    ItensGrid: TStringGrid;
    TributacaoItensPage: TPageControl;
    ICMSPage: TTabSheet;
    IPIPage: TTabSheet;
    PISPage: TTabSheet;
    COFINSPage: TTabSheet;
    GBPIS: TGroupBox;
    lblpPIS: TLabel;
    lblvPISItem: TLabel;
    EdtpPIS: TEdit;
    EdtvPISItem: TEdit;
    GBIPI: TGroupBox;
    lblvBCIPIItem: TLabel;
    lblvIPIItem: TLabel;
    EdtvBCIPIItem: TEdit;
    EdtvIPIItem: TEdit;
    GBICMS: TGroupBox;
    lblvBCItem: TLabel;
    lblvICMSItem: TLabel;
    lblvICMSDesonItem: TLabel;
    lblvBCSTItem: TLabel;
    lblvICMSSTItem: TLabel;
    EdtvBCItem: TEdit;
    EdtvICMSItem: TEdit;
    EdtvICMSDesonItem: TEdit;
    EdtvBCSTItem: TEdit;
    EdtvICMSSTItem: TEdit;
    GBCofins: TGroupBox;
    lblpICMS: TLabel;
    EdtpICMS: TEdit;
    lblCSTICMS: TLabel;
    EdtCSTICMS: TEdit;
    SBCSTICMS: TSpeedButton;
    lblCSTIPI: TLabel;
    EdtCSTIPI: TEdit;
    SBCSTIPI: TSpeedButton;
    lblEnqIPI: TLabel;
    EdtEnqIPI: TEdit;
    SBEnqIPI: TSpeedButton;
    lblpIPI: TLabel;
    EdtpIPI: TEdit;
    EdtvBCPISItem: TEdit;
    lblvBCPISItem: TLabel;
    EdtCSTPIS: TEdit;
    lblCSTPIS: TLabel;
    SBCSTPIS: TSpeedButton;
    SBCSTCOFINS: TSpeedButton;
    EdtCSTCOFINS: TEdit;
    lblCSTCOFINS: TLabel;
    lblvBCCOFINSItem: TLabel;
    EdtvBCCOFINSItem: TEdit;
    EdtpCOFINS: TEdit;
    lblpCOFINS: TLabel;
    lblvCOFINSItem: TLabel;
    EdtvCOFINSItem: TEdit;
    lbldtEmissao: TLabel;
    EdtDtEmissao: TDateTimePicker;
    lblDtEntrada: TLabel;
    EdtDtEntrada: TDateTimePicker;
    lblChaveNFE: TLabel;
    EdtChaveNFE: TEdit;
    DIFALFCPGroup: TGroupBox;
    lblvFCP: TLabel;
    lblvFCPST: TLabel;
    EdtvFCP: TEdit;
    EdtvFCPST: TEdit;
    lblvFCPSTRet: TLabel;
    EdtvFCPSTRet: TEdit;
    lblValorPago: TLabel;
    EdtValorPago: TEdit;
    btnIncluir: TButton;
    btnIncluirXML: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnConsultar: TButton;
    btnFechar: TButton;
    btnDesistir: TButton;
    btnGravarAlterar: TButton;
    btnGravarIncluir: TButton;
    lblvBCUFDest: TLabel;
    EdtvBCUFDest: TEdit;
    lblvBCFCPUFDest: TLabel;
    EdtvBCFCPUFDest: TEdit;
    lblpFCPUFDest: TLabel;
    EdtpFCPUFDest: TEdit;
    EdtpICMSUFDest: TEdit;
    lblpICMSUFDest: TLabel;
    EdtvICMSUFDest: TEdit;
    lblvICMSUFdest: TLabel;
    btnChaveNFE: TButton;
    lblCSOSN: TLabel;
    EdtCSOSN: TEdit;
    SBCSOSN: TSpeedButton;
    ICMSUFDestPage: TTabSheet;
    GBDIFAL: TGroupBox;
    lblvBCUFDestItem: TLabel;
    lblvICMSUFDestItem: TLabel;
    EdtvBCUFDestItem: TEdit;
    EdtvICMSUFDestItem: TEdit;
    GBFCP: TGroupBox;
    lblvBCFCPItem: TLabel;
    lblvFCPItem: TLabel;
    lblvBCFCPSTItem: TLabel;
    lblvFCPSTItem: TLabel;
    lblpFCPItem: TLabel;
    EdtvBCFCPItem: TEdit;
    EdtvFCPItem: TEdit;
    EdtvBCFCPSTItem: TEdit;
    EdtvFCPSTItem: TEdit;
    EdtpFCPItem: TEdit;
    EdtpMVASTItem: TEdit;
    lblpMVASTItem: TLabel;
    EdtpRedBCSTItem: TEdit;
    lblpRedBCSTItem: TLabel;
    lblpICMSSTItem: TLabel;
    EdtpICMSSTItem: TEdit;
    lblpFCPSTItem: TLabel;
    EdtpFCPSTItem: TEdit;
    lblpRedBCItem: TLabel;
    EdtpRedBCItem: TEdit;
    lblvICMSOpItem: TLabel;
    EdtvICMSOpItem: TEdit;
    lblpDifItem: TLabel;
    EdtpDifItem: TEdit;
    lblvICMSDifItem: TLabel;
    EdtvICMSDifItem: TEdit;
    lblvBCSTRetItem: TLabel;
    EdtvBCSTRetItem: TEdit;
    lblvICMSSTRetItem: TLabel;
    EdtvICMSSTRetItem: TEdit;
    lblpSTItem: TLabel;
    EdtpSTItem: TEdit;
    lblvICMSSubstitutoItem: TLabel;
    EdtvICMSSubstitutoItem: TEdit;
    lblvBCFCPSTRetItem: TLabel;
    EdtvBCFCPSTRetItem: TEdit;
    lblpFCPSTRetItem: TLabel;
    EdtpFCPSTRetItem: TEdit;
    lblvFCPSTRetItem: TLabel;
    EdtvFCPSTRetItem: TEdit;
    lblvBCEfetItem: TLabel;
    EdtvBCEfetItem: TEdit;
    lblpRedBCEfetItem: TLabel;
    EdtpRedBCEfetItem: TEdit;
    lblpICMSEfetItem: TLabel;
    EdtpICMSEfetItem: TEdit;
    lblvICMSEfetItem: TLabel;
    EdtvICMSEfetItem: TEdit;
    GeralPage: TTabSheet;
    lblvDescItem: TLabel;
    EdtvDescItem: TEdit;
    EdtvFreteItem: TEdit;
    lblvFreteItem: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnIncluirXMLClick(Sender: TObject);
    procedure SBEntidadeClick(Sender: TObject);
    procedure SBNaturezaClick(Sender: TObject);
    procedure SBDepositoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure EdtCodigoEntidadeChange(Sender: TObject);
    procedure EdtCodigoDepositoChange(Sender: TObject);
    procedure EdtCodigoNaturezaChange(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure ItensGridClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EntradaNFForm: TEntradaNFForm;

implementation

{$R *.dfm}

procedure TEntradaNFForm.FormShow(Sender: TObject);
begin
 ItensGrid.Cells[0,0]  := 'Produto';
 ItensGrid.Cells[1,0]  := 'Cor';
 ItensGrid.Cells[2,0]  := 'Tamanho';
 ItensGrid.Cells[3,0]  := 'Depósito';
 ItensGrid.Cells[4,0]  := 'Lote';
 ItensGrid.Cells[5,0]  := 'Qtde';
 ItensGrid.Cells[6,0]  := 'Preço_Uni';
 ItensGrid.Cells[7,0]  := 'Valor';
 ItensGrid.Cells[8,0]  := 'Natureza';
 ItensGrid.Cells[9,0]  := 'CST_ICMS';
 ItensGrid.Cells[10,0] := 'CSOSN';
 ItensGrid.Cells[11,0] := 'Aliq_ICMS';
 ItensGrid.Cells[12,0] := 'BC_ICMS';
 ItensGrid.Cells[13,0] := 'Valor_ICMS';
 ItensGrid.Cells[14,0] := 'Valor_ICMS_Deson';
 ItensGrid.Cells[15,0] := 'Valor_BC_ST';
 ItensGrid.Cells[16,0] := 'Valor_ST';
 ItensGrid.Cells[17,0] := 'CST_IPI';
 ItensGrid.Cells[18,0] := 'ENQ_IPI';
 ItensGrid.Cells[19,0] := 'Aliq_IPI';
 ItensGrid.Cells[20,0] := 'BC_IPI';
 ItensGrid.Cells[21,0] := 'Valor_IPI';
 ItensGrid.Cells[22,0] := 'CST_PIS';
 ItensGrid.Cells[23,0] := 'Aliq_PIS';
 ItensGrid.Cells[24,0] := 'BC_PIS';
 ItensGrid.Cells[25,0] := 'Valor_PIS';
 ItensGrid.Cells[26,0] := 'CST_COFINS';
 ItensGrid.Cells[27,0] := 'Aliq_COFINS';
 ItensGrid.Cells[28,0] := 'Valor_COFINS';
 ItensGrid.Cells[29,0] := 'BC_COFINS';
 ItensGrid.Cells[30,0] := 'Desconto';
 ItensGrid.Cells[31,0] := 'Aliq_FCP';
 ItensGrid.Cells[32,0] := 'Valor_FCP';
 ItensGrid.Cells[33,0] := 'Valor_BC_FCP';
 ItensGrid.Cells[34,0] := 'Valor_BC_FCP_ST';
 ItensGrid.Cells[35,0] := 'Valor_FCP_ST';
 ItensGrid.Cells[36,0] := 'Aliq_FCP_ST';
 ItensGrid.Cells[37,0] := 'MVAST';
 ItensGrid.Cells[38,0] := 'Perc_Red_BC_ST';
 ItensGrid.Cells[39,0] := 'Perc_ICMS_ST';
 ItensGrid.Cells[40,0] := 'Perc_Red_BC_ICMS';
 ItensGrid.Cells[41,0] := 'Perc_Dif';
 ItensGrid.Cells[42,0] := 'Valor_ICMS_Oper';
 ItensGrid.Cells[43,0] := 'Valor_ICMS_Dif';
 ItensGrid.Cells[44,0] := 'Valor_BC_ST_Ret';
 ItensGrid.Cells[45,0] := 'Perc_ST';
 ItensGrid.Cells[46,0] := 'Valor_ICMS_Subst';
 ItensGrid.Cells[47,0] := 'Valor_ICMS_ST_Ret';
 ItensGrid.Cells[48,0] := 'Valor_BC_FCP_ST_Ret';
 ItensGrid.Cells[49,0] := 'Perc_FCP_ST_Ret';
 ItensGrid.Cells[50,0] := 'Valor_FCP_ST_Ret';
 ItensGrid.Cells[51,0] := 'Perc_Red_BC_Efet';
 ItensGrid.Cells[52,0] := 'Valor_BC_ICMS_Efet';
 ItensGrid.Cells[53,0] := 'Perc_ICMS_Efet';
 ItensGrid.Cells[54,0] := 'Valor_ICMS_Efet';
 ItensGrid.Cells[55,0] := 'Valor_BC_UF_Dest';
 ItensGrid.Cells[56,0] := 'Valor_ICMS_UF_Dest';
 ItensGrid.Cells[57,0] := 'Valor_Frete';
 ItensGrid.Cells[58,0] := 'Aliq_ICMS_UF_Dest';

 DUPLGrid.Cells[0,0] := 'Dt Emissão';
 DUPLGrid.Cells[1,0] := 'Vencimento';
 DUPLGrid.Cells[2,0] := 'Número';
 DUPLGrid.Cells[3,0] := 'Entidade';
 DUPLGrid.Cells[4,0] := 'Fatura';
 DUPLGrid.Cells[5,0] := 'Valor Total';
 DUPLGrid.Cells[6,0] := 'Moeda';
 DUPLGrid.Cells[7,0] := 'Valor Pago';
 DUPLGrid.Cells[8,0] := 'Parcela';
 DUPLGrid.Cells[9,0] := 'Valor Parcela';
end;

procedure TEntradaNFForm.ItensGridClick(Sender: TObject);
begin
 if ItensGrid.Row > 1 then begin
  EdtCSTICMS.Text := ItensGrid.Cells[9,ItensGrid.Row];
  EdtCSOSN.Text := ItensGrid.Cells[10,ItensGrid.Row];
  EdtpICMS.Text := ItensGrid.Cells[11,ItensGrid.Row];
  EdtvBCItem.Text := ItensGrid.Cells[12,ItensGrid.Row];
  EdtvICMSItem.Text := ItensGrid.Cells[13,ItensGrid.Row];
  EdtvICMSDesonItem.Text := ItensGrid.Cells[14,ItensGrid.Row];
  EdtvBCSTItem.Text := ItensGrid.Cells[15,ItensGrid.Row];
  EdtvICMSSTItem.Text := ItensGrid.Cells[16,ItensGrid.Row];
  EdtCSTIPI.Text := ItensGrid.Cells[17,ItensGrid.Row];
  EdtENQIPI.Text := ItensGrid.Cells[18,ItensGrid.Row];
  EdtpIPI.Text := ItensGrid.Cells[19,ItensGrid.Row];
  EdtvBCIPIItem.Text := ItensGrid.Cells[20,ItensGrid.Row];
  EdtvIPIItem.Text := ItensGrid.Cells[21,ItensGrid.Row];
  EdtCSTPIS.Text := ItensGrid.Cells[22,ItensGrid.Row];
  EdtpPIS.Text := ItensGrid.Cells[23,ItensGrid.Row];
  EdtvBCPISItem.Text := ItensGrid.Cells[24,ItensGrid.Row];
  EdtvPISItem.Text := ItensGrid.Cells[25,ItensGrid.Row];
  EdtCSTCOFINS.Text := ItensGrid.Cells[26,ItensGrid.Row];
  EdtpCOFINS.Text := ItensGrid.Cells[27,ItensGrid.Row];
  EdtvCOFINSItem.Text := ItensGrid.Cells[28,ItensGrid.Row];
  EdtvBCCOFINSItem.Text := ItensGrid.Cells[29,ItensGrid.Row];
  EdtvDescItem.Text := ItensGrid.Cells[30,ItensGrid.Row];
  EdtpFCPItem.Text := ItensGrid.Cells[31,ItensGrid.Row];
  EdtvFCPItem.Text := ItensGrid.Cells[32,ItensGrid.Row];
  EdtvBCFCPItem.Text := ItensGrid.Cells[33,ItensGrid.Row];
  EdtvBCFCPSTItem.Text := ItensGrid.Cells[34,ItensGrid.Row];
  EdtvFCPSTItem.Text := ItensGrid.Cells[35,ItensGrid.Row];
  EdtpFCPSTItem.Text := ItensGrid.Cells[36,ItensGrid.Row];
  EdtpMVASTItem.Text := ItensGrid.Cells[37,ItensGrid.Row];
  EdtpRedBCSTItem.Text := ItensGrid.Cells[38,ItensGrid.Row];
  EdtpICMSSTItem.Text := ItensGrid.Cells[39,ItensGrid.Row];
  EdtpRedBCItem.Text := ItensGrid.Cells[40,ItensGrid.Row];
  EdtpDifItem.Text := ItensGrid.Cells[41,ItensGrid.Row];
  EdtvICMSOpItem.Text := ItensGrid.Cells[42,ItensGrid.Row];
  EdtvICMSDifItem.Text := ItensGrid.Cells[43,ItensGrid.Row];
  EdtvBCSTRetItem.Text := ItensGrid.Cells[44,ItensGrid.Row];
  EdtpSTItem.Text := ItensGrid.Cells[45,ItensGrid.Row];
  EdtvICMSSubstitutoItem.Text := ItensGrid.Cells[46,ItensGrid.Row];
  EdtvICMSSTRetItem.Text := ItensGrid.Cells[47,ItensGrid.Row];
  EdtvBCFCPSTRetItem.Text := ItensGrid.Cells[48,ItensGrid.Row];
  EdtpFCPSTRetItem.Text := ItensGrid.Cells[49,ItensGrid.Row];
  EdtvFCPSTRetItem.Text := ItensGrid.Cells[50,ItensGrid.Row];
  EdtpRedBCEfetItem.Text := ItensGrid.Cells[51,ItensGrid.Row];
  EdtvBCEfetItem.Text := ItensGrid.Cells[52,ItensGrid.Row];
  EdtpICMSEfetItem.Text := ItensGrid.Cells[53,ItensGrid.Row];
  EdtvICMSEfetItem.Text := ItensGrid.Cells[54,ItensGrid.Row];
  EdtvBCUFDestItem.Text := ItensGrid.Cells[55,ItensGrid.Row];
  EdtvICMSUFDestItem.Text := ItensGrid.Cells[56,ItensGrid.Row];
  EdtvFreteItem.Text := ItensGrid.Cells[57,ItensGrid.Row];
 end;
end;

procedure TEntradaNFForm.btnIncluirClick(Sender: TObject);
begin
 btnIncluir.Visible := False;
 btnIncluirXML.Visible := False;
 btnExcluir.Visible := False;
 btnConsultar.Visible := False;
 btnAlterar.Visible := False;

 btnGravarIncluir.Visible := True;
 btnDesistir.Visible := True;

 EdtCodigoNatureza.Enabled := True;
 SBNatureza.Enabled := True;
 EdtCodigoDeposito.Enabled := True;
 SBDeposito.Enabled := True;
 EdtvProd.Enabled := True;
 EdtvFrete.Enabled := True;
 EdtvDesc.Enabled := True;
 EdtvSeg.Enabled := True;
 EdtvOutro.Enabled := True;
 EdtvBC.Enabled := True;
 EdtvICMS.Enabled := True;
 EdtvICMSDeson.Enabled := True;
 EdtvBcIPI.Enabled := True;
 EdtvIPI.Enabled := True;
 EdtvIPIDevol.Enabled := True;
 EdtvBcPIS.Enabled := True;
 EdtvPIS.Enabled := True;
 EdtvBcCOFINS.Enabled := True;
 EdtvCOFINS.Enabled := True;
 EdtvBCST.Enabled := True;
 EdtvST.Enabled := True;
 EdtvNF.Enabled := True;
 EdtCodigoMoeda.Enabled := True;
 SBMoeda.Enabled := True;
 EdtParcela1.Enabled := True;
 EdtParcela2.Enabled := True;
 EdtParcela4.Enabled := True;
 EdtParcela3.Enabled := True;
 EdtParcela7.Enabled := True;
 EdtParcela8.Enabled := True;
 EdtParcela5.Enabled := True;
 EdtParcela6.Enabled := True;
 DUPLGrid.Enabled := True;
 btnGerarDuplicata.Enabled := True;
 ItensGrid.Enabled := True;
 EdtpPIS.Enabled := True;
 EdtvPISItem.Enabled := True;
 EdtvBCIPIItem.Enabled := True;
 EdtvIPIItem.Enabled := True;
 EdtvBCItem.Enabled := True;
 EdtvICMSItem.Enabled := True;
 EdtvICMSDesonItem.Enabled := True;
 EdtvBCSTItem.Enabled := True;
 EdtvICMSSTItem.Enabled := True;
 EdtpICMS.Enabled := True;
 EdtCSTICMS.Enabled := True;
 SBCSTICMS.Enabled := True;
 SBCSOSN.Enabled := True;
 EdtCSTIPI.Enabled := True;
 SBCSTIPI.Enabled := True;
 EdtEnqIPI.Enabled := True;
 SBEnqIPI.Enabled := True;
 EdtpIPI.Enabled := True;
 EdtvIPIItem.Enabled := True;
 EdtvBCIPIItem.Enabled := True;
 EdtvBCPISItem.Enabled := True;
 EdtCSTPIS.Enabled := True;
 SBCSTPIS.Enabled := True;
 SBCSTCOFINS.Enabled := True;
 EdtCSTCOFINS.Enabled := True;
 EdtvBCCOFINSItem.Enabled := True;
 EdtpCOFINS.Enabled := True;
 EdtvCOFINSItem.Enabled := True;
 EdtDtEntrada.Enabled := True;
 EdtvFCP.Enabled := True;
 EdtvFCPST.Enabled := True;
 EdtvFCPSTRet.Enabled := True;
 EdtValorPago.Enabled := True;
 EdtvBCUFDest.Enabled := True;
 EdtvBCFCPUFDest.Enabled := True;
 EdtpFCPUFDest.Enabled := True;
 EdtpICMSUFDest.Enabled := True;
 EdtvICMSUFDest.Enabled := True;
 EdtvBCUFDestItem.Enabled := True;
 EdtvICMSUFDestItem.Enabled := True;
 EdtvBCFCPItem.Enabled := True;
 EdtpFCPItem.Enabled := True;
 EdtvFCPItem.Enabled := True;
 EdtvBCFCPSTItem.Enabled := True;
 EdtpFCPSTItem.Enabled := True;
 EdtvFCPSTItem.Enabled := True;
 EdtvBCFCPSTRetItem.Enabled := True;
 EdtpFCPSTRetItem.Enabled := True;
 EdtvFCPSTRetItem.Enabled := True;
 EdtpDifItem.Enabled := True;
 EdtvBCEfetItem.Enabled := True;
 EdtvBCSTItem.Enabled := True;
 EdtpSTItem.Enabled := True;
 EdtvBCSTRetItem.Enabled := True;
 EdtvICMSSTItem.Enabled := True;
 EdtvICMSDifItem.Enabled := True;
 EdtvICMSSubstitutoItem.Enabled := True;
 EdtvICMSSTRetItem.Enabled := True;
 EdtpSTItem.Enabled := True;
 EdtpRedBCEfetItem.Enabled := True;
 EdtpICMSEfetItem.Enabled := True;
 EdtvICMSEfetItem.Enabled := True;
 EdtpMVASTItem.Enabled := True;
 EdtpRedBCSTItem.Enabled := True;
 EdtpRedBCItem.Enabled := True;
 EdtvICMSOpItem.Enabled := True;
 EdtCSOSN.Enabled := True;
 EdtpICMSSTItem.Enabled := True;
 EdtCodigoEntidade.Enabled := True;
 EdtnNF.Enabled := True;
 EdtSerie.Enabled := True;
 EdtMod.Enabled := True;
 SBEntidade.Enabled := True;
 EdtChaveNFE.Enabled := True;
 BtnChaveNFE.Enabled := True;
 EdtDtEmissao.Enabled := True;
 EdtvFreteItem.Enabled := True;
 EdtvDescItem.Enabled := True;
end;

procedure TEntradaNFForm.btnAlterarClick(Sender: TObject);
begin
 btnIncluir.Visible := False;
 btnIncluirXML.Visible := False;
 btnExcluir.Visible := False;
 btnConsultar.Visible := False;
 btnAlterar.Visible := False;

 btnGravarAlterar.Visible := True;
 btnDesistir.Visible := True;

 EdtCodigoNatureza.Enabled := True;
 SBNatureza.Enabled := True;
 EdtCodigoDeposito.Enabled := True;
 SBDeposito.Enabled := True;
 EdtvProd.Enabled := True;
 EdtvFrete.Enabled := True;
 EdtvDesc.Enabled := True;
 EdtvSeg.Enabled := True;
 EdtvOutro.Enabled := True;
 EdtvBC.Enabled := True;
 EdtvICMS.Enabled := True;
 EdtvICMSDeson.Enabled := True;
 EdtvBcIPI.Enabled := True;
 EdtvIPI.Enabled := True;
 EdtvIPIDevol.Enabled := True;
 EdtvBcPIS.Enabled := True;
 EdtvPIS.Enabled := True;
 EdtvBcCOFINS.Enabled := True;
 EdtvCOFINS.Enabled := True;
 EdtvBCST.Enabled := True;
 EdtvST.Enabled := True;
 EdtvNF.Enabled := True;
 EdtCodigoMoeda.Enabled := True;
 SBMoeda.Enabled := True;
 EdtParcela1.Enabled := True;
 EdtParcela2.Enabled := True;
 EdtParcela4.Enabled := True;
 EdtParcela3.Enabled := True;
 EdtParcela7.Enabled := True;
 EdtParcela8.Enabled := True;
 EdtParcela5.Enabled := True;
 EdtParcela6.Enabled := True;
 DUPLGrid.Enabled := True;
 btnGerarDuplicata.Enabled := True;
 ItensGrid.Enabled := True;
 EdtpPIS.Enabled := True;
 EdtvPISItem.Enabled := True;
 EdtvBCIPIItem.Enabled := True;
 EdtvIPIItem.Enabled := True;
 EdtvBCItem.Enabled := True;
 EdtvICMSItem.Enabled := True;
 EdtvICMSDesonItem.Enabled := True;
 EdtvBCSTItem.Enabled := True;
 EdtvICMSSTItem.Enabled := True;
 EdtpICMS.Enabled := True;
 EdtCSTICMS.Enabled := True;
 SBCSTICMS.Enabled := True;
 SBCSOSN.Enabled := True;
 EdtCSTIPI.Enabled := True;
 SBCSTIPI.Enabled := True;
 EdtEnqIPI.Enabled := True;
 SBEnqIPI.Enabled := True;
 EdtpIPI.Enabled := True;
 EdtvIPIItem.Enabled := True;
 EdtvBCIPIItem.Enabled := True;
 EdtvBCPISItem.Enabled := True;
 EdtCSTPIS.Enabled := True;
 SBCSTPIS.Enabled := True;
 SBCSTCOFINS.Enabled := True;
 EdtCSTCOFINS.Enabled := True;
 EdtvBCCOFINSItem.Enabled := True;
 EdtpCOFINS.Enabled := True;
 EdtvCOFINSItem.Enabled := True;
 EdtDtEntrada.Enabled := True;
 EdtvFCP.Enabled := True;
 EdtvFCPST.Enabled := True;
 EdtvFCPSTRet.Enabled := True;
 EdtValorPago.Enabled := True;
 EdtvBCUFDest.Enabled := True;
 EdtvBCFCPUFDest.Enabled := True;
 EdtpFCPUFDest.Enabled := True;
 EdtpICMSUFDest.Enabled := True;
 EdtvICMSUFDest.Enabled := True;
 EdtvBCUFDestItem.Enabled := True;
 EdtvICMSUFDestItem.Enabled := True;
 EdtvBCFCPItem.Enabled := True;
 EdtpFCPItem.Enabled := True;
 EdtvFCPItem.Enabled := True;
 EdtvBCFCPSTItem.Enabled := True;
 EdtpFCPSTItem.Enabled := True;
 EdtvFCPSTItem.Enabled := True;
 EdtvBCFCPSTRetItem.Enabled := True;
 EdtpFCPSTRetItem.Enabled := True;
 EdtvFCPSTRetItem.Enabled := True;
 EdtpDifItem.Enabled := True;
 EdtvBCEfetItem.Enabled := True;
 EdtvBCSTItem.Enabled := True;
 EdtpSTItem.Enabled := True;
 EdtvBCSTRetItem.Enabled := True;
 EdtvICMSSTItem.Enabled := True;
 EdtvICMSDifItem.Enabled := True;
 EdtvICMSSubstitutoItem.Enabled := True;
 EdtvICMSSTRetItem.Enabled := True;
 EdtpSTItem.Enabled := True;
 EdtpRedBCEfetItem.Enabled := True;
 EdtpICMSEfetItem.Enabled := True;
 EdtvICMSEfetItem.Enabled := True;
 EdtpMVASTItem.Enabled := True;
 EdtpRedBCSTItem.Enabled := True;
 EdtpRedBCItem.Enabled := True;
 EdtvICMSOpItem.Enabled := True;
 EdtCSOSN.Enabled := True;
 EdtpICMSSTItem.Enabled := True;
 EdtvFreteItem.Enabled := True;
 EdtvDescItem.Enabled := True;
end;

procedure TEntradaNFForm.btnDesistirClick(Sender: TObject);
begin
 btnIncluir.Visible := True;
 btnIncluirXML.Visible := True;
 btnAlterar.Visible := True;
 btnConsultar.Visible := True;
 btnExcluir.Visible := True;

 btnGravarAlterar.Visible := False;
 btnGravarIncluir.Visible := False;
 btnDesistir.Visible := False;

 EdtCodigoNatureza.Enabled := False;
 SBNatureza.Enabled := False;
 EdtCodigoDeposito.Enabled := False;
 SBDeposito.Enabled := False;
 EdtvProd.Enabled := False;
 EdtvFrete.Enabled := False;
 EdtvDesc.Enabled := False;
 EdtvSeg.Enabled := False;
 EdtvOutro.Enabled := False;
 EdtvBC.Enabled := False;
 EdtvICMS.Enabled := False;
 EdtvICMSDeson.Enabled := False;
 EdtvBcIPI.Enabled := False;
 EdtvIPI.Enabled := False;
 EdtvIPIDevol.Enabled := False;
 EdtvBcPIS.Enabled := False;
 EdtvPIS.Enabled := False;
 EdtvBcCOFINS.Enabled := False;
 EdtvCOFINS.Enabled := False;
 EdtvBCST.Enabled := False;
 EdtvST.Enabled := False;
 EdtvNF.Enabled := False;
 EdtCodigoMoeda.Enabled := False;
 SBMoeda.Enabled := False;
 EdtParcela1.Enabled := False;
 EdtParcela2.Enabled := False;
 EdtParcela4.Enabled := False;
 EdtParcela3.Enabled := False;
 EdtParcela7.Enabled := False;
 EdtParcela8.Enabled := False;
 EdtParcela5.Enabled := False;
 EdtParcela6.Enabled := False;
 DUPLGrid.Enabled := False;
 btnGerarDuplicata.Enabled := False;
 ItensGrid.Enabled := False;
 EdtpPIS.Enabled := False;
 EdtvPISItem.Enabled := False;
 EdtvBCIPIItem.Enabled := False;
 EdtvIPIItem.Enabled := False;
 EdtvBCItem.Enabled := False;
 EdtvICMSItem.Enabled := False;
 EdtvICMSDesonItem.Enabled := False;
 EdtvBCSTItem.Enabled := False;
 EdtvICMSSTItem.Enabled := False;
 EdtpICMS.Enabled := False;
 EdtCSTICMS.Enabled := False;
 SBCSTICMS.Enabled := False;
 SBCSOSN.Enabled := False;
 EdtCSTIPI.Enabled := False;
 SBCSTIPI.Enabled := False;
 EdtEnqIPI.Enabled := False;
 SBEnqIPI.Enabled := False;
 EdtpIPI.Enabled := False;
 EdtvIPIItem.Enabled := False;
 EdtvBCIPIItem.Enabled := False;
 EdtvBCPISItem.Enabled := False;
 EdtCSTPIS.Enabled := False;
 SBCSTPIS.Enabled := False;
 SBCSTCOFINS.Enabled := False;
 EdtCSTCOFINS.Enabled := False;
 EdtvBCCOFINSItem.Enabled := False;
 EdtpCOFINS.Enabled := False;
 EdtvCOFINSItem.Enabled := False;
 EdtDtEntrada.Enabled := False;
 EdtvFCP.Enabled := False;
 EdtvFCPST.Enabled := False;
 EdtvFCPSTRet.Enabled := False;
 EdtValorPago.Enabled := False;
 EdtvBCUFDest.Enabled := False;
 EdtvBCFCPUFDest.Enabled := False;
 EdtpFCPUFDest.Enabled := False;
 EdtpICMSUFDest.Enabled := False;
 EdtvICMSUFDest.Enabled := False;
 EdtvBCUFDestItem.Enabled := False;
 EdtvICMSUFDestItem.Enabled := False;
 EdtvBCFCPItem.Enabled := False;
 EdtpFCPItem.Enabled := False;
 EdtvFCPItem.Enabled := False;
 EdtvBCFCPSTItem.Enabled := False;
 EdtpFCPSTItem.Enabled := False;
 EdtvFCPSTItem.Enabled := False;
 EdtvBCFCPSTRetItem.Enabled := False;
 EdtpFCPSTRetItem.Enabled := False;
 EdtvFCPSTRetItem.Enabled := False;
 EdtpDifItem.Enabled := False;
 EdtvBCEfetItem.Enabled := False;
 EdtvBCSTItem.Enabled := False;
 EdtpSTItem.Enabled := False;
 EdtvBCSTRetItem.Enabled := False;
 EdtvICMSSTItem.Enabled := False;
 EdtvICMSDifItem.Enabled := False;
 EdtvICMSSubstitutoItem.Enabled := False;
 EdtvICMSSTRetItem.Enabled := False;
 EdtpSTItem.Enabled := False;
 EdtpRedBCEfetItem.Enabled := False;
 EdtpICMSEfetItem.Enabled := False;
 EdtvICMSEfetItem.Enabled := False;
 EdtpMVASTItem.Enabled := False;
 EdtpRedBCSTItem.Enabled := False;
 EdtpRedBCItem.Enabled := False;
 EdtvICMSOpItem.Enabled := False;
 EdtCSOSN.Enabled := False;
 EdtpICMSSTItem.Enabled := False;
 EdtCodigoEntidade.Enabled := False;
 EdtvFreteItem.Enabled := False;
 EdtvDescItem.Enabled := False;

 EdtCodigoNatureza.Clear;
 EdtCodigoDeposito.Clear;
 EdtvProd.Clear;
 EdtvFrete.Clear;
 EdtvDesc.Clear;
 EdtvSeg.Clear;
 EdtvOutro.Clear;
 EdtvBC.Clear;
 EdtvICMS.Clear;
 EdtvICMSDeson.Clear;
 EdtvBcIPI.Clear;
 EdtvIPI.Clear;
 EdtvIPIDevol.Clear;
 EdtvBcPIS.Clear;
 EdtvPIS.Clear;
 EdtvBcCOFINS.Clear;
 EdtvCOFINS.Clear;
 EdtvBCST.Clear;
 EdtvST.Clear;
 EdtvNF.Clear;
 EdtCodigoMoeda.Clear;
 EdtParcela1.Clear;
 EdtParcela2.Clear;
 EdtParcela4.Clear;
 EdtParcela3.Clear;
 EdtParcela7.Clear;
 EdtParcela8.Clear;
 EdtParcela5.Clear;
 EdtParcela6.Clear;
 EdtpPIS.Clear;
 EdtvPISItem.Clear;
 EdtvBCIPIItem.Clear;
 EdtvIPIItem.Clear;
 EdtvBCItem.Clear;
 EdtvICMSItem.Clear;
 EdtvICMSDesonItem.Clear;
 EdtvBCSTItem.Clear;
 EdtvICMSSTItem.Clear;
 EdtpICMS.Clear;
 EdtCSTICMS.Clear;
 EdtCSTIPI.Clear;
 EdtEnqIPI.Clear;
 EdtpIPI.Clear;
 EdtvIPIItem.Clear;
 EdtvBCIPIItem.Clear;
 EdtvBCPISItem.Clear;
 EdtCSTPIS.Clear;
 EdtCSTCOFINS.Clear;
 EdtvBCCOFINSItem.Clear;
 EdtpCOFINS.Clear;
 EdtvCOFINSItem.Clear;
 EdtvFCP.Clear;
 EdtvFCPST.Clear;
 EdtvFCPSTRet.Clear;
 EdtValorPago.Clear;
 EdtvBCUFDest.Clear;
 EdtvBCFCPUFDest.Clear;
 EdtpFCPUFDest.Clear;
 EdtpICMSUFDest.Clear;
 EdtvICMSUFDest.Clear;
 EdtvBCUFDestItem.Clear;
 EdtvICMSUFDestItem.Clear;
 EdtvBCFCPItem.Clear;
 EdtpFCPItem.Clear;
 EdtvFCPItem.Clear;
 EdtvBCFCPSTItem.Clear;
 EdtpFCPSTItem.Clear;
 EdtvFCPSTItem.Clear;
 EdtvBCFCPSTRetItem.Clear;
 EdtpFCPSTRetItem.Clear;
 EdtvFCPSTRetItem.Clear;
 EdtpDifItem.Clear;
 EdtvBCEfetItem.Clear;
 EdtvBCSTItem.Clear;
 EdtpSTItem.Clear;
 EdtvBCSTRetItem.Clear;
 EdtvICMSSTItem.Clear;
 EdtvICMSDifItem.Clear;
 EdtvICMSSubstitutoItem.Clear;
 EdtvICMSSTRetItem.Clear;
 EdtpSTItem.Clear;
 EdtpRedBCEfetItem.Clear;
 EdtpICMSEfetItem.Clear;
 EdtvICMSEfetItem.Clear;
 EdtpMVASTItem.Clear;
 EdtpRedBCSTItem.Clear;
 EdtpRedBCItem.Clear;
 EdtvICMSOpItem.Clear;
 EdtCSOSN.Clear;
 EdtpICMSSTItem.Clear;
 EdtCodigoEntidade.Clear;
 EdtvFreteItem.Clear;
 EdtvDescItem.Clear;
end;

procedure TEntradaNFForm.btnIncluirXMLClick(Sender: TObject);
var XMLDoc: IXMLDocument;
    XML, NFe, InfNFe, Ide, emit, EnderEmit, det,
    prod, imposto,
    ICMS, ICMS00, ICMS10, ICMS20, ICMS30, ICMS40, ICMS51, ICMS60, ICMS70, ICMS90,
    ICMSSN101, ICMSSN102, ICMSSN201, ICMSSN202, ICMSSN500, ICMSSN900,
    ICMSUFDest,
    IPI, IPITrib, IPINT,
    PIS, PISAliq, PISNT, PISOutr,
    COFINS, COFINSNT, COFINSAliq, COFINSOutr,
    total, ICMSTot, protNFe, infProt: IXMLNode;
    i, row: integer;
    ValorBCIPI, ValorBCPIS, ValorBCCOFINS, ValorBCDIFAL, ValorAliquotaDIFAL, ValorBCFCP, ValorAliquotaFCP: Double;
    codigo: string;
begin
 with TOpenDialog.Create(nil) do
  try
   Filter := 'Arquivos XML|*.xml';
   DefaultExt := 'xml';
   Options := [ofFileMustExist, ofEnableSizing];

   if Execute then begin
    btnIncluir.Visible := False;
    btnIncluirXML.Visible := False;
    btnExcluir.Visible := False;
    btnConsultar.Visible := False;
    btnAlterar.Visible := False;

    btnGravarIncluir.Visible := True;
    btnDesistir.Visible := True;

    EdtCodigoNatureza.Enabled := True;
    SBNatureza.Enabled := True;
    EdtCodigoDeposito.Enabled := True;
    SBDeposito.Enabled := True;
    EdtvProd.Enabled := True;
    EdtvFrete.Enabled := True;
    EdtvDesc.Enabled := True;
    EdtvSeg.Enabled := True;
    EdtvOutro.Enabled := True;
    EdtvBC.Enabled := True;
    EdtvICMS.Enabled := True;
    EdtvICMSDeson.Enabled := True;
    EdtvBcIPI.Enabled := True;
    EdtvIPI.Enabled := True;
    EdtvIPIDevol.Enabled := True;
    EdtvBcPIS.Enabled := True;
    EdtvPIS.Enabled := True;
    EdtvBcCOFINS.Enabled := True;
    EdtvCOFINS.Enabled := True;
    EdtvBCST.Enabled := True;
    EdtvST.Enabled := True;
    EdtvNF.Enabled := True;
    EdtCodigoMoeda.Enabled := True;
    SBMoeda.Enabled := True;
    EdtParcela1.Enabled := True;
    EdtParcela2.Enabled := True;
    EdtParcela4.Enabled := True;
    EdtParcela3.Enabled := True;
    EdtParcela7.Enabled := True;
    EdtParcela8.Enabled := True;
    EdtParcela5.Enabled := True;
    EdtParcela6.Enabled := True;
    DUPLGrid.Enabled := True;
    btnGerarDuplicata.Enabled := True;
    ItensGrid.Enabled := True;
    EdtpPIS.Enabled := True;
    EdtvPISItem.Enabled := True;
    EdtvBCIPIItem.Enabled := True;
    EdtvIPIItem.Enabled := True;
    EdtvBCItem.Enabled := True;
    EdtvICMSItem.Enabled := True;
    EdtvICMSDesonItem.Enabled := True;
    EdtvBCSTItem.Enabled := True;
    EdtvICMSSTItem.Enabled := True;
    EdtpICMS.Enabled := True;
    EdtCSTICMS.Enabled := True;
    SBCSTICMS.Enabled := True;
    SBCSOSN.Enabled := True;
    EdtCSTIPI.Enabled := True;
    SBCSTIPI.Enabled := True;
    EdtEnqIPI.Enabled := True;
    SBEnqIPI.Enabled := True;
    EdtpIPI.Enabled := True;
    EdtvIPIItem.Enabled := True;
    EdtvBCIPIItem.Enabled := True;
    EdtvBCPISItem.Enabled := True;
    EdtCSTPIS.Enabled := True;
    SBCSTPIS.Enabled := True;
    SBCSTCOFINS.Enabled := True;
    EdtCSTCOFINS.Enabled := True;
    EdtvBCCOFINSItem.Enabled := True;
    EdtpCOFINS.Enabled := True;
    EdtvCOFINSItem.Enabled := True;
    EdtDtEntrada.Enabled := True;
    EdtvFCP.Enabled := True;
    EdtvFCPST.Enabled := True;
    EdtvFCPSTRet.Enabled := True;
    EdtValorPago.Enabled := True;
    EdtvBCUFDest.Enabled := True;
    EdtvBCFCPUFDest.Enabled := True;
    EdtpFCPUFDest.Enabled := True;
    EdtpICMSUFDest.Enabled := True;
    EdtvICMSUFDest.Enabled := True;
    EdtvBCUFDestItem.Enabled := True;
    EdtvICMSUFDestItem.Enabled := True;
    EdtvBCFCPItem.Enabled := True;
    EdtpFCPItem.Enabled := True;
    EdtvFCPItem.Enabled := True;
    EdtvBCFCPSTItem.Enabled := True;
    EdtpFCPSTItem.Enabled := True;
    EdtvFCPSTItem.Enabled := True;
    EdtvBCFCPSTRetItem.Enabled := True;
    EdtpFCPSTRetItem.Enabled := True;
    EdtvFCPSTRetItem.Enabled := True;
    EdtpDifItem.Enabled := True;
    EdtvBCEfetItem.Enabled := True;
    EdtvBCSTItem.Enabled := True;
    EdtpSTItem.Enabled := True;
    EdtvBCSTRetItem.Enabled := True;
    EdtvICMSSTItem.Enabled := True;
    EdtvICMSDifItem.Enabled := True;
    EdtvICMSSubstitutoItem.Enabled := True;
    EdtvICMSSTRetItem.Enabled := True;
    EdtpSTItem.Enabled := True;
   	EdtpRedBCEfetItem.Enabled := True;
    EdtpICMSEfetItem.Enabled := True;
    EdtvICMSEfetItem.Enabled := True;
    EdtpMVASTItem.Enabled := True;
    EdtpRedBCSTItem.Enabled := True;
  	EdtpRedBCItem.Enabled := True;
    EdtvICMSOpItem.Enabled := True;
    EdtCSOSN.Enabled := True;
    EdtpICMSSTItem.Enabled := True;
    EdtCodigoEntidade.Enabled := True;
    EdtvFreteItem.Enabled := True;
    EdtvDescItem.Enabled := True;

    XMLDoc := TXMLDocument.Create(nil);
    XMLDoc.LoadFromFile(FileName);
    XMLDoc.Active := True;

    XML := XMLDoc.DocumentElement;
    if not Assigned(XML) then Abort;

    NFe := XML.ChildNodes.FindNode('NFe');
    InfNFe := NFe.ChildNodes.FindNode('infNFe');
    Ide := InfNFe.ChildNodes.FindNode('ide');
    emit := InfNFe.ChildNodes.FindNode('emit');
    EnderEmit := Emit.ChildNodes.FindNode('enderEmit');
    det := InfNFe.ChildNodes.FindNode('det');
    total := infNFe.ChildNodes.FindNode('total');
    ICMSTot := total.ChildNodes.FindNode('ICMSTot');
    protNFe := XML.ChildNodes.FindNode('protNFe');
    infProt := protNFe.ChildNodes.FindNode('infProt');

    // POPULAR CAMPOS

    EdtNNF.Text := Ide.ChildNodes['nNF'].Text;
    EdtMod.Text := Ide.ChildNodes['mod'].Text;
    EdtSerie.Text := Ide.ChildNodes['serie'].Text;

    with CadEntidadeDM.qrySelect do
    begin
     SQL.Clear;
     SQL.Add('select * from cadentidade where cpf = :CNPJ');
     Parambyname('CNPJ').AsString := Emit.ChildNodes['CNPJ'].Text;
     Open;

     if IsEmpty then begin
      ShowMessage('Emitente da NF-e não cadastrado no sistema, cadastrando automaticamente!');

      SQL.Clear;
      SQL.Add('select max(cast(codigo as integer)) + 1 as codigo from cadentidade');
      Open;

      codigo := FieldByName('codigo').AsString;

      with CadEntidadeDM.qryInsert do
      begin
       SQL.Clear;
       SQL.Add('insert into cadentidade (codigo, nome, ativo, cpf, telefone, consumidor_final, rua, numero, estado, bairro, cidade, pais,');
       SQL.Add('cep, ie, tipo, fantasia)');
       SQL.Add('values');
       SQL.Add('(:codigo, :nome, :ativo, :cpf, :telefone, :consumidor_final, :rua, :numero, :estado, :bairro, :cidade, :pais,');
       SQL.Add(':cep, :ie, :tipo, :fantasia)');

       ParamByName('codigo').AsString := codigo;
       ParamByName('nome').AsString := Emit.ChildNodes['xNome'].Text;
       ParamByName('ativo').AsString := 'S';
       ParamByName('cpf').AsString := Emit.ChildNodes['CNPJ'].Text;
       ParamByName('telefone').AsString := EnderEmit.ChildNodes['fone'].Text;
       ParamByName('consumidor_final').AsString := 'N';
       ParamByName('rua').AsString := EnderEmit.ChildNodes['xLgr'].Text;
       ParamByName('numero').AsString := EnderEmit.ChildNodes['nro'].Text;
       ParamByName('estado').AsString := EnderEmit.ChildNodes['UF'].Text;
       ParamByName('bairro').AsString := EnderEmit.ChildNodes['xBairro'].Text;
       ParamByName('cidade').AsString := EnderEmit.ChildNodes['cMun'].Text;
       ParamByName('pais').AsString := EnderEmit.ChildNodes['cPais'].Text;
       ParamByName('cep').AsString := EnderEmit.ChildNodes['CEP'].Text;
       ParamByName('ie').AsString := Emit.ChildNodes['IE'].Text;
       ParamByName('tipo').AsString := '1';
       ParamByName('fantasia').AsString := Emit.ChildNodes['xFant'].Text;
       ExecSQL;
       ShowMessage('Cadastrado com sucesso, favor verificar o cadastro após finalizar a nota, a fim de evitar problemas fiscais!');
      end;
     end;
    end;

    EdtCodigoEntidade.Text := codigo;
    EdtChaveNFE.Text := infProt.ChildNodes['chNFe'].Text;
    EdtDtEmissao.Date := ISO8601ToDate(Ide.ChildNodes['dhEmi'].Text);
    EdtdtEntrada.Date := Now;

    for i := 0 to NFe.ChildNodes['infNFe'].ChildNodes.Count - 1 do
    begin
     det := NFe.ChildNodes['infNFe'].ChildNodes[i];
     if Det.NodeName = 'det' then begin
      prod := det.ChildNodes.FindNode('prod');
      imposto := det.ChildNodes.FindNode('imposto');

      ItensGrid.RowCount := ItensGrid.RowCount + 1;
      row := ItensGrid.RowCount - 1;
      ItensGrid.Cells[0,row] := prod.ChildNodes['cProd'].Text;
      ItensGrid.Cells[5,row] := prod.ChildNodes['qCom'].Text;
      ItensGrid.Cells[6,row] := prod.ChildNodes['vUnCom'].Text;
      ItensGrid.Cells[7,row] := prod.ChildNodes['vProd'].Text;
      if Assigned(prod.ChildNodes.FindNode('vDesc')) then ItensGrid.Cells[30,row] := prod.ChildNodes['vDesc'].Text else ItensGrid.Cells[30,row] := '0.00';
      if Assigned(prod.ChildNodes.FindNode('vFrete')) then ItensGrid.Cells[57,row] := prod.ChildNodes['vFrete'].Text else ItensGrid.Cells[57,row] := '0.00';

      // ICMS

      ICMS := imposto.ChildNodes.FindNode('ICMS');
      ICMS00 := ICMS.ChildNodes.FindNode('ICMS00');
      if Assigned(ICMS00) then begin
       if Assigned(ICMS00.ChildNodes.FindNode('CST')) then ItensGrid.Cells[9,row] := ICMS00.ChildNodes['CST'].Text; // CST ICMS
       if Assigned(ICMS00.ChildNodes.FindNode('pICMS')) then ItensGrid.Cells[11,row] := ICMS00.ChildNodes['pICMS'].Text; // ALIQUOTA ICMS
       if Assigned(ICMS00.ChildNodes.FindNode('vBC')) then ItensGrid.Cells[12,row] := ICMS00.ChildNodes['vBC'].Text; // BASE ICMS
       if Assigned(ICMS00.ChildNodes.FindNode('vICMS')) then ItensGrid.Cells[13,row] := ICMS00.ChildNodes['vICMS'].Text; // VALOR ICMS
       ItensGrid.Cells[14,row] := '0.00'; // VALOR ICMS DESONERADO
       ItensGrid.Cells[15,row] := '0.00'; // BASE ICMS ST
       ItensGrid.Cells[16,row] := '0.00'; // VALOR ICMS ST
       ItensGrid.Cells[30,row] := '0.00';
       ItensGrid.Cells[34,row] := '0.00';
       ItensGrid.Cells[35,row] := '0.00';
       ItensGrid.Cells[36,row] := '0.00';
       ItensGrid.Cells[37,row] := '0.00';
       ItensGrid.Cells[38,row] := '0.00';
       ItensGrid.Cells[39,row] := '0.00';
       ItensGrid.Cells[40,row] := '0.00';
       ItensGrid.Cells[41,row] := '0.00';
       ItensGrid.Cells[42,row] := '0.00';
       ItensGrid.Cells[43,row] := '0.00';
       ItensGrid.Cells[44,row] := '0.00';
       ItensGrid.Cells[45,row] := '0.00';
       ItensGrid.Cells[46,row] := '0.00';
       ItensGrid.Cells[47,row] := '0.00';
       ItensGrid.Cells[48,row] := '0.00';
       ItensGrid.Cells[49,row] := '0.00';
       ItensGrid.Cells[50,row] := '0.00';
       ItensGrid.Cells[51,row] := '0.00';
       ItensGrid.Cells[52,row] := '0.00';
       ItensGrid.Cells[53,row] := '0.00';
       ItensGrid.Cells[54,row] := '0.00';
      end;

      ICMS10 := ICMS.ChildNodes.FindNode('ICMS10');
      if Assigned(ICMS10) then begin
       if Assigned(ICMS10.ChildNodes.FindNode('CST')) then ItensGrid.Cells[9,row] := ICMS10.ChildNodes['CST'].Text;
       if Assigned(ICMS10.ChildNodes.FindNode('pICMS')) then ItensGrid.Cells[11,row] := ICMS10.ChildNodes['pICMS'].Text;
       if Assigned(ICMS10.ChildNodes.FindNode('vBC')) then ItensGrid.Cells[12,row] := ICMS10.ChildNodes['vBC'].Text;
       if Assigned(ICMS10.ChildNodes.FindNode('vICMS')) then ItensGrid.Cells[13,row] := ICMS10.ChildNodes['vICMS'].Text;
       if Assigned(ICMS10.ChildNodes.FindNode('vBCST')) then ItensGrid.Cells[15,row] := ICMS10.ChildNodes['vBCST'].Text;
       if Assigned(ICMS10.ChildNodes.FindNode('vICMSST')) then ItensGrid.Cells[16,row] := ICMS10.ChildNodes['vICMSST'].Text;
       if Assigned(ICMS10.ChildNodes.FindNode('pMVAST')) then ItensGrid.Cells[37,row] := ICMS10.ChildNodes['pMVAST'].Text;
       if Assigned(ICMS10.ChildNodes.FindNode('pRedBCST')) then ItensGrid.Cells[38,row] := ICMS10.ChildNodes['pRedBCST'].Text;
       if Assigned(ICMS10.ChildNodes.FindNode('pICMSST')) then ItensGrid.Cells[39,row] := ICMS10.ChildNodes['pICMSST'].Text;
      end;

      ICMS20 := ICMS.ChildNodes.FindNode('ICMS20');
      if Assigned(ICMS20) then begin
       if Assigned(ICMS20.ChildNodes.FindNode('CST')) then ItensGrid.Cells[9,row] := ICMS20.ChildNodes['CST'].Text;
       if Assigned(ICMS20.ChildNodes.FindNode('pICMS')) then ItensGrid.Cells[11,row] := ICMS20.ChildNodes['pICMS'].Text;
       if Assigned(ICMS20.ChildNodes.FindNode('vBC')) then ItensGrid.Cells[12,row] := ICMS20.ChildNodes['vBC'].Text;
       if Assigned(ICMS20.ChildNodes.FindNode('vICMS')) then ItensGrid.Cells[13,row] := ICMS20.ChildNodes['vICMS'].Text;
       if Assigned(ICMS20.ChildNodes.FindNode('vICMSDeson')) then ItensGrid.Cells[14,row] := ICMS20.ChildNodes['vICMSDeson'].Text;
       if Assigned(ICMS20.ChildNodes.FindNode('pRedBC')) then ItensGrid.Cells[40,row] := ICMS20.ChildNodes['pRedBC'].Text;
      end;

      ICMS30 := ICMS.ChildNodes.FindNode('ICMS30');
      if Assigned(ICMS30) then begin
       if Assigned(ICMS30.ChildNodes.FindNode('CST')) then ItensGrid.Cells[9,row] := ICMS30.ChildNodes['CST'].Text;
       if Assigned(ICMS30.ChildNodes.FindNode('vICMSDeson')) then ItensGrid.Cells[14,row] := ICMS30.ChildNodes['vICMSDeson'].Text;
       if Assigned(ICMS30.ChildNodes.FindNode('vBCST')) then ItensGrid.Cells[15,row] := ICMS30.ChildNodes['vBCST'].Text;
       if Assigned(ICMS30.ChildNodes.FindNode('vICMSST')) then ItensGrid.Cells[16,row] := ICMS30.ChildNodes['vICMSST'].Text;
       if Assigned(ICMS30.ChildNodes.FindNode('pMVAST')) then ItensGrid.Cells[37,row] := ICMS30.ChildNodes['pMVAST'].Text;
       if Assigned(ICMS30.ChildNodes.FindNode('pRedBCST')) then ItensGrid.Cells[38,row] := ICMS30.ChildNodes['pRedBCST'].Text;
       if Assigned(ICMS30.ChildNodes.FindNode('pICMSST')) then ItensGrid.Cells[39,row] := ICMS30.ChildNodes['pICMSST'].Text;
      end;

      ICMS40 := ICMS.ChildNodes.FindNode('ICMS40');
      if Assigned(ICMS40) then begin
       if Assigned(ICMS40.ChildNodes.FindNode('CST')) then ItensGrid.Cells[9,row] := ICMS40.ChildNodes['CST'].Text;
       if Assigned(ICMS40.ChildNodes.FindNode('vICMSDeson')) then ItensGrid.Cells[14,row] := ICMS40.ChildNodes['vICMSDeson'].Text;
      end;

      ICMS51 := ICMS.ChildNodes.FindNode('ICMS51');
      if Assigned(ICMS51) then begin
       if Assigned(ICMS51.ChildNodes.FindNode('CST')) then ItensGrid.Cells[9,row] := ICMS51.ChildNodes['CST'].Text;
       if Assigned(ICMS51.ChildNodes.FindNode('pICMS')) then ItensGrid.Cells[11,row] := ICMS51.ChildNodes['pICMS'].Text;
       if Assigned(ICMS51.ChildNodes.FindNode('vBC')) then ItensGrid.Cells[12,row] := ICMS51.ChildNodes['vBC'].Text;
       if Assigned(ICMS51.ChildNodes.FindNode('vICMS')) then ItensGrid.Cells[13,row] := ICMS51.ChildNodes['vICMS'].Text;
       if Assigned(ICMS51.ChildNodes.FindNode('pRedBC')) then ItensGrid.Cells[40,row] := ICMS51.ChildNodes['pRedBC'].Text;
       if Assigned(ICMS51.ChildNodes.FindNode('pDif')) then ItensGrid.Cells[42,row] := ICMS51.ChildNodes['pDif'].Text;
       if Assigned(ICMS51.ChildNodes.FindNode('vICMSOp')) then ItensGrid.Cells[43,row] := ICMS51.ChildNodes['vICMSOp'].Text;
       if Assigned(ICMS51.ChildNodes.FindNode('vICMSDif')) then ItensGrid.Cells[44,row] := ICMS51.ChildNodes['vICMSDif'].Text;
      end;

      ICMS60 := ICMS.ChildNodes.FindNode('ICMS60');
      if Assigned(ICMS60) then begin
       if Assigned(ICMS60.ChildNodes.FindNode('CST')) then ItensGrid.Cells[9,row] := ICMS60.ChildNodes['CST'].Text;
       if Assigned(ICMS60.ChildNodes.FindNode('vBCSTRet')) then ItensGrid.Cells[44,row] := ICMS60.ChildNodes['vBCSTRet'].Text;
       if Assigned(ICMS60.ChildNodes.FindNode('pST')) then ItensGrid.Cells[45,row] := ICMS60.ChildNodes['pST'].Text;
       if Assigned(ICMS60.ChildNodes.FindNode('vICMSSubstituto')) then ItensGrid.Cells[46,row] := ICMS60.ChildNodes['vICMSSubstituto'].Text;
       if Assigned(ICMS60.ChildNodes.FindNode('vICMSSTRet')) then ItensGrid.Cells[47,row] := ICMS60.ChildNodes['vICMSSTRet'].Text;
       if Assigned(ICMS60.ChildNodes.FindNode('pRedBCEfet')) then ItensGrid.Cells[51,row] := ICMS60.ChildNodes['pRedBCEfet'].Text;
       if Assigned(ICMS60.ChildNodes.FindNode('vBCEfet')) then ItensGrid.Cells[52,row] := ICMS60.ChildNodes['vBCEfet'].Text;
       if Assigned(ICMS60.ChildNodes.FindNode('pICMSEfet')) then ItensGrid.Cells[53,row] := ICMS60.ChildNodes['pICMSEfet'].Text;
       if Assigned(ICMS60.ChildNodes.FindNode('vICMSEfet')) then ItensGrid.Cells[54,row] := ICMS60.ChildNodes['vICMSEfet'].Text;
      end;

      ICMS70 := ICMS.ChildNodes.FindNode('ICMS70');
      if Assigned(ICMS70) then begin
       if Assigned(ICMS70.ChildNodes.FindNode('CST')) then ItensGrid.Cells[9,row] := ICMS70.ChildNodes['CST'].Text;
       if Assigned(ICMS70.ChildNodes.FindNode('pICMS')) then ItensGrid.Cells[11,row] := ICMS70.ChildNodes['pICMS'].Text;
       if Assigned(ICMS70.ChildNodes.FindNode('vBC')) then ItensGrid.Cells[12,row] := ICMS70.ChildNodes['vBC'].Text;
       if Assigned(ICMS70.ChildNodes.FindNode('vICMS')) then ItensGrid.Cells[13,row] := ICMS70.ChildNodes['vICMS'].Text;
       if Assigned(ICMS70.ChildNodes.FindNode('vICMSDeson')) then ItensGrid.Cells[14,row] := ICMS70.ChildNodes['vICMSDeson'].Text;
       if Assigned(ICMS70.ChildNodes.FindNode('vBCST')) then ItensGrid.Cells[15,row] := ICMS70.ChildNodes['vBCST'].Text;
       if Assigned(ICMS70.ChildNodes.FindNode('vICMSST')) then ItensGrid.Cells[16,row] := ICMS70.ChildNodes['vICMSST'].Text;
       if Assigned(ICMS70.ChildNodes.FindNode('pMVAST')) then ItensGrid.Cells[37,row] := ICMS70.ChildNodes['pMVAST'].Text;
       if Assigned(ICMS70.ChildNodes.FindNode('pRedBCST')) then ItensGrid.Cells[38,row] := ICMS70.ChildNodes['pRedBCST'].Text;
       if Assigned(ICMS70.ChildNodes.FindNode('pICMSST')) then ItensGrid.Cells[39,row] := ICMS70.ChildNodes['pICMSST'].Text;
       if Assigned(ICMS70.ChildNodes.FindNode('pRedBC')) then ItensGrid.Cells[40,row] := ICMS70.ChildNodes['pRedBC'].Text;
      end;

      ICMS90 := ICMS.ChildNodes.FindNode('ICMS90');
      if Assigned(ICMS90) then begin
       if Assigned(ICMS90.ChildNodes.FindNode('CST')) then ItensGrid.Cells[9,row] := ICMS90.ChildNodes['CST'].Text;
       if Assigned(ICMS90.ChildNodes.FindNode('pICMS')) then ItensGrid.Cells[11,row] := ICMS90.ChildNodes['pICMS'].Text;
       if Assigned(ICMS90.ChildNodes.FindNode('vBC')) then ItensGrid.Cells[12,row] := ICMS90.ChildNodes['vBC'].Text;
       if Assigned(ICMS90.ChildNodes.FindNode('vICMS')) then ItensGrid.Cells[13,row] := ICMS90.ChildNodes['vICMS'].Text;
       if Assigned(ICMS90.ChildNodes.FindNode('vICMSDeson')) then ItensGrid.Cells[14,row] := ICMS90.ChildNodes['vICMSDeson'].Text;
       if Assigned(ICMS90.ChildNodes.FindNode('vBCST')) then ItensGrid.Cells[15,row] := ICMS90.ChildNodes['vBCST'].Text;
       if Assigned(ICMS90.ChildNodes.FindNode('vICMSST')) then ItensGrid.Cells[16,row] := ICMS90.ChildNodes['vICMSST'].Text;
       if Assigned(ICMS90.ChildNodes.FindNode('pMVAST')) then ItensGrid.Cells[37,row] := ICMS90.ChildNodes['pMVAST'].Text;
       if Assigned(ICMS90.ChildNodes.FindNode('pRedBCST')) then ItensGrid.Cells[38,row] := ICMS90.ChildNodes['pRedBCST'].Text;
       if Assigned(ICMS90.ChildNodes.FindNode('pICMSST')) then ItensGrid.Cells[39,row] := ICMS90.ChildNodes['pICMSST'].Text;
       if Assigned(ICMS90.ChildNodes.FindNode('pRedBC')) then ItensGrid.Cells[40,row] := ICMS90.ChildNodes['pRedBC'].Text;
      end;

      // IPI

      IPI := imposto.ChildNodes.FindNode('IPI');
      if Assigned(IPI) then begin
       if Assigned(IPI.ChildNodes.FindNode('cEnq')) then ItensGrid.Cells[18,row] := IPI.ChildNodes['cEnq'].Text;
      end;

      IPINT := IPI.ChildNodes.FindNode('IPINT');
      if Assigned(IPINT) then begin
       if Assigned(IPINT.ChildNodes.FindNode('CST')) then ItensGrid.Cells[17,row] := IPINT.ChildNodes['CST'].Text;
       ItensGrid.Cells[19,row] := '0.00';
       ItensGrid.Cells[20,row] := '0.00';
       ItensGrid.Cells[21,row] := '0.00';
      end;

      IPITrib := IPI.ChildNodes.FindNode('IPITrib');
      if Assigned(IPITrib) then begin
       if Assigned(IPITrib.ChildNodes.FindNode('CST')) then ItensGrid.Cells[17,row] := IPITrib.ChildNodes['CST'].Text;
       if Assigned(IPITrib.ChildNodes.FindNode('pIPI')) then ItensGrid.Cells[19,row] := IPITrib.ChildNodes['pIPI'].Text;
       if Assigned(IPITrib.ChildNodes.FindNode('vBC')) then ItensGrid.Cells[20,row] := IPITrib.ChildNodes['vBC'].Text;
       if Assigned(IPITrib.ChildNodes.FindNode('vIPI')) then ItensGrid.Cells[21,row] := IPITrib.ChildNodes['vIPI'].Text;
      end;

      // PIS

      PIS := imposto.ChildNodes.FindNode('PIS');
      PISAliq := PIS.ChildNodes.FindNode('PISAliq');
      if Assigned(PISAliq) then begin
       if Assigned(PISAliq.ChildNodes.FindNode('CST')) then ItensGrid.Cells[22,row] := PISAliq.ChildNodes['CST'].Text;
       if Assigned(PISAliq.ChildNodes.FindNode('pPIS')) then ItensGrid.Cells[23,row] := PISAliq.ChildNodes['pPIS'].Text;
       if Assigned(PISAliq.ChildNodes.FindNode('vBC')) then ItensGrid.Cells[24,row] := PISAliq.ChildNodes['vBC'].Text;
       if Assigned(PISAliq.ChildNodes.FindNode('vPIS')) then ItensGrid.Cells[25,row] := PISAliq.ChildNodes['vPIS'].Text;
      end;

      PISNT := PIS.ChildNodes.FindNode('PISNT');
      if Assigned(PISNT) then begin
       if Assigned(PISNT.ChildNodes.FindNode('CST')) then ItensGrid.Cells[22,row] := PISNT.ChildNodes['CST'].Text;
       ItensGrid.Cells[23,row] := '0.00';
       ItensGrid.Cells[24,row] := '0.00';
       ItensGrid.Cells[25,row] := '0.00';
      end;

      PISOutr := PIS.ChildNodes.FindNode('PISOutr');
      if Assigned(PISOutr) then begin
       if Assigned(PISOutr.ChildNodes.FindNode('CST')) then ItensGrid.Cells[22,row] := PISOutr.ChildNodes['CST'].Text;
       if Assigned(PISOutr.ChildNodes.FindNode('pPIS')) then ItensGrid.Cells[23,row] := PISOutr.ChildNodes['pPIS'].Text;
       if Assigned(PISOutr.ChildNodes.FindNode('vBC')) then ItensGrid.Cells[24,row] := PISOutr.ChildNodes['vBC'].Text;
       if Assigned(PISOutr.ChildNodes.FindNode('vPIS')) then ItensGrid.Cells[25,row] := PISOutr.ChildNodes['vPIS'].Text;
      end;

      // COFINS

      COFINS := imposto.ChildNodes.FindNode('COFINS');
      COFINSAliq := COFINS.ChildNodes.FindNode('COFINSAliq');
      if Assigned(COFINSAliq) then begin
       if Assigned(COFINSAliq.ChildNodes.FindNode('CST')) then ItensGrid.Cells[26,row] := COFINSAliq.ChildNodes['CST'].Text;
       if Assigned(COFINSAliq.ChildNodes.FindNode('pCOFINS')) then ItensGrid.Cells[27,row] := COFINSAliq.ChildNodes['pCOFINS'].Text;
       if Assigned(COFINSAliq.ChildNodes.FindNode('vCOFINS')) then ItensGrid.Cells[28,row] := COFINSAliq.ChildNodes['vCOFINS'].Text;
       if Assigned(COFINSAliq.ChildNodes.FindNode('vBC')) then ItensGrid.Cells[29,row] := COFINSAliq.ChildNodes['vBC'].Text;
      end;

      COFINSNT := COFINS.ChildNodes.FindNode('COFINSNT');
      if Assigned(COFINSNT) then begin
       if Assigned(COFINSNT.ChildNodes.FindNode('CST')) then ItensGrid.Cells[26,row] := COFINSNT.ChildNodes['CST'].Text;
       ItensGrid.Cells[27,row] := '0.00';
       ItensGrid.Cells[28,row] := '0.00';
       ItensGrid.Cells[29,row] := '0.00';
      end;

      COFINSOutr := COFINS.ChildNodes.FindNode('COFINSOutr');
      if Assigned(COFINSOutr) then begin
       if Assigned(COFINSOutr.ChildNodes.FindNode('CST')) then ItensGrid.Cells[26,row] := COFINSOutr.ChildNodes['CST'].Text;
       if Assigned(COFINSOutr.ChildNodes.FindNode('pCOFINS')) then ItensGrid.Cells[27,row] := COFINSOutr.ChildNodes['pCOFINS'].Text;
       if Assigned(COFINSOutr.ChildNodes.FindNode('vCOFINS')) then ItensGrid.Cells[28,row] := COFINSOutr.ChildNodes['vCOFINS'].Text;
       if Assigned(COFINSOutr.ChildNodes.FindNode('vBC')) then ItensGrid.Cells[29,row] := COFINSOutr.ChildNodes['vBC'].Text;
      end;

      // DIFAL

      ICMSUFDest := imposto.ChildNodes.FindNode('ICMSUFDest');
      if Assigned(ICMSUFDest) then begin
       if Assigned(ICMSUFDest.ChildNodes.FindNode('pFCPUFDest')) then ItensGrid.Cells[31,row] := ICMSUFDest.ChildNodes['pFCPUFDest'].Text;
       if Assigned(ICMSUFDest.ChildNodes.FindNode('vFCPUFDest')) then ItensGrid.Cells[32,row] := ICMSUFDest.ChildNodes['vFCPUFDest'].Text;
       if Assigned(ICMSUFDest.ChildNodes.FindNode('vBCFCPUFDest')) then ItensGrid.Cells[33,row] := ICMSUFDest.ChildNodes['vBCFCPUFDest'].Text;
       if Assigned(ICMSUFDest.ChildNodes.FindNode('vBCUFDest')) then ItensGrid.Cells[55,row] := ICMSUFDest.ChildNodes['vBCUFDest'].Text;
       if Assigned(ICMSUFDest.ChildNodes.FindNode('vICMSUFDest')) then ItensGrid.Cells[56,row] := ICMSUFDest.ChildNodes['vICMSUFDest'].Text;
       if Assigned(ICMSUFDest.ChildNodes.FindNode('pICMSUFDest')) then ItensGrid.Cells[58,row] := ICMSUFDest.ChildNodes['pICMSUFDest'].Text;
      end;

      if not Assigned(ICMSUFDest) then begin
       ItensGrid.Cells[31,row] := '0.00';
       ItensGrid.Cells[32,row] := '0.00';
       ItensGrid.Cells[33,row] := '0.00';
       ItensGrid.Cells[55,row] := '0.00';
       ItensGrid.Cells[56,row] := '0.00';
       ItensGrid.Cells[58,row] := '0.00';
       ItensGrid.Cells[56,row] := '0.00';
      end;
     end;
    end;

    if Assigned(ICMSTot) then begin
     if Assigned(ICMSTot.ChildNodes.FindNode('vBC')) then EdtvBC.Text := ICMSTot.ChildNodes['vBC'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vICMS')) then EdtvICMS.Text := ICMSTot.ChildNodes['vICMS'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vICMSDeson')) then EdtvICMSDeson.Text := ICMSTot.ChildNodes['vICMSDeson'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vICMSUFDest')) then EdtvICMSUFDest.Text := ICMSTot.ChildNodes['vICMSUFDest'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vFCP')) then EdtvFCP.Text := ICMSTot.ChildNodes['vFCP'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vBCST')) then EdtvBCST.Text := ICMSTot.ChildNodes['vBCST'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vST')) then EdtvST.Text := ICMSTot.ChildNodes['vST'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vFCPST')) then EdtvFCPST.Text := ICMSTot.ChildNodes['vFCPST'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vFCPSTRet')) then EdtvFCPSTRet.Text := ICMSTot.ChildNodes['vFCPSTRet'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vProd')) then EdtvProd.Text := ICMSTot.ChildNodes['vProd'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vFrete')) then EdtvFrete.Text := ICMSTot.ChildNodes['vFrete'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vSeg')) then EdtvSeg.Text := ICMSTot.ChildNodes['vSeg'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vDesc')) then EdtvDesc.Text := ICMSTot.ChildNodes['vDesc'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vIPI')) then EdtvIPI.Text := ICMSTot.ChildNodes['vIPI'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vIPIDevol')) then EdtvIPIDevol.Text := ICMSTot.ChildNodes['vIPIDevol'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vPIS')) then EdtvPIS.Text := ICMSTot.ChildNodes['vPIS'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vCOFINS')) then EdtvCOFINS.Text := ICMSTot.ChildNodes['vCOFINS'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vOutro')) then EdtvOutro.Text := ICMSTot.ChildNodes['vOutro'].Text;
     if Assigned(ICMSTot.ChildNodes.FindNode('vNF')) then EdtvNF.Text := ICMSTot.ChildNodes['vNF'].Text;
    end;

    if Assigned(ICMSUFDest) then begin
     if Assigned(ICMSUFDest.ChildNodes.FindNode('pICMSUFDest')) then EdtpICMSUFDest.Text := ICMSUFDest.ChildNodes['pICMSUFDest'].Text;
     if Assigned(ICMSUFDest.ChildNodes.FindNode('pFCPUFDest')) then EdtpFCPUFDest.Text := ICMSUFDest.ChildNodes['pFCPUFDest'].Text;
    end;

    ValorBCIPI := 0;
    ValorBCPIS := 0;
    ValorBCCOFINS := 0;
    ValorBCFCP := 0;
    ValorBCDIFAL := 0;
    for i := 1 to ItensGrid.RowCount - 1 do
    begin
     ValorBCIPI := ValorBCIPI + StrToFloatDef(StringReplace(ItensGrid.Cells[20, i], '.', ',', [rfReplaceAll]), 0);
     ValorBCPIS := ValorBCPIS + StrToFloatDef(StringReplace(ItensGrid.Cells[24, i], '.', ',', [rfReplaceAll]), 0);
     ValorBCCOFINS := ValorBCCOFINS + StrToFloatDef(StringReplace(ItensGrid.Cells[29, i], '.', ',', [rfReplaceAll]), 0);
     ValorBCFCP := ValorBCFCP + StrToFloatDef(StringReplace(ItensGrid.Cells[33, i], '.', ',', [rfReplaceAll]), 0);
     ValorBCDIFAL := ValorBCDIFAL + StrToFloatDef(StringReplace(ItensGrid.Cells[55, i], '.', ',', [rfReplaceAll]), 0);
    end;

    EdtvBCUFDest.Text := FormatFloat('#,##0.00', ValorBCDIFAL);
    EdtvBCFCPUFDest.Text := FormatFloat('#,##0.00', ValorBCFCP);
    EdtvBCIPI.Text := FormatFloat('#,##0.00', ValorBCIPI);
    EdtvBCPIS.Text := FormatFloat('#,##0.00', ValorBCPIS);
    EdtvBCCOFINS.Text := FormatFloat('#,##0.00', ValorBCCOFINS);
   end;
  finally
   Free;
  end;
end;

procedure TEntradaNFForm.EdtCodigoDepositoChange(Sender: TObject);
var codigo: string;
    I: Integer;
begin
 codigo := EdtCodigoDeposito.Text;
 with CadDepositoDM.qryConsultarDeposito do
 begin
  SQL.Clear;
  SQL.Add('select * from caddeposito where codigo = :codigo');
  Parambyname('codigo').AsString := codigo;
  Open;

  EdtDescricaoDeposito.Text := FieldByName('descricao').AsString;

  for i := 1 to ItensGrid.RowCount - 1 do
  begin
   ItensGrid.Cells[3,i] := codigo;
  end;
 end;
end;

procedure TEntradaNFForm.EdtCodigoEntidadeChange(Sender: TObject);
var codigo: string;
begin
 codigo := EdtCodigoEntidade.Text;

 with CadEntidadeDM.qryConsultarEntidade do
 begin
  SQL.Clear;
  SQL.Add('select * from cadentidade where codigo = :codigo');
  ParamByName('codigo').AsString := codigo;
  Open;

  EdtNomeEntidade.Text := FieldByName('nome').AsString;
 end;
end;

procedure TEntradaNFForm.EdtCodigoNaturezaChange(Sender: TObject);
var natureza: string;
    I: integer;
begin
 natureza := EdtCodigoNatureza.Text;

 with CadNaturezaDM.qryConsultarNatureza do
 begin
  SQL.Clear;
  SQL.Add('select * from cadnatureza where natureza = :natureza');
  ParamByName('natureza').AsString := natureza;
  Open;

  EdtDescricaoNatureza.Text := FieldbyName('descricao').AsString;
  for i := 1 to ItensGrid.RowCount - 1 do
  begin
   ItensGrid.Cells[8,i] := natureza
  end;
 end;
end;

procedure TEntradaNFForm.SBDepositoClick(Sender: TObject);
var codigo, descricao: string;
    I: integer;
begin
 with CadDepositoDM.qryConsultarDeposito do
 begin
  SQL.Clear;
  SQL.Add('select * from caddeposito where ativo = :ativo');
  Parambyname('ativo').AsString := 'S';
  Open;
 end;

 Application.CreateForm(TConsultarDeposito, ConsultarDeposito);
 codigo := ConsultarDeposito.SelecionarDeposito;
 if codigo <> '' then begin
  EdtCodigoDeposito.Text := codigo;
  descricao := ConsultarDeposito.descricao;
  EdtDescricaoDeposito.Text := Descricao;

  for i := 1 to ItensGrid.RowCount - 1 do
  begin
   ItensGrid.Cells[3,i] := codigo;
  end;
 end;
end;

procedure TEntradaNFForm.SBEntidadeClick(Sender: TObject);
var codigo, nome: string;
begin
 with CadEntidadeDM.qryConsultarEntidade do
 begin
  SQL.Clear;
  SQL.Add('select * from cadentidade where ativo = :ativo');
  Parambyname('ativo').AsString := 'S';
  Open;
 end;

 Application.CreateForm(TConsultarEntidade, ConsultarEntidade);
 codigo := ConsultarEntidade.SelecionarEntidade;
 if codigo <> '' then begin
  EdtCodigoEntidade.Text := codigo;
  nome := ConsultarEntidade.Nome;
  EdtNomeEntidade.Text := Nome;
 end;
end;

procedure TEntradaNFForm.SBNaturezaClick(Sender: TObject);
var natureza, descricao: string;
    I: integer;
begin
 with CadNaturezaDM.qryConsultarNatureza do
 begin
  SQL.Clear;
  SQL.Add('select * from cadnatureza where ativo = :ativo');
  Parambyname('ativo').AsString := 'S';
  Open;
 end;

 Application.CreateForm(TConsultarNatureza, ConsultarNatureza);
 natureza := ConsultarNatureza.SelecionarNatureza;
 if natureza <> '' then begin
  EdtCodigoNatureza.Text := natureza;
  descricao := ConsultarNatureza.descricao;
  EdtDescricaoNatureza.Text := Descricao;

  for i := 1 to ItensGrid.RowCount - 1 do
  begin
   ItensGrid.Cells[8,i] := natureza
  end;
 end;
end;

procedure TEntradaNFForm.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;

end.
