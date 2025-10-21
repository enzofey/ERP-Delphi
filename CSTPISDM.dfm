object CadCSTPISDM: TCadCSTPISDM
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
  object qrySelect: TFDQuery
    Connection = Conexão
    Left = 32
    Top = 80
  end
  object qryUpdate: TFDQuery
    Connection = Conexão
    Left = 184
    Top = 80
  end
  object qryInsert: TFDQuery
    Connection = Conexão
    Left = 104
    Top = 80
  end
  object qryConsultarCSTPIS: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 40
    Top = 144
  end
  object dsCSTPIS: TDataSource
    DataSet = qryConsultarCSTPIS
    Left = 128
    Top = 144
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
  object qryDelete: TFDQuery
    Connection = Conexão
    Left = 264
    Top = 80
  end
end
