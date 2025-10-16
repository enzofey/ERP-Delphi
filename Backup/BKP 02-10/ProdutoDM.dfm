object CadProdutoDM: TCadProdutoDM
  Height = 534
  Width = 871
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
  object qrySelect: TFDQuery
    Connection = Conexão
    Left = 32
    Top = 80
  end
  object qryConsultarProduto: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 48
    Top = 192
  end
  object dsConsultarProduto: TDataSource
    DataSet = qryConsultarProduto
    Left = 168
    Top = 192
  end
  object qryUpdate: TFDQuery
    Connection = Conexão
    Left = 152
    Top = 80
  end
  object qryInsert: TFDQuery
    Connection = Conexão
    Left = 88
    Top = 80
  end
  object qryDelete: TFDQuery
    Connection = Conexão
    Left = 216
    Top = 80
  end
  object qryDeleteProdMov: TFDQuery
    Connection = Conexão
    Left = 48
    Top = 136
  end
  object qryDeleteEstoque: TFDQuery
    Connection = Conexão
    Left = 152
    Top = 136
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
  object qryAcesso: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 48
    Top = 248
  end
  object dsAcesso: TDataSource
    DataSet = qryAcesso
    Left = 112
    Top = 248
  end
end
