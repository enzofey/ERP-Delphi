unit UnidadeDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TCadUnidadeDM = class(TDataModule)
    Conex�o: TFDConnection;
    SelectQuery: TFDQuery;
    UpdateQuery: TFDQuery;
    InsertQuery: TFDQuery;
    DeleteQuery: TFDQuery;
    ConsultarUnidade: TFDQuery;
    dsGridQuery: TDataSource;
    PGLink: TFDPhysPgDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadUnidadeDM: TCadUnidadeDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
