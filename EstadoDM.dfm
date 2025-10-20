object CadEstadoDM: TCadEstadoDM
  Height = 564
  Width = 886
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
  object ConsultarEstado: TDataSource
    DataSet = qryConsultarEstado
    Left = 144
    Top = 136
  end
  object qryConsultarEstado: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 40
    Top = 136
  end
  object qrySelect: TFDQuery
    Connection = Conexão
    Left = 32
    Top = 80
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
  object qryInsert: TFDQuery
    Connection = Conexão
    Left = 104
    Top = 80
  end
  object qryUpdate: TFDQuery
    Connection = Conexão
    Left = 176
    Top = 80
  end
  object qryDelete: TFDQuery
    Connection = Conexão
    Left = 248
    Top = 80
  end
  object AcessoQuery: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 40
    Top = 200
  end
  object dsAcessoGrid: TDataSource
    DataSet = AcessoQuery
    Left = 120
    Top = 200
  end
end
