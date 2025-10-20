unit CEPDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TCadCepDataModule = class(TDataModule)
    Conexão: TFDConnection;
    ConsultarCEP: TFDQuery;
    dsCadCEP: TDataSource;
    SelectQuery: TFDQuery;
    PGLink: TFDPhysPgDriverLink;
    InsertQuery: TFDQuery;
    UpdateQuery: TFDQuery;
    DeleteQuery: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadCepDataModule: TCadCepDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
