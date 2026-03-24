unit GeralDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef, GlobalUnit;

type
  TFatGeralDM = class(TDataModule)
    Conexão: TFDConnection;
    InsertNOTA: TFDQuery;
    qrySelect: TFDQuery;
    InsertNOTAITEN: TFDQuery;
    UpdateEstoque: TFDQuery;
    InsertProdMov: TFDQuery;
    PGLink: TFDPhysPgDriverLink;
    SelectID_NOTA: TFDQuery;
    SelectFatura: TFDQuery;
    InsertNOTA_FATURA: TFDQuery;
    InsertRECEBER: TFDQuery;
    qryModoIPI: TFDQuery;
    qryModoICMS: TFDQuery;
    qryModoPIS: TFDQuery;
    qryModoCOFINS: TFDQuery;
    qryModoCSOSN: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FatGeralDM: TFatGeralDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TFatGeralDM.DataModuleCreate(Sender: TObject);
begin
 ConfigurarConexao(Conexão);
end;

end.
