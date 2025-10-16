unit RelEstoqueDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TEstoqueDataModule = class(TDataModule)
    Conexão: TFDConnection;
    QueryEstoque: TFDQuery;
    dsEstoque: TDataSource;
    tbEstoque: TFDTable;
    tbEstoqueID: TFDAutoIncField;
    tbEstoqueCodigo: TStringField;
    tbEstoqueTamanho: TStringField;
    tbEstoqueCor: TStringField;
    tbEstoqueDeposito: TStringField;
    tbEstoqueLote: TStringField;
    tbEstoqueQtde: TStringField;
    PGLink: TFDPhysPgDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EstoqueDataModule: TEstoqueDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
