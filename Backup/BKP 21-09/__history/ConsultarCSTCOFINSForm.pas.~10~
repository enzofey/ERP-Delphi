unit ConsultarCSTCOFINSForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  CSTCOFINSDataModule;

type
  TConsultarCSTCOFINS = class(TForm)
    Panel1: TPanel;
    btnSelecionarCSTCOFINS: TButton;
    Grid: TDBGrid;
    procedure btnSelecionarCSTCOFINSClick(Sender: TObject);
  private
    CofinsCST: string;
  public
    function SelecionarCofinsCST: string;
  end;

var
  ConsultarCSTCOFINS: TConsultarCSTCOFINS;

implementation

{$R *.dfm}

function TConsultarCSTCOFINS.SelecionarCofinsCST: string;
begin
 CofinsCST := '';
 ShowModal;
 Result := CofinsCST;
end;

procedure TConsultarCSTCOFINS.btnSelecionarCSTCOFINSClick(Sender: TObject);
begin
  CofinsCST := CadCSTCOFINSDataModule.ConsultarCSTCOFINS.FieldByName('CST').AsString;
  Close;
end;
end.
