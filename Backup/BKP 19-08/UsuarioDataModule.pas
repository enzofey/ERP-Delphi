unit UsuarioDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TCadUsuarioDataModule = class(TDataModule)
    Conexão: TFDConnection;
    InserirQuery: TFDQuery;
    LoginQuery: TFDQuery;
    SenhaQuery: TFDQuery;
    FDQuery1: TFDQuery;
    dsUsuario: TDataSource;
	  PGLink: TFDPhysPgDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadUsuarioDataModule: TCadUsuarioDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
