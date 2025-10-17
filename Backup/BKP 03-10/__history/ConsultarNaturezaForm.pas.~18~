unit ConsultarNaturezaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls,
  NaturezaDM;

type
  TConsultarNatureza = class(TForm)
    Panel1: TPanel;
    Grid: TDBGrid;
    BtnSelecionarNatureza: TButton;
    procedure FormShow(Sender: TObject);
    procedure BtnSelecionarNaturezaClick(Sender: TObject);
  private
    NatNatureza: String;
    NatDescricao: String;
    NatAtivo: String;
    NatTipo: String;
    NatCST_ICMS: String;
    NatCSOSN: String;
    NatCST_IPI: String;
    NatENQ_IPI: String;
    NatCST_PIS: String;
    NatCST_COFINS: String;
    NatcBenef: String;
    NatcCredPres: String;
    NatAliq_icms: String;
    NatAliq_ipi: String;
    NatAliq_pis: String;
    NatAliq_cofins: String;
    NatAliq_Cred_Pres: String;
  public
   function SelecionarNatureza: string;
   function descricao: string;
   function natureza: string;
   function Ativo: string;
   function Tipo: string;
   function CST_ICMS: string;
   function CSOSN: string;
   function CST_IPI: string;
   function ENQ_IPI: string;
   function CST_PIS: string;
   function CST_COFINS: string;
   function cBenef: string;
   function cCredPres: string;
   function Aliq_icms: string;
   function aliq_ipi: string;
   function aliq_pis: string;
   function aliq_cofins: string;
   function Aliq_Cred_Pres: string;
  end;

var
  ConsultarNatureza: TConsultarNatureza;

implementation

{$R *.dfm}


procedure TConsultarNatureza.btnSelecionarNaturezaClick(Sender: TObject);
begin
  NatNatureza := CadNaturezaDM.ConsultarNatureza.FieldByName('natureza').AsString;
  NatDescricao := CadNaturezaDM.ConsultarNatureza.FieldByName('descricao').AsString;
  NatAtivo := CadNaturezaDM.ConsultarNatureza.FieldByName('ativo').AsString;
  NatTipo := CadNaturezaDM.ConsultarNatureza.FieldByName('tipo').AsString;
  NatCST_ICMS := CadNaturezaDM.ConsultarNatureza.FieldByName('CST_ICMS').AsString;
  NatCSOSN := CadNaturezaDM.ConsultarNatureza.FieldByName('CSOSN').AsString;
  NatCST_IPI := CadNaturezaDM.ConsultarNatureza.FieldByName('CST_IPI').AsString;
  NatENQ_IPI := CadNaturezaDM.ConsultarNatureza.FieldByName('ENQ_IPI').AsString;
  NatCST_PIS := CadNaturezaDM.ConsultarNatureza.FieldByName('CST_PIS').AsString;
  NatCST_COFINS := CadNaturezaDM.ConsultarNatureza.FieldByName('CST_COFINS').AsString;
  NatcBenef := CadNaturezaDM.ConsultarNatureza.FieldByName('cBenef').AsString;
  NatcCredPres := CadNaturezaDM.ConsultarNatureza.FieldByName('cCredPres').AsString;
  NatAliq_icms := CadNaturezaDM.ConsultarNatureza.FieldByName('aliq_icms').AsString;
  Nataliq_ipi := CadNaturezaDM.ConsultarNatureza.FieldByName('aliq_ipi').AsString;
  Nataliq_pis := CadNaturezaDM.ConsultarNatureza.FieldByName('aliq_pis').AsString;
  Nataliq_cofins := CadNaturezaDM.ConsultarNatureza.FieldByName('aliq_cofins').AsString;
  NatAliq_Cred_Pres := CadNaturezaDM.ConsultarNatureza.FieldByName('Aliq_Cred_Pres').AsString;
  Close;
end;

function TConsultarNatureza.SelecionarNatureza: string;
begin
  NatNatureza := '';
  ShowModal;
  Result := NatNatureza;
end;

function TConsultarNatureza.Natureza: string;
begin
  Result := NatNatureza;
end;

function TConsultarNatureza.Aliq_Cred_Pres: string;
begin
  Result := NatAliq_Cred_Pres;
end;

function TConsultarNatureza.Descricao: string;
begin
  Result := NatDescricao;
end;

function TConsultarNatureza.Aliq_icms: string;
begin
  Result := NatAliq_icms;
end;

function TConsultarNatureza.Aliq_pis: string;
begin
  Result := NatAliq_pis;
end;

function TConsultarNatureza.Aliq_cofins: string;
begin
  Result := NatAliq_cofins;
end;

function TConsultarNatureza.Aliq_ipi: string;
begin
  Result := NatAliq_ipi;
end;

function TConsultarNatureza.Ativo: string;
begin
  Result := NatAtivo;
end;

function TConsultarNatureza.CST_COFINS: string;
begin
  Result := NatCST_COFINS;
end;

function TConsultarNatureza.cBenef: string;
begin
  Result := NatcBenef;
end;

function TConsultarNatureza.cCredPres: string;
begin
  Result := NatcCredPres;
end;

function TConsultarNatureza.Tipo: string;
begin
  Result := NatTipo;
end;

function TConsultarNatureza.CST_ICMS: string;
begin
  Result := NatCST_ICMS;
end;

function TConsultarNatureza.CSOSN: string;
begin
  Result := NatCSOSN;
end;

function TConsultarNatureza.CST_IPI: string;
begin
  Result := NatCST_IPI;
end;

function TConsultarNatureza.ENQ_IPI: string;
begin
  Result := NatENQ_IPI;
end;

function TConsultarNatureza.CST_PIS: string;
begin
  Result := NatCST_PIS;
end;

procedure TConsultarNatureza.FormShow(Sender: TObject);
var I: Integer;
begin
 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;
end.
