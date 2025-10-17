unit FaixaTamanhoDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TCadFaixaTamanhoDM = class(TDataModule)
    Conex�o: TFDConnection;
    ConsultarFaixa: TFDQuery;
    dsConsultarFaixa: TDataSource;
    InsertQuery: TFDQuery;
    ConsultarTamanho: TFDQuery;
    dsConsultarTamanho: TDataSource;
    PGLink: TFDPhysPgDriverLink;
    SelectQuery: TFDQuery;
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
  CadFaixaTamanhoDM: TCadFaixaTamanhoDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
