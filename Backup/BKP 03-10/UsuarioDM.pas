unit UsuarioDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TCadUsuarioDM = class(TDataModule)
    Conexão: TFDConnection;
    InsertQuery: TFDQuery;
    LoginQuery: TFDQuery;
    SenhaQuery: TFDQuery;
    ConsultarUsuario: TFDQuery;
    dsUsuario: TDataSource;
	  PGLink: TFDPhysPgDriverLink;
    UpdateQuery: TFDQuery;
    DeleteQuery: TFDQuery;
    qryGrid: TFDQuery;
    dsGrid: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadUsuarioDM: TCadUsuarioDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
