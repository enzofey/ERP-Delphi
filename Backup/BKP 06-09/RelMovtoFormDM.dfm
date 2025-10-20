object RelMovtoDM: TRelMovtoDM
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
  object dsProdMov: TDataSource
    DataSet = ConsultarProdMov
    Left = 144
    Top = 88
  end
  object ConsultarProdMov: TFDQuery
    Connection = Conexão
    Left = 48
    Top = 88
  end
  object EstornarQuery: TFDQuery
    Connection = Conexão
    Left = 40
    Top = 248
  end
  object IDQuery: TFDQuery
    Connection = Conexão
    Left = 144
    Top = 248
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
end
