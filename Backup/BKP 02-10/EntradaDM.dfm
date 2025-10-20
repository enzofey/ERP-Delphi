object MovEntradaDM: TMovEntradaDM
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
  object InsertQuery: TFDQuery
    Connection = Conexão
    Left = 128
    Top = 104
  end
  object CBProduto: TFDQuery
    Active = True
    Connection = Conexão
    SQL.Strings = (
      
        'SELECT DISTINCT codigo FROM cadproduto where ativo='#39'S'#39' ORDER BY ' +
        'codigo')
    Left = 496
    Top = 72
  end
  object CBCor: TFDQuery
    Active = True
    Connection = Conexão
    SQL.Strings = (
      
        'SELECT DISTINCT descricao FROM cadcor where ativo='#39'S'#39' ORDER BY d' +
        'escricao')
    Left = 496
    Top = 200
  end
  object CBDeposito: TFDQuery
    Active = True
    Connection = Conexão
    SQL.Strings = (
      
        'SELECT DISTINCT codigo FROM caddeposito where ativo='#39'S'#39' ORDER BY' +
        ' codigo')
    Left = 496
    Top = 264
  end
  object CBTamanho: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      'SELECT ct.codigo FROM CadTamanho ct '
      
        'INNER JOIN CadFaixa cf ON CONCAT('#39' / '#39', cf.descricao, '#39' / '#39') LIK' +
        'E CONCAT('#39'% / '#39', ct.descricao, '#39' / %'#39')'
      'inner join cadproduto cp on (cp.faixa = cf.codigo)'
      'WHERE ct.ativo = '#39'S'#39' and cf.ativo = '#39'S'#39)
    Left = 496
    Top = 136
  end
  object SelectQuery: TFDQuery
    Connection = Conexão
    Left = 128
    Top = 184
  end
  object UpdateQuery: TFDQuery
    Connection = Conexão
    Left = 128
    Top = 248
  end
  object InsertProdMov: TFDQuery
    Connection = Conexão
    Left = 128
    Top = 312
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 96
    Top = 40
  end
end
