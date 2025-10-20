unit CorDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TCadCorDM = class(TDataModule)
    Conexão: TFDConnection;
    SelectQuery: TFDQuery;
    ConsultarCor: TFDQuery;
    dsCadCor: TDataSource;
    CorEstoque: TFDQuery;
    dsCorEstoque: TDataSource;
	PGLink: TFDPhysPgDriverLink;
    InsertQuery: TFDQuery;
    UpdateQuery: TFDQuery;
    DeleteQuery: TFDQuery;
    AcessoQuery: TFDQuery;
    dsAcesso: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadCorDM: TCadCorDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
