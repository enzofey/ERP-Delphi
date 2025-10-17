unit ConsultarFaturaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  ImpressaoNFEDataModule;

type
  TConsultarFatura = class(TForm)
    Panel1: TPanel;
    btnSelecionarFatura: TButton;
    Grid: TDBGrid;
    procedure btnSelecionarFaturaClick(Sender: TObject);
  private
    NotaFatura: string;
  public
    function fatura: string;
    function SelecionarFatura: string;
  end;

var
  ConsultarFatura: TConsultarFatura;

implementation

{$R *.dfm}

function TConsultarFatura.SelecionarFatura: string;
begin
 NotaFatura:= '';
 ShowModal;
 Result:= NotaFatura;
end;

procedure TConsultarFatura.btnSelecionarFaturaClick(Sender: TObject);
begin
  NotaFatura := ImpressaoNFEFormDataModule.ConsultarFatura.FieldByName('fatura').AsString;
  Close;
end;

function TConsultarFatura.fatura: string;
begin
  Result:=NotaFatura
end;
end.
