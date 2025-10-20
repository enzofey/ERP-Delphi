unit ConsultarCSTIPIForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  CSTIPIDataModule;

type
  TConsultarCSTIPI = class(TForm)
    Panel1: TPanel;
    btnSelecionarCSTIPI: TButton;
    Grid: TDBGrid;
    procedure btnSelecionarCSTIPIClick(Sender: TObject);
  private
    CstIPI: string;
  public
    function SelecionarCstIPI: string;
  end;

var
  ConsultarCSTIPI: TConsultarCSTIPI;

implementation

{$R *.dfm}

Function TConsultarCSTIPI.SelecionarCstIPI: string;
begin
  CstIPI := '';
  ShowModal;
  Result := CstIPI;
end;

procedure TConsultarCSTIPI.btnSelecionarCSTIPIClick(Sender: TObject);
begin
  CstIPI := CadCSTIPIDataModule.GridQuery.FieldByName('CST').AsString;
  Close;
end;
end.
