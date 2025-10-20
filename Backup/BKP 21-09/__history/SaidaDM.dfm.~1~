object MovSaidaDataModule: TMovSaidaDataModule
  Height = 480
  Width = 640
  object Conexão: TFDConnection
    Params.Strings = (
      'Database=00001P'
      'User_Name=postgres'
      'Password=evf'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object SelectQuery: TFDQuery
    Connection = Conexão
    Left = 128
    Top = 104
  end
  object CBProduto: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      'SELECT DISTINCT codigo FROM estoque ORDER BY codigo')
    Left = 496
    Top = 72
  end
  object CBCor: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      'SELECT DISTINCT cor FROM estoque ORDER BY cor')
    Left = 496
    Top = 200
  end
  object CBDeposito: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      'SELECT DISTINCT Deposito FROM estoque ORDER BY Deposito')
    Left = 496
    Top = 264
  end
  object CBTamanho: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      'SELECT ct.codigo FROM CadTamanho ct'
      
        'INNER JOIN CadFaixa cf ON CONCAT('#39' / '#39', cf.descricao, '#39' / '#39') LIK' +
        'E CONCAT('#39'% / '#39', ct.descricao, '#39' / %'#39')'
      'inner join cadproduto cp on (cp.faixa = cf.codigo)'
      'inner join estoque es on (es.tamanho = ct.descricao)'
      'WHERE ct.ativo = '#39'S'#39' and cf.ativo = '#39'S'#39)
    Left = 496
    Top = 136
  end
  object UpdateQuery: TFDQuery
    Connection = Conexão
    Left = 128
    Top = 168
  end
  object InsertQuery: TFDQuery
    Connection = Conexão
    Left = 128
    Top = 232
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 96
    Top = 32
  end
end
