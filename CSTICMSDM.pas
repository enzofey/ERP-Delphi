unit CSTICMSDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TCadCSTICMSDM = class(TDataModule)
    Conexão: TFDConnection;
    SelectQuery: TFDQuery;
    UpdateQuery: TFDQuery;
    InsertQuery: TFDQuery;
    qryConsultarCSTICMS: TFDQuery;
    dsCSTICMS: TDataSource;
    PGLink: TFDPhysPgDriverLink;
    DeleteQuery: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadCSTICMSDM: TCadCSTICMSDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
