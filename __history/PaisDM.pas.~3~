unit PaisDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TCadPaisDM = class(TDataModule)
    Conexão: TFDConnection;
    ConsultarPais: TFDQuery;
    SelectQuery: TFDQuery;
    dsCadPais: TDataSource;
    PGLink: TFDPhysPgDriverLink;
    UpdateQuery: TFDQuery;
    InsertQuery: TFDQuery;
    DeleteQuery: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadPaisDM: TCadPaisDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
