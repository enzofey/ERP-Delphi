object CadPaisDM: TCadPaisDM
  Height = 480
  Width = 640
  object Conexão: TFDConnection
    Params.Strings = (
	  'server=192.168.1.23'
      'Database=00001P'
      'User_Name=postgres'
      'Password=evf'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object qryConsultarPais: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 32
    Top = 144
  end
  object SelectQuery: TFDQuery
    Connection = Conexão
    Left = 32
    Top = 80
  end
  object ConsultarPais: TDataSource
    DataSet = qryConsultarPais
    Left = 112
    Top = 144
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
  object UpdateQuery: TFDQuery
    Connection = Conexão
    Left = 176
    Top = 80
  end
  object InsertQuery: TFDQuery
    Connection = Conexão
    Left = 104
    Top = 80
  end
  object DeleteQuery: TFDQuery
    Connection = Conexão
    Left = 256
    Top = 80
  end
  object qryAcesso: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 32
    Top = 200
  end
  object dsAcesso: TDataSource
    DataSet = qryAcesso
    Left = 112
    Top = 200
  end
end
