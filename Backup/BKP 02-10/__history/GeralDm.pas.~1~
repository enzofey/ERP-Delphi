unit GeralDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TFatGeralDataModule = class(TDataModule)
    Conexão: TFDConnection;
    InsertNOTA: TFDQuery;
    SelectQuery: TFDQuery;
    InsertNOTAITEN: TFDQuery;
    UpdateEstoque: TFDQuery;
    InsertProdMov: TFDQuery;
    PGLink: TFDPhysPgDriverLink;
    SelectID_NOTA: TFDQuery;
    SelectFatura: TFDQuery;
    InsertNOTA_FATURA: TFDQuery;
    InsertRECEBER: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FatGeralDataModule: TFatGeralDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
