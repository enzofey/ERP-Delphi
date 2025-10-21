unit MoedaDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TCadMoedaDM = class(TDataModule)
    Conex�o: TFDConnection;
    qryConsultarMoeda: TFDQuery;
    qrySelect: TFDQuery;
    dsCadMoeda: TDataSource;
    PGLink: TFDPhysPgDriverLink;
    qryUpdate: TFDQuery;
    qryInsert: TFDQuery;
    qryDelete: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadMoedaDM: TCadMoedaDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
