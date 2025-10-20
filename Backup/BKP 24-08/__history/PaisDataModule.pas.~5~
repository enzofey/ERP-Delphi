unit PaisDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TCadPaisDataModule = class(TDataModule)
    Conexão: TFDConnection;
    FDQuery1: TFDQuery;
    FDQuery: TFDQuery;
    dsCadPais: TDataSource;
    tbCadPais: TFDTable;
    tbCadPaisID: TFDAutoIncField;
    tbCadPaisPais: TStringField;
    tbCadPaisAtivo: TStringField;
    tbCadPaisSigla: TStringField;
    PGLink: TFDPhysPgDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadPaisDataModule: TCadPaisDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
