unit EditorSQLFormDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TEditorSQLDM = class(TDataModule)
    Conexão: TFDConnection;
    qrySelect: TFDQuery;
    dsEditorSQL: TDataSource;
    TablesBanco: TFDQuery;
    dsTablesBanco: TDataSource;
    PGLink: TFDPhysPgDriverLink;
    qryExec: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditorSQLDM: TEditorSQLDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
