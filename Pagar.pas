unit Pagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  PagarDM, ConsultarFaturaForm,
  MoedaDM, ConsultarMoedaForm,
  EntidadeDM, ConsultarEntidadeForm,
  EntradaNFDM;

type
  TPagarForm = class(TForm)
    Panel1: TPanel;
    Pages: TPageControl;
    Acesso: TTabSheet;
    dtEmissaoIni: TLabel;
    dtEmissaoFim: TLabel;
    lblNumero: TLabel;
    lblEntidade: TLabel;
    lblVenctoIni: TLabel;
    lblVenctoFim: TLabel;
    lblValorIni: TLabel;
    lblValorFim: TLabel;
    SBEntidade: TSpeedButton;
    lblFatura: TLabel;
    SBFatura: TSpeedButton;
    lblMoeda: TLabel;
    SBMoeda: TSpeedButton;
    EdtNumero: TEdit;
    DTPEmissaoIni: TDateTimePicker;
    DTPEmissaoFim: TDateTimePicker;
    DTPVenctoIni: TDateTimePicker;
    DTPVenctoFim: TDateTimePicker;
    EdtValorIni: TEdit;
    EdtValorFim: TEdit;
    Grid: TDBGrid;
    btnFechar: TButton;
    EdtFatura: TEdit;
    btnConsultar: TButton;
    EdtCodigoEntidade: TEdit;
    EdtEntidade: TEdit;
    EdtMoeda: TEdit;
    EdtDescricaoMoeda: TEdit;
    Manutencao: TTabSheet;
    lblNumeroDUPL: TLabel;
    lblEntidadeDUPL: TLabel;
    lblFaturaDUPL: TLabel;
    lbldtEmissaoDUPL: TLabel;
    lbldtVenctoDUPL: TLabel;
    lblMoedaDUPL: TLabel;
    lblParcelaDUPL: TLabel;
    lblSTATUSDUPL: TLabel;
    EdtNumeroDUPL: TEdit;
    DTPdtEmiDUPL: TDateTimePicker;
    EdtCodigoEntidadeDUPL: TEdit;
    DTPdtVenctoDUPL: TDateTimePicker;
    EdtFaturaDUPL: TEdit;
    EdtEntidadeDUPL: TEdit;
    EdtMoedaDUPL: TEdit;
    EdtDescricaoMoedaDUPL: TEdit;
    EdtNumeroParcelaDUPL: TEdit;
    GBValores: TGroupBox;
    lblValorTotalDUPL: TLabel;
    lblValorPagoDUPL: TLabel;
    lblValorParcelaDUPL: TLabel;
    EdtValorFaturaDUPL: TEdit;
    EdtValorPagoDUPL: TEdit;
    EdtValorParcelaDUPL: TEdit;
    procedure btnConsultarClick(Sender: TObject);
    procedure EdtMoedaChange(Sender: TObject);
    procedure EdtCodigoEntidadeChange(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure SBMoedaClick(Sender: TObject);
    procedure SBEntidadeClick(Sender: TObject);
    procedure SBFaturaClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure EdtMoedaDUPLChange(Sender: TObject);
    procedure EdtCodigoEntidadeDUPLChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagarForm: TPagarForm;

implementation

{$R *.dfm}

procedure TPagarForm.btnConsultarClick(Sender: TObject);
var dtEmissaoFim, dtEmissaoIni, dtVenctoIni, dtVenctoFim: tdate;
    codcli, numero, Fatura, moeda: string;
    ValorIni, ValorFim: double;
    temwhere: boolean;
    I: integer;
begin
 dtEmissaoIni := DTPemissaoIni.Date;
 dtEmissaoFim := DTPemissaoFim.Date;
 dtVenctoIni := DTPVenctoIni.Date;
 dtVenctoFim := DTPVenctoFim.Date;
 codcli := EdtCodigoEntidade.Text;
 Numero := EdtNumero.Text;
 Fatura := EdtFatura.Text;
 Moeda := EdtMoeda.text;

 with PagarDataModule.ConsultarPagar do
 begin
  SQL.Clear;
  SQL.Add('select * from pagar');
  temwhere := false;

  if dtEmissaoIni <> 0 then begin
   if temwhere then begin
    SQL.Add('and dtemissao >= :dtEmissaoIni');
   end
   else begin
    SQL.Add('where dtemissao >= :dtEmissaoIni');
    temwhere := true;
   end;
   Parambyname('dtEmissaoIni').AsDate := dtEmissaoIni;
  end;

  if dtEmissaoFim <> 0 then begin
   if temwhere then begin
    SQL.Add('and dtemissao <= :dtEmissaoFim');
   end
   else begin
    SQL.Add('where dtemissao <= :dtEmissaoFim');
    temwhere := true;
   end;
   Parambyname('dtEmissaoFim').AsDate := dtEmissaoFim;
  end;

  if dtVenctoIni <> 0 then begin
   if temwhere then begin
    SQL.Add('and dtVencto >= :dtVenctoIni');
   end
   else begin
    SQL.Add('where dtVencto >= :dtVenctoIni');
    temwhere := true;
   end;
   Parambyname('dtVenctoIni').AsDate := dtVenctoIni;
  end;

  if dtVenctoIni <> 0 then begin
   if temwhere then begin
    SQL.Add('and dtVencto <= :dtVenctoFim');
   end
   else begin
    SQL.Add('where dtVencto <= :dtVenctoFim');
    temwhere := true;
   end;
   Parambyname('dtVenctoFim').AsDate := dtVenctoFim;
  end;

  if codcli <> '' then begin
   if temwhere then begin
    SQL.Add('and codcli = :codcli');
   end
   else begin
   SQL.Add('where codcli = :codcli');
   temwhere := true;
   end;
  ParamByName('codcli').AsString := codcli;
  end;

  if numero <> '' then begin
   if temwhere then begin
    SQL.Add('and numero = :numero');
   end
   else begin
   SQL.Add('where numero = :numero');
   temwhere := true;
   end;
  ParamByName('numero').AsString := numero;
  end;

  if fatura <> '' then begin
   if temwhere then begin
    SQL.Add('and fatura = :fatura');
   end
   else begin
   SQL.Add('where fatura = :fatura');
   temwhere := true;
   end;
  ParamByName('fatura').AsString := fatura;
  end;

  if moeda <> '' then begin
   if temwhere then begin
    SQL.Add('and moeda = :moeda');
   end
   else begin
   SQL.Add('where moeda = :moeda');
   temwhere := true;
   end;
  ParamByName('moeda').AsString := moeda;
  end;

  if EdtValorIni.Text <> '' then begin
   if temwhere then begin
    SQL.Add('and Valor >= :ValorIni');
   end
   else begin
   SQL.Add('where Valor >= :ValorIni');
   temwhere := true;
   end;
  ParamByName('ValorIni').AsFloat := StrToFloat(EdtValorIni.Text);
  end;

  if EdtValorFim.Text <> '' then begin
   if temwhere then begin
    SQL.Add('and Valor <= :ValorFim');
   end
   else begin
   SQL.Add('where Valor <= :ValorFim');
   temwhere := true;
   end;
  ParamByName('ValorFim').AsFloat := StrToFloat(EdtValorFim.Text);
  end;
  Open;
  for i := 0 to Grid.Columns.Count - 1 do
   Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
 end;
end;

procedure TPagarForm.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;

procedure TPagarForm.GridCellClick(Column: TColumn);
begin
 Pages.ActivePage := Manutencao;
 with PagarDataModule.ConsultarPagar do
 begin
  EdtFaturaDUPL.Text := FieldByName('fatura').AsString;
  EdtCodigoEntidadeDUPL.Text := FieldByName('codcli').AsString;
  EdtnumeroDUPL.Text := FieldByName('numero').AsString;
  DTPdtVenctoDUPL.Date := FieldByName('dtVencto').AsDateTime;
  DTPdtEmiDUPL.Date := FieldByName('dtEmissao').AsDateTime;
  EdtMoedaDUPL.Text := FieldByName('moeda').AsString;
  EdtValorFaturaDUPL.text := FieldByName('valor').AsString;
  EdtValorPagoDUPL.Text := FieldByName('valor_pago').AsString;
  EdtNumeroParcelaDUPL.Text := FieldByName('parcela').AsString;
  EdtValorParcelaDUPL.Text := FieldByName('valor_parcela').AsString;
  lblSTATUSDUPL.Caption := FieldByName('status').AsString;
 end;
end;

procedure TPagarForm.SBEntidadeClick(Sender: TObject);
var codigo, nome: string;
begin
 with CadEntidadeDM.qryConsultarEntidade do
 begin
  SQL.Clear;
  SQL.Add('select * from cadentidade');
  Open;
 end;

 Application.CreateForm(TConsultarEntidade, ConsultarEntidade);
 codigo := ConsultarEntidade.SelecionarEntidade;

 if codigo <> '' then begin
 EdtCodigoEntidade.text := codigo;
 nome := ConsultarEntidade.nome;
 EdtEntidade.Text := nome;
 end;
end;

procedure TPagarForm.EdtCodigoEntidadeChange(Sender: TObject);
var codigo: string;
begin
 codigo := EdtCodigoEntidade.Text;
 with CadEntidadeDM.qryConsultarEntidade do
 begin
  SQL.Clear;
  SQL.Add('select * from cadentidade where codigo = :codigo');
  Parambyname('codigo').AsString := codigo;
  Open;

  EdtCodigoEntidade.Text := codigo;
  EdtEntidade.Text := Fieldbyname('nome').AsString;
 end;
end;

procedure TPagarForm.EdtCodigoEntidadeDUPLChange(Sender: TObject);
var codigo: string;
begin
 codigo := EdtCodigoEntidadeDUPL.Text;
 with CadEntidadeDM.qryConsultarEntidade do
 begin
  SQL.Clear;
  SQL.Add('select * from cadentidade where codigo = :codigo');
  Parambyname('codigo').AsString := codigo;
  Open;

  EdtEntidadeDUPL.Text := Fieldbyname('nome').AsString;
 end;
end;

procedure TPagarForm.SBFaturaClick(Sender: TObject);
var fatura: string;
begin
 with EntradaNFeDM.qryConsultarNotaEntrada do
 begin
  SQL.Clear;
  SQL.Add('select * from nota_entrada');
  Open;
 end;

 Application.CreateForm(TConsultarFatura, ConsultarFatura);
 fatura := ConsultarFatura.SelecionarFatura;

 if fatura <> '' then begin
  EdtFatura.Text := fatura;
 end;
end;

procedure TPagarForm.SBMoedaClick(Sender: TObject);
var codigo, descricao: string;
begin
 with CadMoedaDM.qryConsultarMoeda do
 begin
  SQL.Clear;
  SQL.Add('select * from cadmoeda');
  Open;
 end;

 Application.CreateForm(TConsultarMoeda, ConsultarMoeda);
 codigo := ConsultarMoeda.SelecionarMoeda;

 if codigo <> '' then begin
  EdtMoeda.Text := codigo;
  descricao := ConsultarMoeda.Descricao;
  EdtDescricaoMoeda.Text := Descricao;
 end;
end;

procedure TPagarForm.EdtMoedaChange(Sender: TObject);
var codigo: string;
begin
 codigo := EdtMoeda.Text;
 with CadMoedaDM.qryConsultarMoeda do
 begin
  SQL.Clear;
  SQL.Add('select * from cadmoeda where codigo = :codigo');
  Parambyname('codigo').AsString := codigo;
  Open;

  EdtDescricaoMoeda.Text := Fieldbyname('descricao').AsString;
 end;
end;

procedure TPagarForm.EdtMoedaDUPLChange(Sender: TObject);
var codigo: string;
begin
 codigo := EdtMoedaDUPL.Text;
 with CadMoedaDM.qryConsultarMoeda do
 begin
  SQL.Clear;
  SQL.Add('select * from cadmoeda where codigo = :codigo');
  Parambyname('codigo').AsString := codigo;
  Open;

  EdtDescricaoMoedaDUPL.Text := Fieldbyname('descricao').AsString;
 end;
end;
end.
