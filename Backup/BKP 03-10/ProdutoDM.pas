unit ProdutoDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TCadProdutoDM = class(TDataModule)
    Conexão: TFDConnection;
    qrySelect: TFDQuery;
    qryConsultarProduto: TFDQuery;
    dsConsultarProduto: TDataSource;
    qryUpdate: TFDQuery;
    qryInsert: TFDQuery;
    qryDelete: TFDQuery;
    qryDeleteProdMov: TFDQuery;
    qryDeleteEstoque: TFDQuery;
    PGLink: TFDPhysPgDriverLink;
    qryAcesso: TFDQuery;
    dsAcesso: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadProdutoDM: TCadProdutoDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
